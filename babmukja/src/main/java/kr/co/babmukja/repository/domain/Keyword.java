package kr.co.babmukja.repository.domain;

public class Keyword {
	private int keywordNo;
	private int keywordMapNo;
	private String keyword;
	private int recipeNo;
	
	private int cnt;
	
	
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public int getKeywordMapNo() {
		return keywordMapNo;
	}
	public void setKeywordMapNo(int keywordMapNo) {
		this.keywordMapNo = keywordMapNo;
	}
	public int getKeywordNo() {
		return keywordNo;
	}
	public void setKeywordNo(int keywordNo) {
		this.keywordNo = keywordNo;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
