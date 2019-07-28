package kr.co.babmukja.repository.domain;

public class MeetupDetailFreePage {
	private int meetNo;
	public int getMeetNo() {
		return meetNo;
	}
	public void setMeetNo(int meetNo) {
		this.meetNo = meetNo;
	}
	private int freePageNo = 1;
	public int getFreePageNo() {
		return freePageNo;
	}
	public void setFreePageNo(int noticePageNo) {
		this.freePageNo = noticePageNo;
	}
	public int getBegin() {
		return (this.freePageNo -1) * 5;
	}
	public int getEnd() {
		return 5;
	}
}
