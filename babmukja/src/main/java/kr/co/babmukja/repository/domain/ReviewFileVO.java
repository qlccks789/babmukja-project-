package kr.co.babmukja.repository.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ReviewFileVO extends FileVO{
	private int fileNo;
	private String sysname;
	private String orgname;
	private String path;
	private MultipartFile attach;
	private List<MultipartFile> imageList;	
	private int pbReviewNo;
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getSysname() {
		return sysname;
	}
	public void setSysname(String sysname) {
		this.sysname = sysname;
	}
	public String getOrgname() {
		return orgname;
	}
	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public MultipartFile getAttach() {
		return attach;
	}
	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}
	public List<MultipartFile> getImageList() {
		return imageList;
	}
	public void setImageList(List<MultipartFile> imageList) {
		this.imageList = imageList;
	}
	public int getPbReviewNo() {
		return pbReviewNo;
	}
	public void setPbReviewNo(int pbReviewNo) {
		this.pbReviewNo = pbReviewNo;
	}
	


}
