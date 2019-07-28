package kr.co.babmukja.repository.domain;

public class Meetup {

int meetNo;	
String intro;
String title;
String fee;
String day;
String totalMem;
String category;
String fileDir;
String location;
int viewCnt;
String hostName;
int hostNo;
int manageNo;
String tag;

public String getTag() {
	return tag;
}
public void setTag(String tag) {
	this.tag = tag;
}
public int getManageNo() {
	return manageNo;
}
public void setManageNo(int manageNo) {
	this.manageNo = manageNo;
}
public String getHostName() {
	return hostName;
}
public void setHostName(String hostName) {
	this.hostName = hostName;
}
public int getHostNo() {
	return hostNo;
}
public void setHostNo(int hostNo) {
	this.hostNo = hostNo;
}
public String getLocation() {
	return location;
}
public void setLocation(String location) {
	this.location = location;
}
public String getFileDir() {
	return fileDir;
}
public void setFileDir(String fileDir) {
	this.fileDir = fileDir;
}

public int getMeetNo() {
	return meetNo;
}
public void setMeetNo(int meetNo) {
	this.meetNo = meetNo;
}
public String getIntro() {
	return intro;
}
public void setIntro(String intro) {
	this.intro = intro;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getFee() {
	return fee;
}
public void setFee(String fee) {
	this.fee = fee;
}
public String getDay() {
	return day;
}
public void setDay(String day) {
	this.day = day;
}
public String getTotalMem() {
	return totalMem;
}
public void setTotalMem(String totalMem) {
	this.totalMem = totalMem;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public int getViewCnt() {
	return viewCnt;
}
public void setViewCnt(int viewCnt) {
	this.viewCnt = viewCnt;
}

}