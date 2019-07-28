package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Board;
import kr.co.babmukja.repository.domain.BoardReview;
import kr.co.babmukja.repository.domain.Meetup;
import kr.co.babmukja.repository.domain.MeetupDetailFreePage;
import kr.co.babmukja.repository.domain.MeetupIntro;
import kr.co.babmukja.repository.domain.MeetupLocation;
import kr.co.babmukja.repository.domain.MeetupMember;
import kr.co.babmukja.repository.domain.PageAfterSearch;
import kr.co.babmukja.repository.domain.MeetupDetailNoticePage;
import kr.co.babmukja.repository.domain.PageBoardReview;

public interface MeetupMapper {

public String selectIntro(int meetNo);
public void updateIntro(MeetupIntro meetupIntro);
public void deleteIntro();
public void insertMeetupBoard(Meetup meetup);
public void insertMeetupLocation(MeetupLocation meetupLocation);
public int selectAllMeetupCount(PageAfterSearch pageAfterSearch);
public List<Meetup> selectRecommendAll();
public List<Meetup> selectRecommendKorean();
public List<Meetup> selectRecommendChinese();
public List<Meetup> selectRecommendJapanese();
public List<Meetup> selectRecommendWestern();
public List<Meetup> selectRecommendEastAsia();
public List<Meetup>	selectMeetup(PageAfterSearch page);
public Meetup selectBoard(int no);
public void insertMeetupMember(MeetupMember meetupMember);
public List<MeetupMember> selectManageMemberBoard(int no);
//내가 참여하는 모임 선택
public List<Meetup> selectFollowMeetup(int memNo);
//public List<MeetupLocation> selectLocation()
public List<Meetup>createdBoardByMe(int no);
public void updateApprovalStatus(int no);
public List<MeetupMember> selectMeetupMemberList(int no);
public MeetupMember selectMeetupMemberStatus (MeetupMember meetupMember);
public void updateViewCnt(int meetNo);
public void updateBanStatus(int no);
// 관리자 거절 처리
public void updateRejectStatus(int no);

//회원 탈퇴
public void updateWidthdrawlStatus(int meetNo);



// 공지 list 부분
public List<Board> selectNoticeBoard(MeetupDetailNoticePage page); // 글목록

public int selectBoardCount(int meetNo); // 페이징

Board selectBoardByNo(int boardNo); // 글번호

void insertBoard(Board board); // 글등록

int deleteBoard(int boardNo); // 글삭제

public void updateBoard(Board board); // 글수정

public void updateBoardViewCnt(int boardNo); // 조회수

// 댓글
public List<BoardReview> selectBoardView(PageBoardReview page); // 댓글 목록

public int selectBoardReviewCount(PageBoardReview page); // 페이징

public void insertBoardReview(BoardReview boardReview); // 댓글 등록

public BoardReview selectBoardReviewOneByNo (int boardReviewNo); // 댓글 하나만 가져오기

public void deleteBoardReview(int boardReviewNo); // 댓글 삭제
 
public void updateBoardView(BoardReview boardReview); // 댓글 수정




//자유게시판 부분
public List<Board> selectFreeBoard(MeetupDetailFreePage page); // 글목록

public int selectFreeBoardCount(int meetNo); // 페이징

Board selectFreeBoardByNo(int boardNo); // 글번호

void insertFreeBoard(Board board); // 글등록

int deleteFreeBoard(int boardNo); // 글삭제

public void updateFreeBoard(Board board); // 글수정

public void updateFreeBoardViewCnt(int boardNo); // 조회수

//댓글
public List<BoardReview> selectFreeBoardView(PageBoardReview page); // 댓글 목록

public int selectFreeBoardReviewCount(PageBoardReview page); // 페이징

public void insertFreeBoardReview(BoardReview boardReview); // 댓글 등록

public BoardReview selectFreeBoardReviewOneByNo (int boardReviewNo); // 댓글 하나만 가져오기

public void deleteFreeBoardReview(int boardReviewNo); // 댓글 삭제

public void updateFreeBoardView(BoardReview boardReview); // 댓글 수정

//회원 명단 뿌려주기
public List<MeetupMember> selectMeeupMemberList(int meetNo);
}