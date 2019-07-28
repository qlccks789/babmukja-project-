package kr.co.babmukja.repository.domain;

import java.sql.Date;

public class MeetupMember {

int meetMemNo;
int memNo;
String memName;
int meetNo;
int status;
String memEmail;
int admissionNum;
String memImgSysname;
String memImgPath;
public String getMemImgPath() {
	return memImgPath;
}
public void setMemImgPath(String memImgPath) {
	this.memImgPath = memImgPath;
}
String regDate;
Date joinDate;

public Date getJoinDate() {
	return joinDate;
}
public void setJoinDate(Date joinDate) {
	this.joinDate = joinDate;
}
public String getRegDate() {
	return regDate;
}
public void setRegDate(String regDate) {
	this.regDate = regDate;
}
public String getMemImgSysname() {
	return memImgSysname;
}
public void setMemImgSysname(String memImgSysname) {
	this.memImgSysname = memImgSysname;
}
public int getAdmissionNum() {
	return admissionNum;
}
public void setAdmissionNum(int admissionNum) {
	this.admissionNum = admissionNum;
}
public String getMemEmail() {
	return memEmail;
}
public void setMemEmail(String memEmail) {
	this.memEmail = memEmail;
}
public int getMeetMemNo() {
	return meetMemNo;
}
public void setMeetMemNo(int meetMemNo) {
	this.meetMemNo = meetMemNo;
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
public int getMeetNo() {
	return meetNo;
}
public void setMeetNo(int meetNo) {
	this.meetNo = meetNo;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
	
}
