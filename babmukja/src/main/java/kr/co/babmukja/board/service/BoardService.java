package kr.co.babmukja.board.service;

import java.util.Map;

import kr.co.babmukja.repository.domain.Board;
import kr.co.babmukja.repository.domain.BoardReview;
import kr.co.babmukja.repository.domain.MeetupDetailNoticePage;
import kr.co.babmukja.repository.domain.PageBoardReview;

public interface BoardService {
	
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
}
