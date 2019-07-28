package kr.co.babmukja.repository.domain;

import java.util.Date;

public class StorePBInquire {
	private int pbNo;
	private int inquiryNo;
	private String content;
	private Date inquiryRegdate;
	private String answer;
	private Date answerRegdate;
	private int memNo;
	private String memNickname;
	private String answerStatus;
	private Member member;
	
	public String getAnswerStatus() {
		return answerStatus;
	}
	public void setAnswerStatus(String answerStatus) {
		this.answerStatus = answerStatus;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public String getMemNickname() {
		return memNickname;
	}
	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getPbNo() {
		return pbNo;
	}
	public void setPbNo(int pbNo) {
		this.pbNo = pbNo;
	}
	public int getInquiryNo() {
		return inquiryNo;
	}
	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getInquiryRegdate() {
		return inquiryRegdate;
	}
	public void setInquiryRegdate(Date inquiryRegdate) {
		this.inquiryRegdate = inquiryRegdate;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getAnswerRegdate() {
		return answerRegdate;
	}
	public void setAnswerRegdate(Date answerRegdate) {
		this.answerRegdate = answerRegdate;
	}
}
