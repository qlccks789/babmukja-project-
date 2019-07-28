package kr.co.babmukja.notice.service;

import java.util.List;
import java.util.Map;

import kr.co.babmukja.repository.domain.Notice;
import kr.co.babmukja.repository.domain.NoticeFileVO;
import kr.co.babmukja.repository.domain.PageNotice;

public interface NoticeService {
    public void write(Notice notice) throws Exception;
    public void insertNoticeImage(NoticeFileVO fileVO) throws Exception;
	public int getMax() throws Exception;
	public Notice updateForm(int no) throws Exception;
	public void update(Notice notice) throws Exception;
	public void delete(int no) throws Exception;
	public Notice detail(int no) throws Exception;
    public Map<String, Object> list(PageNotice page) throws Exception; // 글목록
//    public List<Notice> selectNoticeList() throws Exception;
    public void updateViewCnt(int noticeNo) throws Exception;

	

	
	
}
