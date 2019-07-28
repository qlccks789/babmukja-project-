package kr.co.babmukja.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.babmukja.notice.service.NoticeService;
import kr.co.babmukja.repository.domain.Member;
import kr.co.babmukja.repository.domain.Notice;
import kr.co.babmukja.repository.domain.NoticeFileVO;
import kr.co.babmukja.repository.domain.Page;
import kr.co.babmukja.repository.domain.PageNotice;

@Controller("kr.co.babmukja.notice.controller.NoticeController")
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService service;

	@RequestMapping("/writeForm.do")
	public void writeForm() throws Exception{
	}

	@RequestMapping("/download.do")
	public void download(String path, HttpServletResponse response) throws Exception {
		  response.setHeader("Content-Type", "image/jpg");
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
	
	 @RequestMapping("/write.do") 
	  public String write(NoticeFileVO fileVO, Notice notice, HttpSession session) throws Exception {
		 Member user = (Member)session.getAttribute("user");
		 System.out.println(notice.getContent());
//		 notice.setNoticeNo(notice.getNoticeNo());
	
	    System.out.println("컨텐츠 가져오기 :" + notice.getContent()); 
	    String uploadRoot = "c:/bit2019/upload";
		SimpleDateFormat sdf = new SimpleDateFormat(
				"/yyyy/MM/dd");
		String path = "/notice" + sdf.format(new Date());
	//	String sysname = notice.getImgSysname();
		File file = new File(uploadRoot + path);
		if (file.exists() == false) file.mkdirs();
		for (MultipartFile mFile : fileVO.getImageList()) {
			if (mFile.isEmpty()) {
				break;
			}
			String uName =  UUID.randomUUID().toString() + mFile.getOriginalFilename();
			mFile.transferTo(new File(uploadRoot + path + "/" + uName));
		
			System.out.println(notice.getNoticeNo());
			notice.setImgSysname(uploadRoot + path + "/" + uName );
			notice.setImgpath(path);
			fileVO.setFileNo(notice.getNoticeNo());
			fileVO.setImgpath(path);
			fileVO.setImgOrgname(mFile.getOriginalFilename());
			fileVO.setImgSysname(uName);
			service.insertNoticeImage(fileVO);
		}
		  service.write(notice);
	  return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do"; 	
	}
	  
	@RequestMapping("/updateForm.do")
	public void updateForm(int noticeNo, Model model) throws Exception {
		model.addAttribute("notice", service.updateForm(noticeNo));
	}

	@RequestMapping("/update.do")
	public String update(Notice notice) throws Exception{
		System.out.println("no:" + notice.getNoticeNo());
		System.out.println("title:" + notice.getTitle());
		System.out.println("content:" + notice.getContent());
//		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
//		String uploadRoot = "C:/bit2019/upload";
//		String path = "/notice" + sdf.format(new Date());
//		File file = new File(uploadRoot + path);
//		if (file.exists() == false)
//			file.mkdirs();
//
//		MultipartFile nFile = notice.getNoticefile();
//
//		if (nFile.isEmpty()) {
//			System.out.println("is empty");
//		}
//		String uName = UUID.randomUUID().toString() + nFile.getOriginalFilename();
//		nFile.transferTo(new File(uploadRoot + path + "/" + uName));
//		
//		notice.setImgpath(path);
//		notice.setImgOrgname(nFile.getOriginalFilename());
//		notice.setImgSysname(uName);
		service.update(notice);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}

	@RequestMapping("/delete.do")
	public String delete(int noticeNo) throws Exception{
		service.delete(noticeNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}

	@RequestMapping("/detail.do")
	public void detail(int no, Model model) throws Exception{
		model.addAttribute("notice", service.detail(no));
      //  model.addAttribute("files", service.fileDetail(no));
	}

	@RequestMapping("/index.do")
	public void index() {}

//	@RequestMapping("/list.do")
//	public void list(Page page, Model model) throws Exception {
//		List<Notice> list = service.selectNoticeList();
//		for (Notice notice : list) {
//			System.out.println(notice.getWriter());
//			System.out.println(notice.getNoticeNo());
//			System.out.println(notice.getRegdate());
//			System.out.println(notice.getViewcnt());
//		}
//		model.addAttribute("list", service.selectNoticeList());
//	}
	
	@RequestMapping("/list.do") // 글목록, 페이징
	public void list(PageNotice page, Model model) throws Exception{
		Map<String, Object> result = service.list(page);
		model.addAttribute("list", result.get("list"));
		model.addAttribute("pageResult", result.get("pageResult"));
	}
}
