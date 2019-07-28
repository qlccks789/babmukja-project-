package kr.co.babmukja.repository.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MemberFileVO extends FileVO{
	private String memNickname;

	
	public String getMemNickname() {
		return memNickname;
	}

	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}

	@Override
	public MultipartFile getAttach() {
		// TODO Auto-generated method stub
		return super.getAttach();
	}

	@Override
	public void setAttach(MultipartFile attach) {
		// TODO Auto-generated method stub
		super.setAttach(attach);
	}

	@Override
	public List<MultipartFile> getImageList() {
		// TODO Auto-generated method stub
		return super.getImageList();
	}

	@Override
	public void setImageList(List<MultipartFile> imageList) {
		// TODO Auto-generated method stub
		super.setImageList(imageList);
	}

	@Override
	public int getFileNo() {
		// TODO Auto-generated method stub
		return super.getFileNo();
	}

	@Override
	public void setFileNo(int fileNo) {
		// TODO Auto-generated method stub
		super.setFileNo(fileNo);
	}

	@Override
	public int getGroupNo() {
		// TODO Auto-generated method stub
		return super.getGroupNo();
	}

	@Override
	public void setGroupNo(int groupNo) {
		// TODO Auto-generated method stub
		super.setGroupNo(groupNo);
	}

	@Override
	public String getSysname() {
		// TODO Auto-generated method stub
		return super.getSysname();
	}

	@Override
	public void setSysname(String sysname) {
		// TODO Auto-generated method stub
		super.setSysname(sysname);
	}

	@Override
	public String getOrgname() {
		// TODO Auto-generated method stub
		return super.getOrgname();
	}

	@Override
	public void setOrgname(String orgname) {
		// TODO Auto-generated method stub
		super.setOrgname(orgname);
	}

	@Override
	public String getPath() {
		// TODO Auto-generated method stub
		return super.getPath();
	}

	@Override
	public void setPath(String path) {
		// TODO Auto-generated method stub
		super.setPath(path);
	}

	@Override
	public int getMemNo() {
		// TODO Auto-generated method stub
		return super.getMemNo();
	}

	@Override
	public void setMemNo(int memNo) {
		// TODO Auto-generated method stub
		super.setMemNo(memNo);
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}

	@Override
	public boolean equals(Object arg0) {
		// TODO Auto-generated method stub
		return super.equals(arg0);
	}

	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
}
