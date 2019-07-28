package kr.co.babmukja.repository.domain;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Board {

	// board
	private int meetNo;
	public int getMeetNo() {
		return meetNo;
	}

	public void setMeetNo(int meetNo) {
		this.meetNo = meetNo;
	}

	private int BoardNo;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcnt;

	public int getBoardNo() {
		return BoardNo;
	}

	public void setBoardNo(int boardNo) {
		BoardNo = boardNo;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	// file
	private String imgpath;
	private String imgOrgname;
	private String imgSysname;
	private MultipartFile boardfile;

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	public String getImgOrgname() {
		return imgOrgname;
	}

	public void setImgOrgname(String imgOrgname) {
		this.imgOrgname = imgOrgname;
	}

	public String getImgSysname() {
		return imgSysname;
	}

	public void setImgSysname(String imgSysname) {
		this.imgSysname = imgSysname;
	}

	public MultipartFile getBoardfile() {
		return boardfile;
	}

	public void setBoardfile(MultipartFile boardfile) {
		this.boardfile = boardfile;
	}

	

	



}
