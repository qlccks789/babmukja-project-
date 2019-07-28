package kr.co.babmukja.repository.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class NoticeFileVO {
	private int fileNo;
	private String imgSysname;
	private String imgOrgname;
	private String imgpath;
	private MultipartFile attach;
	private List<MultipartFile> imageList;	
	private int noticeNO;
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	
	public String getImgSysname() {
		return imgSysname;
	}
	public void setImgSysname(String imgSysname) {
		this.imgSysname = imgSysname;
	}
	public String getImgOrgname() {
		return imgOrgname;
	}
	public void setImgOrgname(String imgOrgname) {
		this.imgOrgname = imgOrgname;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
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
	public int getNoticeNO() {
		return noticeNO;
	}
	public void setNoticeNO(int noticeNO) {
		this.noticeNO = noticeNO;
	}
}
