package kr.co.babmukja.repository.domain;

public class MeetupDetailNoticePage {
	private int meetNo;
	public int getMeetNo() {
		return meetNo;
	}
	public void setMeetNo(int meetNo) {
		this.meetNo = meetNo;
	}
	private int noticePageNo = 1;
	public int getNoticePageNo() {
		return noticePageNo;
	}
	public void setNoticePageNo(int noticePageNo) {
		this.noticePageNo = noticePageNo;
	}
	public int getBegin() {
		return (this.noticePageNo -1) * 5;
	}
	public int getEnd() {
		return 5;
	}
}
