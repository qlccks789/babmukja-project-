package kr.co.babmukja.repository.domain;

import java.util.Date;
import java.util.List;

public class StorePBReview {
	private int pbReviewNo;
	private int pbNo;
	private String content;
	private int rating;
	private Date regDate;
	private int memNo;
	private String memNickname;
	private String path;
	private String sysname;
	private Member member;
	private List<ReviewFileVO> reviewFile;

	public List<ReviewFileVO> getReviewFile() {
		return reviewFile;
	}
	public void setReviewFile(List<ReviewFileVO> reviewFile) {
		this.reviewFile = reviewFile;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getSysname() {
		return sysname;
	}
	public void setSysname(String sysname) {
		this.sysname = sysname;
	}
	public String getMemNickname() {
		return memNickname;
	}
	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}
	
	public int getPbReviewNo() {
		return pbReviewNo;
	}
	public void setPbReviewNo(int pbReviewNo) {
		this.pbReviewNo = pbReviewNo;
	}
	public int getPbNo() {
		return pbNo;
	}
	public void setPbNo(int pbNo) {
		this.pbNo = pbNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
}
