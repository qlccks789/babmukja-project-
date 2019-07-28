package kr.co.babmukja.meetup.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.babmukja.meetup.service.MeetupService;
import kr.co.babmukja.repository.domain.Board;
import kr.co.babmukja.repository.domain.BoardReview;
import kr.co.babmukja.repository.domain.Meetup;
import kr.co.babmukja.repository.domain.MeetupDetailFreePage;
import kr.co.babmukja.repository.domain.MeetupFile;
import kr.co.babmukja.repository.domain.MeetupIntro;
import kr.co.babmukja.repository.domain.MeetupLocation;
import kr.co.babmukja.repository.domain.MeetupMember;
import kr.co.babmukja.repository.domain.MeetupSearch;
import kr.co.babmukja.repository.domain.MeetupTag;
import kr.co.babmukja.repository.domain.PageAfterSearch;
import kr.co.babmukja.repository.domain.MeetupDetailNoticePage;
import kr.co.babmukja.repository.domain.PageBoardReview;
import kr.co.babmukja.repository.domain.Pagepb;

//파일을 동적으로 받아주기 위해서 File 객체 만들

@Controller("kr.co.babmukja.meetup.controller.MeetupController")

@RequestMapping("/meetup")
public class MeetupController {
	
	
	
	//탈퇴처리하기
	@RequestMapping("/manageWidthdrawl.do")
	@ResponseBody
	public void manageWidthdrawl(int meetNo) {
		System.out.println("탈퇴meetNo"+meetNo);
		service.updateWidthdrawlStatus(meetNo);

	}

	
	//관리자 거절처리
			@RequestMapping("/manageReject.do")
			@ResponseBody
			public void manageReject(int meetMemNo) {
				System.out.println("meetMemNo"+meetMemNo);
				service.updateRejectStatus(meetMemNo);

			}
	
	//관리자 강퇴처리
		@RequestMapping("/manageBan.do")
		@ResponseBody
		public void manageBan(int meetMemNo) {
			System.out.println("meetMemNo"+meetMemNo);
			service.updateBanStatus(meetMemNo);
		}
	
	//관리자 승인처리
	@RequestMapping("/manageApproval.do")
	@ResponseBody
	public void manageApproval(int meetMemNo) {
		System.out.println("meetMemNo"+meetMemNo);
		service.updateApprovalStatus(meetMemNo);
	}
	
	//모임 번호에 따른 회원 명단 보내기
	@RequestMapping("/manageMember.do")
	@ResponseBody
	public HashMap<String,Object> manageMember(int meetNo ) {
		System.out.println("manage member 들어왔음" + meetNo);
		
		HashMap<String,Object> hm =new HashMap<String,Object>();
		
		List<MeetupMember> approvalRequestList = service.selectManageMemberBoard(meetNo);
	
		for(int i=1; i<approvalRequestList.size()+1; i++) {
			approvalRequestList.get(i-1).setAdmissionNum(i);
			System.out.println("나열되는 번호" +approvalRequestList.get(i-1).getAdmissionNum());
		}
		hm.put("approvalRequestList", approvalRequestList);
     

		
		List<MeetupMember> meetupMemberList = service.selectMeetupMemberList(meetNo);

		
		for(int i=1; i<meetupMemberList.size()+1; i++) {
			meetupMemberList.get(i-1).setAdmissionNum(i);
			System.out.println("회원목록 나열되는 번호" +meetupMemberList.get(i-1).getAdmissionNum());
			System.out.println("회원목록 나열되는 이름" +meetupMemberList.get(i-1).getMemName());

		}
	
		hm.put("meetupMemberList", meetupMemberList);
		return hm;
	}
	
	
	
	@RequestMapping("/requestAdmission.do")
	@ResponseBody
	public String requestAdmission(MeetupMember meetupMember) {
		System.out.println("승인 memNo :" + meetupMember.getMemNo());
		System.out.println("승인 meetNo :" + meetupMember.getMeetNo());
		System.out.println("승인 이름 :" + meetupMember.getMemName());
		System.out.println("승인 상태 :" + meetupMember.getStatus());
		System.out.println("이메일 :" + meetupMember.getMemEmail());
		System.out.println("meetNo :" + meetupMember.getStatus());
		System.out.println("getMemImgPath()" + meetupMember.getMemImgPath());
		System.out.println("sysname" + meetupMember.getMemImgSysname());
		service.insertMeetupMember(meetupMember);
		
	
		System.out.println("수정 데이터 처리요청");
		return null;
	}

