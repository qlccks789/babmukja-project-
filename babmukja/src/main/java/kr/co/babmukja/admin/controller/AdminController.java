package kr.co.babmukja.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.babmukja.admin.service.AdminService;
import kr.co.babmukja.repository.domain.Member;
import kr.co.babmukja.repository.domain.Page;
import kr.co.babmukja.repository.domain.Pagepb;
import kr.co.babmukja.repository.domain.StorePB;

@Controller("kr.co.babmukja.admin.controller.AdminController")
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;

	@RequestMapping("/board.do")
	public void boardList(Page page, Model model) {
		
	}
	
	
	@RequestMapping("/main.do")
	public void main(){}
	
	@RequestMapping("/member.do")	
	public void memberList(Model model) {		
		List<Member> list = service.listMember();

	    model.addAttribute("list",list);
	
	}
	
	@RequestMapping("/memberdetail.do")
	@ResponseBody
	public Member detail(int memNo) {	
		return service.selectMemberByNo(memNo);
		
	}
	
	// PB 스토어 목록조회  (관리자전용)
	@RequestMapping("/pbstoreselectlist.do")
	public void pbstoreselectlist(Model model, Pagepb page) {
		Map<String, Object> result = service.selectAdminPBList(page);
		model.addAttribute("pbAdminList", result.get("pbAdminList"));
		model.addAttribute("pageResult", result.get("pageResult"));
	}
	
	// pb 상품 등록 폼
	@RequestMapping("/insertformpb.do")
	public void insertformpb() {}
	
	// pb 상품 등록
	@RequestMapping("/insertpb.do")
	@ResponseBody
	public void insertpb(StorePB storepb) {
		String[] imgPath = storepb.getImgPath().split(",");
		storepb.setThumnail(imgPath[0]);
		service.insertPBStore(storepb);
	}
	
	// pb 상품 삭제
	@RequestMapping("/deletepb.do")
	public String deletepb(int pbNo) {
		service.deletePBStore(pbNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "pbstoreselectlist.do";
	}
}
