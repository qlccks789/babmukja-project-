package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Member;
import kr.co.babmukja.repository.domain.Page;
import kr.co.babmukja.repository.domain.Pagepb;
import kr.co.babmukja.repository.domain.StorePB;

public interface AdminMapper {	
//	public List<Member> selectMemberList(Page page);
	public List<Member> selectMemberList();
	public int selectMemberCount(Page page);
	
	public Member selectMemberByNo(int no);
	
	// pb 상품 전체조회( 관리자전용 )
	public List<StorePB> selectAdminPBList(Pagepb page);
	public int selectAdminPBListCount();
	// pb 상품 등록 (관리자 전용)
	public void insertPBStore(StorePB storepb);
	// pb 상품 삭제 (관리자 전용)
	public void deletePBStore(int pbNo);
}