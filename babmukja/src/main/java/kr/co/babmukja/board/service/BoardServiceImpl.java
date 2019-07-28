package kr.co.babmukja.board.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.common.page.PageResult;
import kr.co.babmukja.repository.domain.Board;
import kr.co.babmukja.repository.domain.BoardReview;
import kr.co.babmukja.repository.domain.MeetupDetailNoticePage;
import kr.co.babmukja.repository.domain.PageBoardReview;
import kr.co.babmukja.repository.mapper.BoardMapper;

@Service("kr.co.babmukja.board.service.BoardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	// 글목록, 페이징
	@Override
	public Map<String, Object> list(MeetupDetailNoticePage page) {
		Map<String, Object> result = new HashMap<>();
		result.put("list", mapper.selectBoard(page));
		result.put("pageResult", new PageResult(page.getNoticePageNo(), mapper.selectBoardCount()));
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
	
}
