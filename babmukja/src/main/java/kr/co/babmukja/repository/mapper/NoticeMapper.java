package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Notice;
import kr.co.babmukja.repository.domain.NoticeFileVO;
import kr.co.babmukja.repository.domain.PageNotice;

public interface NoticeMapper {
//	public List<Notice> selectNotice(Page page);
	List<Notice> selectNoticeList() throws Exception;
	public List<Notice> selectNotice(PageNotice page) throws Exception; // 글목록
	public int selectNoticeCount() throws Exception;
	void insertNotice(Notice notice) throws Exception;
	Notice selectNoticeByNo(int noticeNo) throws Exception;
	int deleteNotice(int no) throws Exception;
    int updateNotice(Notice notice) throws Exception; 
    public void insertNoticeImage(NoticeFileVO fileVO) throws Exception;
	public int selectMaxNum() throws Exception;
	public void updateViewCnt(int noticeNo) throws Exception;
	public void insertNoticeImage(FileVO fileVO) throws Exception;
	
}