	@RequestMapping("/test.do")
	public void test() {
	System.out.println("controller 찍히는 확인");
	}

	
	@RequestMapping("/afterSearch.do")
	public void afterSearch(Model model, PageAfterSearch page,
			@RequestParam(required=true,defaultValue="1") int pageNo
			) {
		//페이징 처리
		System.out.println("1번째에서 page번호" +pageNo);
		page.setPageNo(pageNo);
		
		//검색 처리 해주기
		if(page.getCategory() ==null) {
			page.setCategory("");
		}
		if(page.getCategory().equals("전체")) {
			page.setCategory("");
		}
		if(page.getSearch() ==null) {
			page.setSearch("");
		}
		
		if(page.getCategory() ==null) {
			page.setCategory("");
		}
		
		if(page.getCity1() ==null || page.getCity1().equals("-선택-")  ) {
			System.out.println("도시확인 : " + page.getCity1());
			page.setCity1("");
		}
//		if(page.getCity2() ==null || page.getCity2().equals("-선택-")  ) {
//			System.out.println("도시확인 : " + page.getCity2());
//			page.setCity1("");
//		}
//		if(page.getCity3() ==null || page.getCity2().equals("-선택-")  ) {
//			System.out.println("도시확인 : " + page.getCity3());
//			page.setCity3("");
//		}
		
		if( page.getTown1() ==null || page.getTown1().equals("-선택-") || page.getTown1().equals("전체")  ) {
			System.out.println("도시확인 : " + page.getTown1());
			page.setTown1("");
		}
		
//		if( page.getTown2() ==null || page.getTown2().equals("-선택-") || page.getTown2().equals("전체")  ) {
//			System.out.println("도시확인 : " + page.getTown2());
//			page.setTown2("");
//		}
//
//		if( page.getTown3() ==null || page.getTown3().equals("-선택-") || page.getTown3().equals("전체")  ) {
//			System.out.println("도시확인 : " + page.getTown3());
//			page.setTown3("");
//		}
		
		System.out.println("회비 :" + page.getFee() );
		Map<String, Object> result = service.selectMeetup(page);
		model.addAttribute("meetupList", result.get("meetupList"));
		model.addAttribute("pageResult", result.get("pageResult"));
		model.addAttribute("pageAfterSearch", page);

		System.out.println("2번째 page 번호" + page.getPageNo());
		System.out.println(page.getCategory());
		System.out.println(page.getSearch());
		
		System.out.println("지역" +page.getCity2());
		System.out.println("지역");
	
		}
	
	

	
	
