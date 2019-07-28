package kr.co.babmukja.repository.domain;

public class PageAfterSearch {
	private String city1;
	private String city2;
	private String city3;
	private String town1;
	private String town2;
	private String town3;
	private String search;	
	private String category;
	private int fee;
	private int pageNo;

	
	
	

	public String getCity1() {
		return city1;
	}
	public void setCity1(String city1) {
		this.city1 = city1;
	}
	public String getCity2() {
		return city2;
	}
	public void setCity2(String city2) {
		this.city2 = city2;
	}
	public String getCity3() {
		return city3;
	}
	public void setCity3(String city3) {
		this.city3 = city3;
	}
	public String getTown1() {
		return town1;
	}
	public void setTown1(String town1) {
		this.town1 = town1;
	}
	public String getTown2() {
		return town2;
	}
	public void setTown2(String town2) {
		this.town2 = town2;
	}
	public String getTown3() {
		return town3;
	}
	public void setTown3(String town3) {
		this.town3 = town3;
	}
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
		
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
	this.pageNo = pageNo;
		}
	public int getBegin() {
			return (this.pageNo -1) * 6;
		}
		public int getEnd() {
			return 6;
		}

	
}
