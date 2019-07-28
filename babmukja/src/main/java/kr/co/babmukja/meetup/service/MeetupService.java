package kr.co.babmukja.meetup.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.co.babmukja.repository.domain.Board;
import kr.co.babmukja.repository.domain.BoardReview;
import kr.co.babmukja.repository.domain.Meetup;
import kr.co.babmukja.repository.domain.MeetupDetailFreePage;
import kr.co.babmukja.repository.domain.MeetupFile;
import kr.co.babmukja.repository.domain.MeetupIntro;
import kr.co.babmukja.repository.domain.MeetupLocation;
import kr.co.babmukja.repository.domain.MeetupMember;
import kr.co.babmukja.repository.domain.PageAfterSearch;
import kr.co.babmukja.repository.domain.MeetupDetailNoticePage;
import kr.co.babmukja.repository.domain.PageBoardReview;

public interface MeetupService {
	
	
	
	public String selectIntro(int meetNo);
	public void updateIntro(MeetupIntro meetupIntro);
	public void deleteIntro();
	public void insertMeetupBoard(Meetup meetup);
	public void insertMeetupLocation(MeetupLocation meetupLocation);
	public List<Meetup> SelectRecommendAll();
	public List<Meetup> SelectRecommendKorean();
	public List<Meetup> SelectRecommendChinese();
	public List<Meetup> SelectRecommendJapanese();
	public List<Meetup> SelectRecommendWestern();
	public List<Meetup> SelectRecommendEastAsia();
	public MeetupFile uploadImage(MultipartFile file) throws Exception; 
	public Map<String, Object> selectMeetup(PageAfterSearch page);
	public Meetup selectBoard(int no);
	public void insertMeetupMember(MeetupMember meetupMember);
	public List<Meetup> createdBoardByMe(int no);
	public List<MeetupMember> selectManageMemberBoard(int no);
	public void updateApprovalStatus(int no);
	public List<MeetupMember> selectMeetupMemberList(int no);
	public MeetupMember selectMeetupMemberStatus(MeetupMember meetupMember);
	public void updateViewCnt(int meetNo);
	//관리자 강퇴처리하기
	public void updateBanStatus(int no);
	//관리자 거절처리하기
	public void updateRejectStatus(int no);

	//참여하는 모임 가져오기
	public List<Meetup> selectFollowMeetup(int memNo);
	
	//모임 탈퇴하기
	public void updateWidthdrawlStatus(int meetNo);


	//모임 공지부분
	public Map<String, Object> list(MeetupDetailNoticePage page); // 글목록
	
	public Board detail(int boardNo); // 글상세
	
	public void write(Board board) throws Exception; // 글등록
	
	public void delete(int boardNo); // 글삭제
	
	public void updateBoardViewCnt(int boardNo); // 조회수
	
	public void updateBoard(Board board); // 글수정
	
	public Board updateBoardForm(int boardNo); // 글수정 폼
	
	// 댓글
	public Map<String, Object> selectBoardView(PageBoardReview page); // 댓글 목록
	
	public int selectBoardReviewCount(PageBoardReview page); // 페이징
	
	public void insertBoardReview(BoardReview boardReview); // 댓글 등록
	
	public BoardReview selectBoardReviewOneByNo (int boardReviewNo); // 댓글 하나만 가져오기

	public void deleteBoardReview(int boardReviewNo); // 댓글 삭제
	
	public void updateBoardView(BoardReview boardReview); // 댓글 수정




//모임 자유게시판부분
	public Map<String, Object> freeList(MeetupDetailFreePage page); // 글목록
	
	public Board freeDetail(int boardNo); // 글상세
	
	public void freeWrite(Board board) throws Exception; // 글등록
	
	public void freeDelete(int boardNo); // 글삭제
	
	public void updateFreeBoardViewCnt(int boardNo); // 조회수
	
	public void updateFreeBoard(Board board); // 글수정
	
	public Board updateFreeBoardForm(int boardNo); // 글수정 폼
	
	// 댓글
	public Map<String, Object> selectFreeBoardView(PageBoardReview page); // 댓글 목록
	
	public int selectFreeBoardReviewCount(PageBoardReview page); // 페이징
	
	public void insertFreeBoardReview(BoardReview boardReview); // 댓글 등록
	
	public BoardReview selectFreeBoardReviewOneByNo (int boardReviewNo); // 댓글 하나만 가져오기

	public void deleteFreeBoardReview(int boardReviewNo); // 댓글 삭제
	
	public void updateFreeBoardView(BoardReview boardReview); // 댓글 수정

	public List<MeetupMember> selectMeeupMemberList(int meetNo);

}