	@Autowired
	private MeetupService service;

	
	@RequestMapping("/createMeetup.do")
	public void CreateMeetup(MultipartFile file,Model model, String tag, String title,
		String category, String cityModal1, String cityModal2, String cityModal3,	
		String townModal1,String townModal2,String townModal3, String[] day, String fee, String detailFee,
		String hostName, int hostNo, String hostEmail,String hiddenTag
			
			) {
		System.out.println("호스트 내임, 이름" +hostName +hostNo );
		System.out.println("파일 " + file);
		System.out.println("카테고리" + category);
		System.out.println("제목" + title);
		if(hiddenTag !=null) {
		System.out.println("태그 :" + hiddenTag );
		}
		StringBuffer deleteTag= new StringBuffer(hiddenTag);
		String updatedTag="";
		if(hiddenTag.substring(hiddenTag.length()-1).equals(",")){
			  
			  deleteTag.deleteCharAt(hiddenTag.length()-1);
			  updatedTag = deleteTag.toString();
			System.out.println(",제거된태그 :" + updatedTag );	
		}
		
		
		String meetupDay = "";
		for(int i=0; i<day.length; i++) {
		meetupDay = meetupDay + "," + day[i];
		
		}
		if(meetupDay.charAt(0) == ',') {
			System.out.println("빼지기전 확인" + meetupDay.charAt(0));
			meetupDay =	meetupDay.substring(1);
			System.out.println("빼졌는지 확인" + meetupDay);
		}
		System.out.println("요일 :" + meetupDay);
		System.out.println("fee :" + fee);
		if(detailFee !=null) {
			System.out.println("금액" + detailFee);
			}

		
	
		//file 처리
		System.out.println("들어왔음");
		System.out.println("file 들어왔나 확인" + file);
		UUID uuid = UUID.randomUUID();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String uploadRoot = "C:/bit2019/upload";
		String path = "/meetup/" + sdf.format(new Date());
		String orgFileName = file.getOriginalFilename();
		String sysFileName = uuid.toString() + orgFileName;
		String filePath = uploadRoot + path;
		System.out.println("create root : " + uploadRoot + path + "/ <- file name here");
		MeetupFile mFile = new MeetupFile();
		mFile.setOrgFileName(orgFileName);
		mFile.setSysFileName(sysFileName);
		mFile.setFilePath(filePath);
		File f = new File(filePath + sysFileName);
		if (f.exists() == false) {
			f.mkdirs();
		}

		try {
			System.out.println("이동 잘되나 확인");
			file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("실패");
		}
		
		//xml에 담아주기
		Meetup meetupBoard = new Meetup();	
		MeetupTag meetupTag = new MeetupTag();
		System.out.println("들어가기전에 update 제발" +updatedTag);
		meetupBoard.setTag(updatedTag);
		System.out.println("진짜첫번째:" +meetupBoard.getMeetNo());
		meetupBoard.setCategory(category);
		meetupBoard.setDay(meetupDay);
		meetupBoard.setFee(detailFee);
		meetupBoard.setTitle(title);
		meetupBoard.setHostName(hostName);
		meetupBoard.setHostNo(hostNo);
		meetupBoard.setFileDir(filePath + sysFileName);
		System.out.println("첫번째:" +meetupBoard.getMeetNo());

		
		
		MeetupLocation meetupLocation = new MeetupLocation();
		
		String location="";
		if(cityModal1 !=null) {
		
			meetupLocation.setCity(cityModal1);
			meetupLocation.setMeetNo(meetupBoard.getMeetNo());
			System.out.println("두번째:" +meetupBoard.getMeetNo());
			System.out.println("도시1" + cityModal1);
			
			location += cityModal1;
		}
		if(townModal1 !=null) {
			meetupLocation.setTown(townModal1);
			service.insertMeetupLocation(meetupLocation);
			System.out.println("마을1" + townModal1);
			
			location += " "+ townModal1;
			
			}
		if(cityModal2 !=null) {
			meetupLocation.setCity(cityModal2);
			meetupLocation.setMeetNo(meetupBoard.getMeetNo());
			
			System.out.println("도시2" + cityModal2);
			if(cityModal2.equals(cityModal1)) {
				
			}else {
				location += "," +" " + cityModal2;}
			}
		if(townModal2 !=null) {
			meetupLocation.setTown(townModal2);
			service.insertMeetupLocation(meetupLocation);
			System.out.println("마을2" + townModal2);
			if(cityModal2.equals(cityModal1)) {
				location += ","+ townModal2;
			}else {
				location += " "+ townModal2;
			}
			}//처음 if
				
		
		if(cityModal3 !=null) {
			meetupLocation.setCity(cityModal3);
			meetupLocation.setMeetNo(meetupBoard.getMeetNo());
			
			System.out.println("도시3" + cityModal3);
			
			if(cityModal1.equals(cityModal3) ||cityModal2.equals(cityModal3)) {
				
			}else {
				location += "," +" " + cityModal3;
			}
			
				
		}
		
		
		if(townModal3 !=null) {
			meetupLocation.setTown(townModal3);
			service.insertMeetupLocation(meetupLocation);
			System.out.println("마을3" + townModal3);
			if(cityModal1.equals(cityModal3) && !cityModal2.equals(cityModal3)) {
				location = cityModal1 +" "+ townModal1 +"," + townModal3 + " " + cityModal2 + " " + townModal2;
					
		}else if(!cityModal1.equals(cityModal3) && cityModal2.equals(cityModal3)) {
			location += ","+ townModal3;

		}else {
				location += " "+ townModal3;
			}
	}//첫번째 if 
		
		
		System.out.println("location" +location);
		
		meetupBoard.setLocation(location);
		service.insertMeetupBoard(meetupBoard);
		MeetupMember member = new MeetupMember();
		member.setMemNo(hostNo);
		member.setMemName(hostName);
		member.setMemEmail(hostEmail);
		member.setMeetNo(meetupBoard.getMeetNo());
		member.setStatus(5);
		service.insertMeetupMember(member);
	
		model.addAttribute("hostNo", hostNo);
	}//createMeetup
	
