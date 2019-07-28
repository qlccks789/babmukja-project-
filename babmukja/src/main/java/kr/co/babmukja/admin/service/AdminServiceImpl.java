package kr.co.babmukja.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.common.page.PageResult;
import kr.co.babmukja.repository.domain.Member;
import kr.co.babmukja.repository.domain.Page;
import kr.co.babmukja.repository.domain.Pagepb;
import kr.co.babmukja.repository.domain.StorePB;
import kr.co.babmukja.repository.mapper.AdminMapper;

@Service("kr.co.babmukja.admin.service.AdminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	public AdminMapper mapper;
	
	public List listMember(){
		List<Member> result = mapper.selectMemberList();
//		Map<String, Object> result = new HashMap<>();	
//		result.put("list", mapper.selectMemberList(page));			
//		result.put("searchType",page.getSearchType());
//		result.put("input", page.getInput());
//		result.put("gradeType", page.getGradeType());
//		
//		if(page.getSignDate1() != "") {
//			result.put("signDate1",page.getSignDate1());
//			result.put("signDate2",page.getSignDate2());			
//		}
////		if(page.getLastDate1() != "") {
////			result.put("lastDate1",page.getLastDate1());
////			result.put("lastDate2",page.getLastDate2());			
////		}
//		result.put("pageResult", new PageResult(
//				page.getPageNo(), mapper.selectMemberCount(page))
//				);	
		return result;
	}

	public int countMember(Page page) {
		return mapper.selectMemberCount(page);
	}
	
	public Member selectMemberByNo(int no) {
		return mapper.selectMemberByNo(no);
		
	}
	
	// pb 상품 전체조회( 관리자전용 )
	public Map<String, Object> selectAdminPBList(Pagepb page) {
		Map<String, Object> result = new HashMap<>();
		result.put("pbAdminList", mapper.selectAdminPBList(page));
		result.put("pageResult", new PageResult(
				page.getPageNo(), mapper.selectAdminPBListCount()));
		
		return result;
	}
	
	// pb 상품 등록 (관리자 전용)
	public void insertPBStore(StorePB storepb) {
		mapper.insertPBStore(storepb);
	}
	
	// pb 상품 삭제 (관리자 전용)
	public void deletePBStore(int pbNo) {
		mapper.deletePBStore(pbNo);
	}
	
}
