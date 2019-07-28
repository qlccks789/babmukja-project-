package kr.co.babmukja.repository.domain;

public class PagePbReview {
	private int pageNo = 0;
	private int pbNo;
	private int index;
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
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getPbNo() {
		return pbNo;
	}
	public void setPbNo(int pbNo) {
		this.pbNo = pbNo;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getBegin() {
		return (this.pageNo) * 3;
	}
	public int getEnd() {
		return 3;
	}
}