	@RequestMapping("/manage.do")
	public void manage(int hostNo, Model model) {
	System.out.println("manage 컨트롤러 들어왔음");
	System.out.println("host no" +hostNo);
	List<Meetup> meetupList; 
	meetupList = service.createdBoardByMe(hostNo);	
	
	for(int i=1; i<meetupList.size()+1; i++) {
		meetupList.get(i-1).setManageNo(i);
		System.out.println(meetupList.get(i-1).getManageNo());
	}
	//내가 참여하는 모임 처리하기
	List<Meetup> meetupFollow;
	meetupFollow = service.selectFollowMeetup(hostNo);
	for(int i=1; i<meetupFollow.size()+1; i++) {
		meetupFollow.get(i-1).setManageNo(i);
		System.out.println(meetupFollow.get(i-1).getManageNo());
	}
	model.addAttribute("createdMeetup",meetupList);
	model.addAttribute("meetupFollows", meetupFollow);
	}
	
	@RequestMapping("/main.do")
	public void meetupMain(Model model) {
	
	model.addAttribute("selectAll", service.SelectRecommendAll());
	model.addAttribute("selectKorean", service.SelectRecommendKorean());
	model.addAttribute("selectChinese", service.SelectRecommendChinese());
	model.addAttribute("selectJapanese", service.SelectRecommendJapanese());
	model.addAttribute("selectWestern", service.SelectRecommendWestern());
	model.addAttribute("selectEastAsia", service.SelectRecommendEastAsia());
	}
	
	
	@RequestMapping("/detail.do")
	public void meetupDetail(Model model, int meetNo, int memNo,MeetupDetailFreePage freePage, MeetupDetailNoticePage noticePage, @RequestParam(required=true,defaultValue="0")int noticeClicked, @RequestParam(required=true,defaultValue="0")int freeClicked) {
		
		System.out.println("meetNo" + meetNo +  memNo );
		//view cnt 관리
		service.updateViewCnt(meetNo);
		MeetupMember meetupMember = new MeetupMember();
		meetupMember.setMeetNo(meetNo);
		meetupMember.setMemNo(memNo);
		
		//회원 명단 보내주기
		
		model.addAttribute("meetupMemberList", service.selectMeetupMemberList(meetNo));
		
		if(service.selectMeetupMemberStatus(meetupMember) !=null) {
		MeetupMember MeetupMemberStatus = service.selectMeetupMemberStatus(meetupMember);
		model.addAttribute("memberStatus", MeetupMemberStatus);
		
		
		}
		else {
			meetupMember.setStatus(0);
			model.addAttribute("memberStatus", meetupMember);
		}
		
		Meetup meetupBoard = service.selectBoard(meetNo);
		//ArrayList<String> meetupTag = new ArrayList<String>();
		String[] meetupTag = meetupBoard.getTag().split(",");
		System.out.println("밋업 태그 들어왔음" +meetupTag[0]);
		model.addAttribute("meetup", service.selectBoard(meetNo));
		model.addAttribute("meetupTags", meetupTag);

		//모임의 사진 뿌려주기
		
		List<File> pictureList = new ArrayList<>();
		
		File dir = new File("C:/bit2019/upload/meetup/2019");
		File[] files = dir.listFiles();
		for (File f : files) {
			checkPictureName(f, meetNo, pictureList);
		}
		
		
	System.out.println("파일 오나확인" +pictureList.size());
	
	model.addAttribute("images", pictureList);
	ArrayList<String> filePath = new ArrayList<>();	
	for(File file : pictureList) {
		System.out.println("file :" + file);
	
	
	filePath.add(file.getPath().replace("\\", "/"));
	

		System.out.println(file.getPath());
	}
	model.addAttribute("filesPath", filePath);
	
	//notice 부분
			noticePage.setMeetNo(meetNo);
			Map<String, Object> result = service.list(noticePage);
			model.addAttribute("noticeList", result.get("list"));
		
				System.out.println("noticeClicked" +noticeClicked);
			model.addAttribute("noticeClicked", noticeClicked);	
		
			model.addAttribute("noticePageNo", noticePage);			
			model.addAttribute("noticePageResult", result.get("pageResult"));
			
	////free 부분
			freePage.setMeetNo(meetNo);
			Map<String, Object> freeResult = service.freeList(freePage);
			model.addAttribute("freeList", freeResult.get("list"));
		
				System.out.println("freeClicked" +freeClicked);
			model.addAttribute("freeClicked", freeClicked);	
		
			model.addAttribute("freePageNo", freePage);			
			model.addAttribute("freePageResult", freeResult.get("pageResult"));		
			
	}//detail.do
	
