package kr.co.babmukja.meetup.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.babmukja.common.page.MeetupPageResult;
import kr.co.babmukja.common.page.PageResult;
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
import kr.co.babmukja.repository.domain.Pagepb;
import kr.co.babmukja.repository.mapper.AdminMapper;
import kr.co.babmukja.repository.mapper.MeetupMapper;

@Service("kr.co.babmukja.admin.service.MeetupService")
public class MeetupServiceImpl implements MeetupService{
	
	@Autowired
	public MeetupMapper mapper;

	
	public String selectIntro(int meetNo) {
		return mapper.selectIntro(meetNo);
	}

	 public MeetupFile uploadImage(MultipartFile file) throws Exception {
		return null;

		
		 
	 }
	public void updateIntro(MeetupIntro meetupIntro) {
		 mapper.updateIntro(meetupIntro);
	}

	public void deleteIntro() {
		mapper.deleteIntro();
	}


	public void insertMeetupBoard(Meetup meetup) {
		mapper.insertMeetupBoard(meetup);
		
	}
	
	public void insertMeetupLocation(MeetupLocation meetupLocation) {
		mapper.insertMeetupLocation(meetupLocation);
	}

	public Map<String, Object> selectMeetup(PageAfterSearch page) {
		
			Map<String, Object> result = new HashMap<>();
			result.put("meetupList", mapper.selectMeetup(page));
			result.put("locationList", mapper.selectMeetup(page));
			result.put("pageResult", new MeetupPageResult(
			page.getPageNo(), mapper.selectAllMeetupCount(page)));
			
		
			return result;
	}
	
	
	
	
	
	@Override
	public List<Meetup> SelectRecommendAll() {
		
		return mapper.selectRecommendAll();
	}

	@Override
	public List<Meetup> SelectRecommendKorean() {
		return mapper.selectRecommendKorean();
	}

	@Override
	public List<Meetup> SelectRecommendChinese() {
		return mapper.selectRecommendChinese();
	}

	@Override
	public List<Meetup> SelectRecommendJapanese() {
		return mapper.selectRecommendJapanese();
	}

	@Override
	public List<Meetup> SelectRecommendWestern() {
		return mapper.selectRecommendWestern();
	}
	
	@Override
	public List<Meetup> SelectRecommendEastAsia() {
		return mapper.selectRecommendEastAsia();
	}
	
	public Meetup selectBoard(int no) {
		return mapper.selectBoard(no);
	}

	public void insertMeetupMember(MeetupMember meetupMember) {
		mapper.insertMeetupMember(meetupMember);
	}

	public List<Meetup> createdBoardByMe(int no){
		return mapper.createdBoardByMe(no);
	}

	public List<MeetupMember> selectManageMemberBoard(int no){
	return mapper.selectManageMemberBoard(no);
	}
	
	public void updateApprovalStatus(int no) {
		mapper.updateApprovalStatus(no);
	}

	public List<MeetupMember> selectMeetupMemberList(int no){
		return mapper.selectMeetupMemberList(no);
	}

	public MeetupMember selectMeetupMemberStatus(MeetupMember meetupMember) {
	return mapper.selectMeetupMemberStatus(meetupMember);
	}
	
	public void updateViewCnt(int meetNo) {
	mapper.updateViewCnt(meetNo);	
	}

	//관리자 강퇴처리하기
	public void updateBanStatus(int no) {
	mapper.updateBanStatus(no);	
	}
	
	//관리자 거절처리하기
	public void updateRejectStatus(int no) {
	mapper.updateRejectStatus(no);
	}

	//내가 참여하는 모임 리스트
	public List<Meetup> selectFollowMeetup(int memNo){
	return	mapper.selectFollowMeetup(memNo);
		
	}

	// 모임 탈퇴 처리
	public void updateWidthdrawlStatus(int meetNo) {
		mapper.updateWidthdrawlStatus(meetNo);
	}


	//모임 공지 부분
	
	// 글목록, 페이징
	@Override
	public Map<String, Object> list(MeetupDetailNoticePage page) {
		Map<String, Object> result = new HashMap<>();
		result.put("list", mapper.selectNoticeBoard(page));
		//수정된 부분
		result.put("pageResult", new PageResult(page.getNoticePageNo(), mapper.selectBoardCount(page.getMeetNo())));
		return result;
	}
	
	// 글상세
	@Override
	public Board detail(int boardNo) {
		return mapper.selectBoardByNo(boardNo);
	}
	
	// 글등록
	@Override
	public void write(Board board) throws Exception {
		mapper.insertBoard(board);
	}
	
