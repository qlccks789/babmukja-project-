package kr.co.babmukja.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.domain.Member;
import kr.co.babmukja.repository.domain.RecipeFollow;
import kr.co.babmukja.repository.domain.Scrapbook;
import kr.co.babmukja.repository.mapper.MemberMapper;

@Service("kr.co.babmukja.member.service.MemberService")
public class MemberServiceImpl implements MemberService {
	 
	@Autowired
	private MemberMapper mapper;

	@Override
	// 로그인
	public Member selectLogin(Member member){
		return mapper.selectLogin(member);
	} 
	
	@Override
	// 회원가입
	public void insertMember(Member member) {
		mapper.insertMember(member);
	}
	
	@Override
	// 소셜 로그인 여부
	public Member selectCheckSocialAt(String memEmail) {
		return mapper.selectCheckSocialAt(memEmail);
	}
	
	@Override
	// 카카오톡 회원가입
	public void insertSocialMember(Member member) {
		mapper.insertSocialMember(member);
	}
	
	@Override
	// 카카오톡 닉네임 설정
	public void updateSocialNickname(Member member) {
		mapper.updateSocialNickname(member);
	}
	@Override
	// 닉네임 중복체크
	public int selectCheckNickName(String memNickname) {
		return mapper.selectCheckNickName(memNickname);
	}
	
	@Override
	// 이메일 중복체크
	public int selectCheckEmail(String memEmail) {
		return mapper.selectCheckEmail(memEmail);
	}
	
	@Override
	// 전화번호 중복체크
	public int selectCheckPhone(String memPhone) {
		return mapper.selectCheckPhone(memPhone);
	}
	
	@Override
	// 이메일 인증
	public void updateEmailVerify(String memEmail) {
		mapper.updateEmailVerify(memEmail);
	}
	
	@Override
	// 아이디 찾기
	public String selectSearchId(Member member) {
		return mapper.selectSearchId(member);
	}
	
	@Override
	// 비밀번호 찾기
	public String selectSearchPass(int certification) {
		return mapper.selectSearchPass(certification);
	}
	
	@Override
	// 인증번호 등록
	public void updateCertification(Member member) {
		mapper.updateCertification(member);
	}
	
	@Override
	// 인증번호 확인
	public int selectConfirmCertification(Member member) {
		return mapper.selectConfirmCertification(member);
	}
	
	@Override
	// 비밀번호 재설정
	public void updateResetPass(Member member) {
		mapper.updateResetPass(member);
	}
	
	// 이메일 찾기
	public int selectConfirmCertificationByEmail(int memNo) {
		return mapper.selectConfirmCertificationByEmail(memNo);
	}
	
	// 이메일 찾기
	public int selectMemnoByEmail(String memEmail) {
		return mapper.selectMemnoByEmail(memEmail);
	}
	
	
	//----------------------------------------우중------------------------------------------------//
	public List<Member> searchMemberByNick(String nick){
		return mapper.searchMemberByNick(nick);
	}

	@Override
	public void updateMemberProfile(Member member) {
		mapper.updateMemberProfile(member);
	}

	@Override
	public Member searchMemberByNickForMypage(String nick) {
		return mapper.searchMemberByNickForMypage(nick);
	}
	
	public String selectFollowStatus(RecipeFollow follow) {
		return mapper.selectFollowStatus(follow);
	}
	
	public void insertScrapbook(Scrapbook book) {
		mapper.insertScrapbook(book);
	}
	
	public List<Scrapbook> selectScrapbookListByNo(int memNo){
		return mapper.selectScrapbookListByNo(memNo); 
	}
}