	private void checkPictureName(File f, int meetNo, List<File> pictureList) {
		
		if (f.isFile()) {
			if (f.getName().contains("meetNo="+meetNo)) {
				pictureList.add(f);
			}
			return;
		} 
		// 디렉토리 인 경우
		File[] childList = f.listFiles();
		for (File child : childList) {
			checkPictureName(child, meetNo,pictureList);
		}
	}

	@RequestMapping("/meetupAddress.do")
	public void meetupAddress() {
		System.out.println("주소 들어왔음.");

	}

	@RequestMapping("/uploadImage.do")
	@ResponseBody
	public MeetupFile uploadImage(MultipartFile file, int meetNo) {
		System.out.println("업로드 이미지들어왔음");
		System.out.println("meetNo왔나 확인 " +meetNo);
		System.out.println("file 들어왔나 확인" + file);
		// service.updateIntro(data);
		UUID uuid = UUID.randomUUID();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String uploadRoot = "C:/bit2019/upload";
		String path = "/meetup/" + sdf.format(new Date()); 
		String orgFileName = file.getOriginalFilename();
		String sysFileName = uuid.toString() +"meetNo="+meetNo+ orgFileName;
		String filePath = uploadRoot + path + "/";
		System.out.println("create root : " + uploadRoot + path + "/ <- file name here");
		MeetupFile mFile = new MeetupFile();
		mFile.setOrgFileName(orgFileName);
		mFile.setSysFileName(sysFileName);
		mFile.setFilePath(filePath);
		File f = new File(filePath + sysFileName);
		if (f.exists() == false) {
			f.mkdirs();
		}

		try {
			System.out.println("이동 잘되나 확인");
			file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("실패");
		}

		return mFile;

	}


	@RequestMapping("download.do")
	public void download(String path, HttpServletResponse response) throws IOException {
		
//		String paths[] = path.split("C:/bit2019/upload");
		System.out.println("download.do" +path);
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream bis = new BufferedInputStream(fis);
		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);

