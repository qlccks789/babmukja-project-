package kr.co.babmukja.repository.domain;

import java.util.Date;

public class Comment {
	private int noticeCommentNo; 
	private int noticeNo;         
    private String content;           
    private Date reg_date;
    private String secretAt;
	private int memNo;
	public int getNoticeCommentNo() {
		return noticeCommentNo;
	}
	public void setNoticeCommentNo(int noticeCommentNo) {
		this.noticeCommentNo = noticeCommentNo;
	}
	public String getSecretAt() {
		return secretAt;
	}
	public void setSecretAt(String secretAt) {
		this.secretAt = secretAt;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}           
    
    
   
	
}
