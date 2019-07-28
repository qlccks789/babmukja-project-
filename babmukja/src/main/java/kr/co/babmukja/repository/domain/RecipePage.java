package kr.co.babmukja.repository.domain;

import java.util.Date;

public class RecipePage {
	
	private int memNo;
	private String memName;
	private String memNickname;
	private String memImgPath;
	private String memImgSysname;
	
	private int recipeNo;
	private String title;
	private String content;
	private Date regDate;
	private double rating;
	private int viewCnt;
	
	private int likeCnt;
	private int scrapCnt;
	
	private String imgPath;
	
	private int keywordNo;
	private int country;
	private String caution;
	private int situation;
	private int level;
	private int time;
	private int type;
	
	private String searchTitle;
	private String searchNickname;	
	
	public String getMemImgPath() {
		return memImgPath;
	}
	public void setMemImgPath(String memImgPath) {
		this.memImgPath = memImgPath;
	}
	public String getMemImgSysname() {
		return memImgSysname;
	}
	public void setMemImgSysname(String memImgSysname) {
		this.memImgSysname = memImgSysname;
	}
	public String getSearchTitle() {
		return searchTitle;
	}
	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}
	public String getSearchNickname() {
		return searchNickname;
	}
	public void setSearchNickname(String searchNickname) {
		this.searchNickname = searchNickname;
	}	
	public String getCaution() {
		return caution;
	}
	public void setCaution(String caution) {
		this.caution = caution;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getSituation() {
		return situation;
	}
	public void setSituation(int situation) {
		this.situation = situation;
	}		
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	private int pageNo;	
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getCountry() {
		return country;
	}
	public void setCountry(int country) {
		this.country = country;
	}
	public int getKeywordNo() {
		return keywordNo;
	}
	public void setKeywordNo(int keywordNo) {
		this.keywordNo = keywordNo;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public int getScrapCnt() {
		return scrapCnt;
	}
	public void setScrapCnt(int scrapCnt) {
		this.scrapCnt = scrapCnt;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
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
	public String getMemNickname() {
		return memNickname;
	}
	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
