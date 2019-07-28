package kr.co.babmukja.repository.domain;

import java.util.Date;

public class BoardReview {
	private int boardReviewNo;
	private int boardNo;
	private String content;
	private Date regdate;
	private int viewcnt;
	
	public int getBoardReviewNo() {
		return boardReviewNo;
	}
	public void setBoardReviewNo(int boardReviewNo) {
		this.boardReviewNo = boardReviewNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
}
