package kr.co.babmukja.member.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.babmukja.member.service.MemberService;
import kr.co.babmukja.repository.domain.MailHandler;
import kr.co.babmukja.repository.domain.Member;
import kr.co.babmukja.repository.domain.MemberFileVO;
import kr.co.babmukja.repository.domain.RecipeFollow;
import kr.co.babmukja.repository.domain.Scrapbook;
import kr.co.babmukja.repository.domain.ScrapbookFileVO;
import net.coobird.thumbnailator.Thumbnails;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller("kr.co.babmukja.member.controller.MemberController")
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService service;

	@Autowired
	private BCryptPasswordEncoder passEncoder; // 암호화

	@Autowired
	private JavaMailSender mailSender; // 이메일 인증
	
	@Autowired 
	private KakaoApi kka; // 카카오톡

	String cert = RandomNum(); // 인증번호 랜덤 생성

	// 로그인
	@RequestMapping("/loginform.do")
	public void loginForm() {
	}

	// 로그인 처리
	@RequestMapping("/login.do")
	@ResponseBody
	public Map login(Member member, HttpSession session) {
		HashMap<String,Integer> map = new HashMap<>();
		String pass = passEncoder.encode(member.getMemPass());
		Member mem = service.selectLogin(member);
		if(mem == null) {
			// 잘못된 아이디일 때
			map.put("code",1);
			return map;
		}
		boolean passMatch = passEncoder.matches(member.getMemPass(), mem.getMemPass());

		if (mem != null && passMatch) {
			if (mem.getVerify() == '0') {
				// 회원 이메일 인증 안했을 때
				map.put("code", 2);
				return map;
			} else {
				// 회원 이메일 인증 했을 때
				session.setAttribute("user", mem);
			}
			map.put("code", 0);
			return map;
		} else {
			// 로그인 실패했을 때
			map.put("code", 3);
			return map;
		}
	}
	
	// 카카오 로그인 처음 했을 때
	@RequestMapping("/socialsignup.do")
	public String signupSocial(HttpSession session, Member member, Model model) {
		try {
			service.insertSocialMember(member); // 회원가입
			
			Member mem = service.selectLogin(member);
			session.setAttribute("user", mem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/recipe/main.do";
	}

	// 카카오 로그인 폼
	@RequestMapping("/socialsignupform.do")
	public void signupSocialForm(HttpSession session, Member member, Model model) {
		// DB에 저장
		model.addAttribute("memName", member.getMemName());
		model.addAttribute("memEmail", member.getMemEmail());
		model.addAttribute("socialAt", member.getSocialAt());
		model.addAttribute("profileImageUrl", member.getProfileImageUrl());
		model.addAttribute("thumbnailUrl", member.getThumbnailUrl());
	}

	// 카카오 로그인 처리
	@RequestMapping("/sociallogin.do")
	public String socialLogin(HttpSession session, Member member) {
		Member mem = service.selectLogin(member);
		mem.setAccessToken(member.getAccessToken());
		session.setAttribute("user", mem);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/recipe/main.do";
	}

	// 카카오 이메일 중복체크
	@RequestMapping("/checksocialemail.do")
	@ResponseBody
	public int checkSocialEmail(String memEmail) {
		// 소셜 로그인 이메일이라면 -> result 1
		// 처음은 0
		Member mem = service.selectCheckSocialAt(memEmail);
		int result = 0;
		if(mem != null) {
			result = 1;
		}
		return result;
	}

	// 로그아웃 처리
	@RequestMapping("/logout.do")
	public String logOut(HttpSession session) {
		Member mem = (Member)session.getAttribute("user");
		try {
			kka.kakaoLogout(mem.getAccessToken());
		}catch(Exception e) {
			e.printStackTrace();
		}
		session.removeAttribute("user");
		session.invalidate(); // 세션 삭제
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/recipe/main.do";
	}

	// 회원가입 폼
	@RequestMapping("/signupform.do")
	public void signUpForm() {
	}

	// 회원가입 처리
	@RequestMapping("/signup.do")
	public String signUp(Member member) throws UnsupportedEncodingException, MessagingException {

		// 암호화
		String inputPass = member.getMemPass();
		String pass = passEncoder.encode(inputPass);
		member.setMemPass(pass);

		service.insertMember(member);

		// 이메일 인증
		MailHandler sendMail = new MailHandler(mailSender);
		StringBuffer sb = new StringBuffer();
		sendMail.setSubject("[밥먹자] 이메일 인증");
		sendMail.setText(sb.append("<h2>밥먹자 메일인증 입니다♬<br> 아래 링크를 눌러서 이메일 인증을 해주세요.</h2>")
				.append("<a href='http://192.168.0.53/babmukja/member/confirm.do?MemEmail=" + member.getMemEmail())
				.append(" 'target='_blank'>밥먹자 이메일 인증하기</a>").toString());
		sendMail.setFrom("babmukja@babmukja.com", "밥먹자");
		sendMail.setTo(member.getMemEmail());
		ExecutorService executor = Executors.newWorkStealingPool();

		// 멀티쓰레드 -> 이메일 보내는 시간이 오래걸리니까
		executor.execute(() -> {
			try {
				sendMail.send();
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
		// System.out.println(sb.toString());

		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/member/emailform.do";
	}

	// 우편번호
	@RequestMapping("/jusopopup.do")
	public void jusoPopUp() {
	}

	// 이메일 인증
	@RequestMapping("/emailform.do")
	public void emailForm() {
	}

	// 이메일 인증확인
	@RequestMapping("/emailcheck.do")
	public void emailCheck() {
	}

	// 이메일 확인
	@RequestMapping("/confirm.do")
	public String mSuccess(Member member) {

		// 이메일 인증하면 1로 변경
		member.setMemEmail(member.getMemEmail());
		service.updateEmailVerify(member.getMemEmail());
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/member/emailcheck.do";
	}

	// 닉네임 중복체크
	@RequestMapping("/checknickname.do")
	@ResponseBody
	public int checkNickName(String memNickname) {
		return service.selectCheckNickName(memNickname);
	}

	// 이메일 중복체크
	@RequestMapping("/checkemail.do")
	@ResponseBody
	public int checkEmail(String memEmail) {
		return service.selectCheckEmail(memEmail);
	}

	// 전화번호 중복체크
	@RequestMapping("/checkphone.do")
	@ResponseBody
	public int checkPhone(String memPhone) {
		return service.selectCheckPhone(memPhone);
	}

	// 아이디 찾기
	@RequestMapping("/searchid.do")
	public void searchIdForm() {
	}

	// 아이디 찾기 처리
	@RequestMapping("/findid.do")
	@ResponseBody
	public String searchId(Member member) {
		return service.selectSearchId(member);
	}

	// 비밀번호 찾기폼
	@RequestMapping("/searchpass.do")
	public void searchPass() {
	}

	// 비밀번호 인증메일
	@RequestMapping("/passmail.do")
	@ResponseBody
	public void passMail(Member member) throws UnsupportedEncodingException, MessagingException {
		MailHandler sendMail = new MailHandler(mailSender);
		StringBuffer sb = new StringBuffer();

		// Subject -> 제목
		// Text -> 내용
		// From -> 보내는 메일 주소
		// To -> 받는 메일 주소
		sendMail.setSubject("[밥먹자] 이메일 인증번호");
		sendMail.setText(sb.append("<h2>밥먹자 이메일 인증번호 입니다!</h2>").append("밥먹자 이메일 인증번호는 " + '[' + cert + ']' + " 입니다.").toString());
		sendMail.setFrom("babmukja@babmukja.com", "밥먹자");
		sendMail.setTo(member.getMemEmail());

		// 멀티 쓰레드 사용
		ExecutorService executor = Executors.newWorkStealingPool();
		executor.execute(() -> {
			try {
				sendMail.send();
			} catch (Exception e) {
				e.printStackTrace();
			}
		});
		// System.out.println(sb.toString());

		// 인증번호 값 DB에 넣기
		member.setCertification(Integer.parseInt(cert));
		service.updateCertification(member);
	}

	// 인증번호 랜덤숫자 생성
	public static String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 5; i++) {
			
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}

	@RequestMapping("/smssend.do")
	@ResponseBody
	// sms 인증번호 전송
	/**
	 * @class ExampleSend
	 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API
	 *        PHP
	 */
	public void smsSend(Member member) {
		String api_key = "NCSXPNU9OHH2KJA8";
		String api_secret = "0BKWWJIMBI34EVLENVH5GS3CZ9EFZPCZ";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", member.getMemPhone());
		params.put("from", "01051369426");
		params.put("type", "SMS");
		params.put("text", "안녕하세요 밥먹자 인증메일 입니다. 인증번호는 [" + cert + "] 입니다.");
		params.put("app_version", "test app 1.2"); // application name and version

		member.setCertification(Integer.parseInt(cert));
		service.updateCertification(member);

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			// System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			// System.out.println(e.getMessage());
			// System.out.println(e.getCode());
		}
	}

	// sms 인증번호 확인
	@RequestMapping("/checknum.do")
	@ResponseBody
	public int certificationCheck(Member member) {
		return service.selectConfirmCertification(member);
	}

	// 이메일 인증번호 확인
	@RequestMapping("/emailchecknum.do")
	@ResponseBody
	public int emailcertificationCheck(Member member) {
		int memNo = service.selectMemnoByEmail(member.getMemEmail());
		int cerNo = service.selectConfirmCertificationByEmail(memNo);
		// cerNo 비교.. 사용자가 input 창에 입력한 값과 비교 맞으면 return 1 틀리면 return 0
		// cerNo => DB 컬럼에 certification 의 값
		// member.getCertification => 사용자가 입력한 input창의 값
		if (member.getCertification() == cerNo) {
			return 1;
		} else {
			return 0;
		}
	}

	// 비밀번호 재설정 (이메일)
	@RequestMapping("/resetpass.do")
	public void resetPass(Member member, Model model) {
		model.addAttribute("email", member.getMemEmail());
		model.addAttribute("memPhone", member.getMemPhone());
	}
	

	// 비밀번호 재설정(암호화)
	@RequestMapping("/repass.do")
	public String rePass(Member member) {
		// 암호화
		String inputPass = member.getMemPass();
		String pass = passEncoder.encode(inputPass);
		member.setMemPass(pass);

		service.updateResetPass(member);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/member/loginform.do";
	}

	

	// 회원 수정
	@RequestMapping("/membermodify.do")
	public void memberModify( ) {
		
	}
	
	// 비밀번호 변경
	@RequestMapping("/changepass.do")
	public void changePass() {
		
	}
	
	//--------------------------우중----------------------------------------//
	@RequestMapping("/searchmember.do")
	@ResponseBody
	public List<Member> searchMemberByNick(String nick) {
		return service.searchMemberByNick(nick);
	}
	
	@RequestMapping("/mypage.do")
	public ModelAndView myPage(Member member,ModelAndView model,HttpSession session) {
		Member user = (Member) session.getAttribute("user");
		
		if (user != null) {
			Member searchUser = service.searchMemberByNickForMypage( member.getMemNickname() );
			
			RecipeFollow follow = new RecipeFollow();
			follow.setFollowMemNo(searchUser.getMemNo());
			follow.setFollowerMemNo(user.getMemNo());
			
			String status = service.selectFollowStatus(follow);
			if(searchUser.getMemNo() == user.getMemNo()) {				
				model.addObject("followStatus",  "M");
			}else if(status == null && searchUser.getMemNo() != user.getMemNo()){				
				model.addObject("followStatus",  "N");				
			}else if(status != null ){
				model.addObject("followStatus",  status);				
			}
			model.addObject("user", searchUser);
			model.setViewName("member/mypage");
		}else {
			model.setViewName("member/loginform");
		}
		return model;
	}
	
	
	@RequestMapping("/upload.do")
	@ResponseBody
	public String profileUpload(MemberFileVO fileVO,HttpSession session) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String uploadRoot = "C:/bit2019/upload";
		String path = "/member" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false)
			file.mkdirs();
		
		MultipartFile mFile = fileVO.getAttach();
		
		if (mFile.isEmpty()) {
		}
		
		String uName = UUID.randomUUID().toString() + mFile.getOriginalFilename();
		mFile.transferTo(new File(uploadRoot + path + "/" + uName));
		
		Thumbnails.of(new File(file.getPath(),uName))
		.size(400,400)
		.outputFormat("jpg")
		.toFile(new File(file.getPath(),"_thumb_"+uName));
		
		Member member = new Member();
		member.setMemImgOrgname(mFile.getOriginalFilename());
		member.setMemImgPath(path);
		member.setMemImgSysname(uName);
		member.setMemNickname(fileVO.getMemNickname());
		
		service.updateMemberProfile(member);
		
		fileVO.setPath(path);
		fileVO.setOrgname(mFile.getOriginalFilename());
		fileVO.setSysname(uName);
		
		session.setAttribute("user", service.searchMemberByNickForMypage(fileVO.getMemNickname()));
		
		return fileVO.getMemNickname();
//		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/member/mypage.do?memNickname="+URLEncoder.encode(fileVO.getMemNickname(), "UTF-8");
		
	}
	@RequestMapping("/download.do")
	public void profileDownload(MemberFileVO fileVO, HttpServletResponse response) throws Exception {
		String uploadRoot = "c:/bit2019/upload";
		File f = new File( uploadRoot
							+ fileVO.getPath() 
							+ "/" 
							+ "_thumb_" 
							+ fileVO.getSysname());

		response.setHeader("Content-Type", "image/jpg");

		// 파일을 읽고 사용자에게 전송
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);

		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		while (true) {
			int ch = bis.read();
			if (ch == -1)
				break;
			bos.write(ch);
		}

		bis.close();
		fis.close();
		bos.close();
		out.close();
	}
	
	@RequestMapping("insertscrapbook.do")
	@ResponseBody
	public String insertScrapbook(ScrapbookFileVO fileVO) throws IOException {
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String uploadRoot = "C:/bit2019/upload";
		String path = "/scrap" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false)
			file.mkdirs();
		
		MultipartFile mFile = fileVO.getAttach();
		
		if (mFile.isEmpty()) {
		}
		
		String uName = UUID.randomUUID().toString() + mFile.getOriginalFilename();
		mFile.transferTo(new File(uploadRoot + path + "/" + uName));
		
		
		Scrapbook book = new Scrapbook();
		book.setMemNo(fileVO.getMemNo());
		book.setImgPath("/babmukja/recipe/download.do?path=" + path + "&sysname=" + uName);
		book.setTitle(fileVO.getTitle());
		
		service.insertScrapbook(book);
		return fileVO.getMemNickname();
	}
	
	
	@RequestMapping("scrapbookAjax.do")
	@ResponseBody
	public List<Scrapbook> selectScrapbookList (int memNo){
		return service.selectScrapbookListByNo(memNo);
	}
}