		while (true) {
			int ch = bis.read();
			if (ch == -1) {
				break;
			}
			bos.write(ch);
		}
		bis.close();
		fis.close();
		bos.close();
		out.close();
	}
	

	@RequestMapping("/updateIntro.do")
	@ResponseBody
	public String updateIntro(String[] fileDirectory, String[] deleteDirectory, String dbPath, int meetNo) {
		System.out.println("세이브 후 들어왔음");
		if (deleteDirectory != null) {
		System.out.println("파일 들어왔나 확인 :" + fileDirectory[0]);
		}
		System.out.println("dbpath 들어왔나 확인 :" + dbPath);
		System.out.println("meetNo:" + meetNo);
		MeetupIntro meetupIntro = new MeetupIntro();
		meetupIntro.setDbPath(dbPath);
		meetupIntro.setMeetNo(meetNo);
		service.updateIntro(meetupIntro);
		if (deleteDirectory != null) {
			System.out.println("지울 파일 들어오나 확인 :" + deleteDirectory[0]);

			for (int i = 0; i < fileDirectory.length; i++) {

				System.out.println("----------------");
				System.out.println(fileDirectory[i]);

			}

			for (int i = 0; i < deleteDirectory.length; i++) {

				System.out.println("----------------");
				System.out.println(deleteDirectory[i]);

				File file = new File(deleteDirectory[i]);

				if (file.exists()) {
					if (file.delete()) {
						System.out.println("파일삭제 성공");
					}
				}
			} // delete for

		}

		return dbPath;

	}

	@RequestMapping("/editIntro.do")
	@ResponseBody
	public String editIntro(int meetNo) {
		System.out.println("수정 meetNo :" +meetNo);
		System.out.println("수정 데이터 처리요청");
		String data = service.selectIntro(meetNo);
		return data;
	}

	@RequestMapping("/deleteIntro.do")
	@ResponseBody
	public void deleteIntro(String[] fileDirectory) {
		System.out.println(" delete들어왔음");
		if(fileDirectory !=null) {
		for (int i = 0; i < fileDirectory.length; i++) {
			System.out.println(fileDirectory[i]);
			File file = new File(fileDirectory[i]);
			if (file.exists()) {
				if (file.delete()) {
					System.out.println("파일삭제 성공");
				}
			}
			

		}//for
		}//if
		service.deleteIntro();
	}

	//상세 보드 부분
	
	/*
	 * @RequestMapping("/detailNoticeList.do") // 글목록, 페이징 public void
	 * list(PageBoard page, Model model) { Map<String, Object> result =
	 * service.list(page); model.addAttribute("list", result.get("list"));
	 * model.addAttribute("pageResult", result.get("pageResult")); }
	 */

	//공지 보드 부분
	
	@RequestMapping("/detailNoticeDetail.do")
	// 글상세
	public void detailNoticeDetail(int boardNo,String memName, int meetNo, int memNo, Model model) {
		service.updateBoardViewCnt(boardNo);
		model.addAttribute("memName", memName);
		model.addAttribute("meetNo", meetNo);
		model.addAttribute("memNo", memNo);
		model.addAttribute("board", service.detail(boardNo));
	}

	@RequestMapping("/detailNoticeWriteform.do")
	// 글등록 폼
	public void writeForm(int meetNo,int memNo, Model model) {
		model.addAttribute("meetNo", meetNo);
		model.addAttribute("memNo", memNo);
	}

	@RequestMapping("/write.do")
	// 글등록 처리
	public Object write(Board board, int memNo, int meetNo) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		//board에 모임 번호 추가해주기
		//board.setMeetNo(meetNo);
		String uploadRoot = "C:/bit2019/upload";
		String path = "/meetup" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false)
			file.mkdirs();

		MultipartFile bFile = board.getBoardfile();

		if (bFile.isEmpty()) {
			System.out.println("is empty");
		}
		String uName = UUID.randomUUID().toString() +"meetNo="+meetNo+ bFile.getOriginalFilename();
		bFile.transferTo(new File(uploadRoot + path + "/" + uName));
		
		board.setImgpath(path);
		board.setImgOrgname(bFile.getOriginalFilename());
		board.setImgSysname(uName);

		service.write(board);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/meetup/detail.do?meetNo="+meetNo+"&memNo="+memNo+"&noticeClicked=1";
	}
	
	@RequestMapping("/imgdownload.do")
	public void download(int boardNo, HttpServletResponse response) throws Exception {
		System.out.println("imgdownload에 들어옴");
		Board board = service.detail(boardNo);
		String uploadRoot = "c:/bit2019/upload";
		String path = board.getImgpath();
		String sysname = board.getImgSysname();
		File f = new File(uploadRoot + path + "/" + sysname);
		response.setHeader("Content-Type", "image/jpg");
		System.out.println("파일경로 잘 들어오나 확인해보자 :" + uploadRoot + path + "/" + sysname);
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
	@RequestMapping("/imgFreeBoardDownload.do")
	public void imgFreeBoarddownload(int boardNo, HttpServletResponse response) throws Exception {
		System.out.println("imgdownload에 들어옴");
		Board board = service.freeDetail(boardNo);
		String uploadRoot = "c:/bit2019/upload";
		String path = board.getImgpath();
		String sysname = board.getImgSysname();
		File f = new File(uploadRoot + path + "/" + sysname);
		response.setHeader("Content-Type", "image/jpg");
		System.out.println("파일경로 잘 들어오나 확인해보자 :" + uploadRoot + path + "/" + sysname);
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

	@RequestMapping("/delete.do")
	// 글삭제
	public String delete(int boardNo) {
		service.delete(boardNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/board/list.do";
	}
	
	@RequestMapping("/detailNoticeUpdateform.do")
	// 글수정 폼
	public void updateForm(int boardNo,int meetNo,int memNo, Model model) {
		model.addAttribute("board", service.updateBoardForm(boardNo));
		model.addAttribute("meetNo", meetNo);
		model.addAttribute("memNo", memNo);
	}
	
	@RequestMapping("/update.do")
	// 글수정
	public String update(Board board, int meetNo, int memNo) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String uploadRoot = "C:/bit2019/upload";
		String path = "/meetup" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false)
			file.mkdirs();

		MultipartFile bFile = board.getBoardfile();

		if (bFile.isEmpty()) {
			System.out.println("is empty");
		}
		String uName = UUID.randomUUID().toString() +"meetNo="+meetNo+ bFile.getOriginalFilename();
		bFile.transferTo(new File(uploadRoot + path + "/" + uName));
		
		board.setImgpath(path);
		board.setImgOrgname(bFile.getOriginalFilename());
		board.setImgSysname(uName);
		service.updateBoard(board);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/meetup/detail.do?meetNo="+meetNo+"&memNo="+memNo+"&noticeClicked=1";
	}
	
	/** 댓글 부분*/
	
	@RequestMapping("/boardreviewList.do")
	@ResponseBody
	// 댓글목록
	public Map boardReviewList(PageBoardReview page) {
		Map<String, Object> list = service.selectBoardView(page);
		list.put("comment", list.get("list"));
		list.put("pageResult", list.get("pageResult"));

		return list;
	}
	
	@RequestMapping("/boardreviewWrite.do")
	@ResponseBody
	// 댓글 등록
	public BoardReview boardReviewWrite(BoardReview boardReview) {
		service.insertBoardReview(boardReview);
		return service.selectBoardReviewOneByNo(boardReview.getBoardReviewNo());
	}
	
	@RequestMapping("/boardreviewdelete.do")
	@ResponseBody
	// 댓글 삭제
	public void boardReviewDelete(int boardReviewNo) {
		service.deleteBoardReview(boardReviewNo);
	}
	
	@RequestMapping("/boardreviewupdateform.do")
	@ResponseBody
	// 댓글 수정 폼
	public BoardReview boardReviewUpdateForm(int boardReviewNo) {
		return service.selectBoardReviewOneByNo(boardReviewNo);
	}
	
	@RequestMapping("/boardreviewupdate.do")
	@ResponseBody
	// 댓글 수정
	public BoardReview boardReviewUpdate(BoardReview boardReview) {
		service.updateBoardView(boardReview);
		return service.selectBoardReviewOneByNo(boardReview.getBoardReviewNo());
	}

	//자유게시판 부분
	
		@RequestMapping("/detailFreeDetail.do")
		// 글상세
		public void detailFreeDetail(int boardNo, Model model,int meetNo,int memNo) {
			service.updateBoardViewCnt(boardNo);
			model.addAttribute("board", service.freeDetail(boardNo));
			model.addAttribute("meetNo", meetNo);
			model.addAttribute("memNo", memNo);
		}

		@RequestMapping("/detailFreeWriteform.do")
		// 글등록 폼
		public void detailFreeWriteform(int meetNo,int memNo, Model model) {
			model.addAttribute("meetNo", meetNo);
			model.addAttribute("memNo", memNo);
		}

		@RequestMapping("/writeFreeBoard.do")
		// 글등록 처리
		public Object writeFreeBoard(Board board, int meetNo, int memNo) throws Exception {
			SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
			String uploadRoot = "C:/bit2019/upload";
			String path = "/meetup" + sdf.format(new Date());
			File file = new File(uploadRoot + path);
			if (file.exists() == false)
				file.mkdirs();

			MultipartFile bFile = board.getBoardfile();

			if (bFile.isEmpty()) {
				System.out.println("is empty");
			}
			String uName = UUID.randomUUID().toString() +"meetNo="+meetNo+ bFile.getOriginalFilename();
			bFile.transferTo(new File(uploadRoot + path + "/" + uName));
			
			board.setImgpath(path);
			board.setImgOrgname(bFile.getOriginalFilename());
			board.setImgSysname(uName);

			service.freeWrite(board);
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/meetup/detail.do?meetNo="+meetNo+"&memNo="+memNo+"&freeClicked=1";
		}
		
	
		@RequestMapping("/deleteFreeBoard.do")
		// 글삭제
		public String deleteFreeBoard(int boardNo) {
			service.freeDelete(boardNo);
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/board/list.do";
		}
		
		@RequestMapping("/detailFreeUpdateform.do")
		// 글수정 폼
		public void detailFreeUpdateform(int boardNo,int meetNo,int memNo, Model model) {
			model.addAttribute("board", service.updateFreeBoardForm(boardNo));
			model.addAttribute("meetNo", meetNo);
			model.addAttribute("memNo", memNo);
		}
		
		@RequestMapping("/updateFreeBoard.do")
		// 글수정
		public String updateFreeBoard(Board board, int meetNo, int memNo) throws Exception {
			SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
			String uploadRoot = "C:/bit2019/upload";
			String path = "/meetup" + sdf.format(new Date());
			File file = new File(uploadRoot + path);
			if (file.exists() == false)
				file.mkdirs();

			MultipartFile bFile = board.getBoardfile();

			if (bFile.isEmpty()) {
				System.out.println("is empty");
			}
			String uName = UUID.randomUUID().toString() + "meetNo="+meetNo+ bFile.getOriginalFilename();
			bFile.transferTo(new File(uploadRoot + path + "/" + uName));
			
			board.setImgpath(path);
			board.setImgOrgname(bFile.getOriginalFilename());
			board.setImgSysname(uName);
			service.updateFreeBoard(board);
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/meetup/detail.do?meetNo="+meetNo+"&memNo="+memNo+"&freeClicked=1";

		}
		
		/** 댓글 부분*/
		
		@RequestMapping("/freeBoardReviewList.do")
		@ResponseBody
		// 댓글목록
		public Map freeBoardReviewList(PageBoardReview page) {
			Map<String, Object> list = service.selectBoardView(page);
			list.put("comment", list.get("list"));
			list.put("pageResult", list.get("pageResult"));

			return list;
		}
		
		@RequestMapping("/freeBoardReviewWrite.do")
		@ResponseBody
		// 댓글 등록
		public BoardReview freeBoardReviewWrite(BoardReview boardReview) {
			service.insertBoardReview(boardReview);
			return service.selectBoardReviewOneByNo(boardReview.getBoardReviewNo());
		}
		
		@RequestMapping("/freeBoardReviewDelete.do")
		@ResponseBody
		// 댓글 삭제
		public void freeBoardReviewDelete(int boardReviewNo) {
			service.deleteBoardReview(boardReviewNo);
		}
		
		@RequestMapping("/freeBoardReviewUpdateForm.do")
		@ResponseBody
		// 댓글 수정 폼
		public BoardReview freeBoardReviewUpdateForm(int boardReviewNo) {
			return service.selectBoardReviewOneByNo(boardReviewNo);
		}
		
		@RequestMapping("/freeBoardreviewUpdate.do")
		@ResponseBody
		// 댓글 수정
		public BoardReview freeBoardreviewUpdate(BoardReview boardReview) {
			service.updateBoardView(boardReview);
			return service.selectBoardReviewOneByNo(boardReview.getBoardReviewNo());
		}

	
	
}
