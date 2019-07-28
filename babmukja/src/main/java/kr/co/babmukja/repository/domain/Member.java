package kr.co.babmukja.repository.domain;

import java.util.Date;

public class Member {
	private int memNo;
	private String memName;
	private String memPhone;
	private String memEmail;
	private String memNickname;
	private String memPass;
	private String postNo;
	private String addrDefault;
	private String addrDetail;
	private int managerAt;
	
	private String memImgOrgname;
	private String memImgSysname;
	private String memImgPath;
	
	private Date signDate;
	private Date lastDate;
	private int socialAt;
	private int point;
	private int hintNo;
	private String hintAnswer;
	private int gradeNo;
	private int sellingCnt;
	private String gradeName;
	private int totalBuy;
	private int totalSel;
	private int orderNo;
	private int sellMemNo;
	private int buyMemNo;
	private int totCount;
	private char get;
	private int orderSum;
	private String deliveryNo;
	private char verify;
	private int certification; 
	private String accessToken;
	private String profileImageUrl;
	private String thumbnailUrl;
	
	private int recipeCnt;
	private int follower;
	private int follow;
	
	
	
	public int getFollower() {
		return follower;
	}

	public void setFollower(int follower) {
		this.follower = follower;
	}

	public int getFollow() {
		return follow;
	}

	public void setFollow(int follow) {
		this.follow = follow;
	}

	public String getProfileImageUrl() {
		return profileImageUrl;
	}

	public void setProfileImageUrl(String profileImageUrl) {
		this.profileImageUrl = profileImageUrl;
	}

	public String getThumbnailUrl() {
		return thumbnailUrl;
	}

	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public int getCertification() {
		return certification;
	}

	public void setCertification(int certification) {
		this.certification = certification;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getSellMemNo() {
		return sellMemNo;
	}

	public void setSellMemNo(int sellMemNo) {
		this.sellMemNo = sellMemNo;
	}

	public int getBuyMemNo() {
		return buyMemNo;
	}

	public void setBuyMemNo(int buyMemNo) {
		this.buyMemNo = buyMemNo;
	}

	public int getTotCount() {
		return totCount;
	}

	public void setTotCount(int totCount) {
		this.totCount = totCount;
	}

	public char getGet() {
		return get;
	}

	public void setGet(char get) {
		this.get = get;
	}

	public int getOrderSum() {
		return orderSum;
	}

	public void setOrderSum(int orderSum) {
		this.orderSum = orderSum;
	}

	public String getDeliveryNo() {
		return deliveryNo;
	}

	public void setDeliveryNo(String deliveryNo) {
		this.deliveryNo = deliveryNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	
	public String getMemNickname() {
		return memNickname;
	}

	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}

	public String getMemPass() {
		return memPass;
	}

	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public String getAddrDefault() {
		return addrDefault;
	}

	public void setAddrDefault(String addrDefault) {
		this.addrDefault = addrDefault;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public int getManagerAt() {
		return managerAt;
	}

	public void setManagerAt(int managerAt) {
		this.managerAt = managerAt;
	}

	public Date getSignDate() {
		return signDate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	public Date getLastDate() {
		return lastDate;
	}

	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}

	public int getSocialAt() {
		return socialAt;
	}

	public void setSocialAt(int socialAt) {
		this.socialAt = socialAt;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getHintNo() {
		return hintNo;
	}

	public void setHintNo(int hintNo) {
		this.hintNo = hintNo;
	}

	public String getHintAnswer() {
		return hintAnswer;
	}

	public void setHintAnswer(String hintAnswer) {
		this.hintAnswer = hintAnswer;
	}


	public int getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}

	public int getRecipeCnt() {
		return recipeCnt;
	}

	public void setRecipeCnt(int recipeCnt) {
		this.recipeCnt = recipeCnt;
	}

	public int getSellingCnt() {
		return sellingCnt;
	}

	public void setSellingCnt(int sellingCnt) {
		this.sellingCnt = sellingCnt;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getTotalBuy() {
		return totalBuy;
	}

	public void setTotalBuy(int totalBuy) {
		this.totalBuy = totalBuy;
	}

	public int getTotalSel() {
		return totalSel;
	}

	public void setTotalSel(int totalSel) {
		this.totalSel = totalSel;
	}

	public char getVerify() {
		return verify;
	}

	public void setVerify(char verify) {
		this.verify = verify;
	}

	public String getMemImgOrgname() {
		return memImgOrgname;
	}

	public void setMemImgOrgname(String memImgOrgname) {
		this.memImgOrgname = memImgOrgname;
	}

	public String getMemImgSysname() {
		return memImgSysname;
	}

	public void setMemImgSysname(String memImgSysname) {
		this.memImgSysname = memImgSysname;
	}

	public String getMemImgPath() {
		return memImgPath;
	}

	public void setMemImgPath(String memImgPath) {
		this.memImgPath = memImgPath;
	}
	
	

}