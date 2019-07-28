package kr.co.babmukja.repository.domain;

import java.util.Date;

public class RecipeReview {
	private int memNo;
	private String memNickname;
	private int recipeReviewNo;
	private int recipeNo;
	private String content;
	private Date regdate;
	private int score;	
	private String memImgPath;
	private String memImgSysname;
	
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
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
	public int getRecipeReviewNo() {
		return recipeReviewNo;
	}
	public void setRecipeReviewNo(int recipeReviewNo) {
		this.recipeReviewNo = recipeReviewNo;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
}
