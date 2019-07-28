package kr.co.babmukja.repository.domain;

public class RecipeFollow {
	private int followNo;
	private int followMemNo;
	private int followerMemNo;
	private String followStatus;
	
	public int getFollowNo() {
		return followNo;
	}
	public void setFollowNo(int followNo) {
		this.followNo = followNo;
	}
	public int getFollowMemNo() {
		return followMemNo;
	}
	public void setFollowMemNo(int followMemNo) {
		this.followMemNo = followMemNo;
	}
	public int getFollowerMemNo() {
		return followerMemNo;
	}
	public void setFollowerMemNo(int followerMemNo) {
		this.followerMemNo = followerMemNo;
	}
	public String getFollowStatus() {
		return followStatus;
	}
	public void setFollowStatus(String followStatus) {
		this.followStatus = followStatus;
	}
	
	
}
