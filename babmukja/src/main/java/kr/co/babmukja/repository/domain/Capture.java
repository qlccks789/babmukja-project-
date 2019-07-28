package kr.co.babmukja.repository.domain;

import org.springframework.web.multipart.MultipartFile;

public class Capture {
	private int radioVal;
	private String base64String;
	private int recipeNo;
	private int memNo;
	private MultipartFile file;
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getRadioVal() {
		return radioVal;
	}
	public void setRadioVal(int radioVal) {
		this.radioVal = radioVal;
	}
	public String getBase64String() {
		return base64String;
	}
	public void setBase64String(String base64String) {
		this.base64String = base64String;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	@Override
	public String toString() {
		return "Capture [radioVal=" + radioVal + ", base64String=" + base64String + ", recipeNo=" + recipeNo
				+ ", memNo=" + memNo + ", file=" + file + "]";
	}
	
}