	// 글삭제
	@Override
	public void delete(int boardNo) {
		mapper.deleteBoard(boardNo);
	}
	
	// 글수정 폼
	@Override
	public Board updateBoardForm(int boardNo) {
		return mapper.selectBoardByNo(boardNo);
	}
	
	// 글수정
	@Override
	public void updateBoard(Board board) {
		mapper.updateBoard(board);
	}
	
	// 조회수
	@Override
	public void updateBoardViewCnt(int boardNo) {
		mapper.updateBoardViewCnt(boardNo);
	}
	
	/** 댓글 */
	
	// 댓글 목록
	@Override
	public Map selectBoardView(PageBoardReview page) {
		Map<String, Object> result = new HashMap<>();
		result.put("list", mapper.selectBoardView(page));
		result.put("pageResult", new PageResult(page.getPageNo(), mapper.selectBoardReviewCount(page)));
		return result;
	}
	
	// 페이징
	@Override
	public int selectBoardReviewCount(PageBoardReview page) {
		return mapper.selectBoardReviewCount(page);
	}
	
	// 댓글 등록
	@Override
	public void insertBoardReview(BoardReview boardReview) {
		mapper.insertBoardReview(boardReview);
	}
	
	// 댓글 하나만 가져오기
	@Override
	public BoardReview selectBoardReviewOneByNo (int boardReviewNo) {
		return mapper.selectBoardReviewOneByNo(boardReviewNo);
	}
	
	// 댓글 삭제
	@Override
	public void deleteBoardReview(int boardReviewNo) {
		mapper.deleteBoardReview(boardReviewNo);
	}
	
	// 댓글 수정
	@Override
	public void updateBoardView(BoardReview boardReview) {
		mapper.updateBoardView(boardReview);
	}



//모임 자유게시판 부분

	// 글목록, 페이징
	@Override
	public Map<String, Object> freeList(MeetupDetailFreePage page) {
		Map<String, Object> result = new HashMap<>();
		result.put("list", mapper.selectFreeBoard(page));
		result.put("pageResult", new PageResult(page.getFreePageNo(), mapper.selectFreeBoardCount(page.getMeetNo())));
		return result;
	}
	
	// 글상세
	@Override
	public Board freeDetail(int boardNo) {
		return mapper.selectFreeBoardByNo(boardNo);
	}
	
	// 글등록
	@Override
	public void freeWrite(Board board) throws Exception {
		mapper.insertFreeBoard(board);
	}
	
	// 글삭제
	@Override
	public void freeDelete(int boardNo) {
		mapper.deleteFreeBoard(boardNo);
	}
	
	// 글수정 폼
	@Override
	public Board updateFreeBoardForm(int boardNo) {
		return mapper.selectFreeBoardByNo(boardNo);
	}
	
	// 글수정
	@Override
	public void updateFreeBoard(Board board) {
		mapper.updateFreeBoard(board);
	}
	
	// 조회수
	@Override
	public void updateFreeBoardViewCnt(int boardNo) {
		mapper.updateFreeBoardViewCnt(boardNo);
	}
	
	/** 댓글 */
	
	// 댓글 목록
	@Override
	public Map selectFreeBoardView(PageBoardReview page) {
		Map<String, Object> result = new HashMap<>();
		result.put("list", mapper.selectFreeBoardView(page));
		result.put("pageResult", new PageResult(page.getPageNo(), mapper.selectFreeBoardReviewCount(page)));
		return result;
	}
	
	// 페이징
	@Override
	public int selectFreeBoardReviewCount(PageBoardReview page) {
		return mapper.selectFreeBoardReviewCount(page);
	}
	
	// 댓글 등록
	@Override
	public void insertFreeBoardReview(BoardReview boardReview) {
		mapper.insertFreeBoardReview(boardReview);
	}
	
	// 댓글 하나만 가져오기
	@Override
	public BoardReview selectFreeBoardReviewOneByNo (int boardReviewNo) {
		return mapper.selectFreeBoardReviewOneByNo(boardReviewNo);
	}
	
	// 댓글 삭제
	@Override
	public void deleteFreeBoardReview(int boardReviewNo) {
		mapper.deleteFreeBoardReview(boardReviewNo);
	}
	
	// 댓글 수정
	@Override
	public void updateFreeBoardView(BoardReview boardReview) {
		mapper.updateFreeBoardView(boardReview);
	}

	//회원명단 뿌려주기
	public List<MeetupMember> selectMeeupMemberList(int meetNo){
		return mapper.selectMeetupMemberList(meetNo);
	}
}



