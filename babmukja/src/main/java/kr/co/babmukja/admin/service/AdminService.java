package kr.co.babmukja.admin.service;

import java.util.List;
import java.util.Map;

import kr.co.babmukja.repository.domain.Member;
import kr.co.babmukja.repository.domain.Page;
import kr.co.babmukja.repository.domain.Pagepb;
import kr.co.babmukja.repository.domain.StorePB;

public interface AdminService {
//	public Map<String, Object> listMember(Page page);
	public List<Member> listMember();
	public int countMember(Page page);
	public Member selectMemberByNo(int no);
	
	// pb 상품 전체조회( 관리자전용 )
	public Map<String, Object> selectAdminPBList(Pagepb page);
	// pb 상품 등록 (관리자 전용)
	public void insertPBStore(StorePB storepb);
	// pb 상품 삭제 (관리자 전용)
	public void deletePBStore(int pbNo);
}
