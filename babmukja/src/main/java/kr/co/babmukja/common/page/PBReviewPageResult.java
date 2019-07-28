package kr.co.babmukja.common.page;

public class PBReviewPageResult {
	private int pageNo;
	private int count;
	private int beginPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	public PBReviewPageResult(int pageNo, int count) {
		this.pageNo = pageNo;
		this.count = count;
		setPageInfo();
	}
	
	private void setPageInfo() {
		int lastPage = (count % 3 == 0) ? count / 3
				                         : count / 3 + 1;
		int tabSize = 3;
		int currTab = (pageNo) / tabSize + 1; 
		
		beginPage = (currTab -1) * tabSize + 1;
		endPage = (currTab * tabSize > lastPage) ? lastPage 
				                                     : currTab * tabSize;
		prev = beginPage != 1;
		next = endPage != lastPage;
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getCount() {
		return count;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}
}











