package kr.co.babmukja.repository.domain;

public class StorePBLike {
	private int likeNo;
	private int pbNo;
	private int memNo;
	private String likeStatus;
	
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public int getPbNo() {
		return pbNo;
	}
	public void setPbNo(int pbNo) {
		this.pbNo = pbNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getLikeStatus() {
		return likeStatus;
	}
	public void setLikeStatus(String likeStatus) {
		this.likeStatus = likeStatus;
	}

}
