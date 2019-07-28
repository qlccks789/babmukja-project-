package kr.co.babmukja.repository.domain;

import java.util.List;

public class ReviewMap {
	private StorePBReview reviewList;
	private List<ReviewFileVO> reviewFile;
	private StorePB storepb;
	private Member member;
	
	public StorePB getStorepb() {
		return storepb;
	}
	public void setStorepb(StorePB storepb) {
		this.storepb = storepb;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public StorePBReview getReviewList() {
		return reviewList;
	}
	public void setReviewList(StorePBReview reviewList) {
		this.reviewList = reviewList;
	}
	public List<ReviewFileVO> getReviewFile() {
		return reviewFile;
	}
	public void setReviewFile(List<ReviewFileVO> reviewFile) {
		this.reviewFile = reviewFile;
	}

	
}
