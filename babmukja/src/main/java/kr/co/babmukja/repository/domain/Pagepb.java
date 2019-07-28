package kr.co.babmukja.repository.domain;

public class Pagepb {
	private int pageNo = 1;
	private String sortType = "0";
	private String searchName;
	
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getSortType() {
		return sortType;
	}
	public void setSortType(String sortType) {
		this.sortType = sortType;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getBegin() {
		return (this.pageNo -1) * 12;
	}
	
	public int getEnd() {
		return 12;
	}
}
