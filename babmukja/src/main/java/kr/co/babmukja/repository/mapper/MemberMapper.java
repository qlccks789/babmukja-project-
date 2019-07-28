package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Member;
import kr.co.babmukja.repository.domain.RecipeFollow;
import kr.co.babmukja.repository.domain.Scrapbook;

public interface MemberMapper {
	Member selectLogin(Member member); // 로그인

	void insertMember(Member member); // 회원가입
	
	void insertSocialMember(Member member); // 카카오 회원가입
	
	void updateSocialNickname(Member member); // 카카오톡 이름 설정
	
	Member selectCheckSocialAt(String memEmail); // 소셜 로그인 여부

	int selectCheckNickName(String memNickname); // 닉네임 중복체크

	int selectCheckEmail(String memEmail); // 이메일 중복체크

	int selectCheckPhone(String memPhone); // 전화번호 중복체크

	void updateEmailVerify(String memEmail); // 이메일 인증

	String selectSearchId(Member member); // 아이디 찾기

	String selectSearchPass(int certification); // 비밀번호 찾기

	void updateCertification(Member member); // 인증번호 등록

	int selectConfirmCertification(Member member); // 인증번호 확인

	void updateResetPass(Member member); // 비밀번호 재설정
	
	int selectConfirmCertificationByEmail(int memNo); // email 인증번호 확인
	
	int selectMemnoByEmail(String memEmail); // email 인증번호 확인
	
	//----------------------------우중---------------------------//
	List<Member> searchMemberByNick(String nick);
	void updateMemberProfile(Member member);
	
	Member searchMemberByNickForMypage(String nick);
	public String selectFollowStatus(RecipeFollow follow);
	
	public void insertScrapbook(Scrapbook book);
	public List<Scrapbook> selectScrapbookListByNo(int memNo);
}