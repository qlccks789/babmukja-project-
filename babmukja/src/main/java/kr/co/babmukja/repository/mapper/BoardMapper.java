package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Board;
import kr.co.babmukja.repository.domain.BoardReview;
import kr.co.babmukja.repository.domain.MeetupDetailNoticePage;
import kr.co.babmukja.repository.domain.PageBoardReview;

public interface BoardMapper {
	public List<Board> selectBoard(MeetupDetailNoticePage page); // 글목록
	
	public int selectBoardCount(); // 페이징
	
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
}
