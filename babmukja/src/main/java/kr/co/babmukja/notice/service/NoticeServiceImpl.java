package kr.co.babmukja.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.babmukja.common.page.PageResult;
import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Notice;
import kr.co.babmukja.repository.domain.NoticeFileVO;
import kr.co.babmukja.repository.domain.PageNotice;
import kr.co.babmukja.repository.mapper.NoticeMapper;

@Service("kr.co.babmukja.notice.service.NoticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	public NoticeMapper mapper;
		
	public void write(Notice notice) throws Exception{
        mapper.insertNotice(notice);
    }
	public void insertNoticeImage(FileVO fileVO) throws Exception{
		mapper.insertNoticeImage(fileVO);
	}
	
	public int getMax() throws Exception{
		return mapper.selectMaxNum();
	}
	
	public Notice updateForm(int no) throws Exception{
		return mapper.selectNoticeByNo(no);	
	}
	
	public void update(Notice notice) throws Exception{
         mapper.updateNotice(notice);
    }
	
	@Transactional
	@Override
	public void updateViewCnt(int noticeNo) throws Exception{
		mapper.updateViewCnt(noticeNo);
	}
	
	public void delete(int no) throws Exception{
        mapper.deleteNotice(no);
    }
	
	public Notice detail(int no) throws Exception{
		mapper.updateViewCnt(no);
		return mapper.selectNoticeByNo(no);
	}
	
//	public List<Notice> selectNoticeList() throws Exception{
//		return mapper.selectNoticeList();
//	}
	
	@Override
	public Map<String, Object> list(PageNotice page) throws Exception{
		Map<String, Object> result = new HashMap<>();
		result.put("list", mapper.selectNotice(page));
		result.put("pageResult", new PageResult(page.getPageNo(), mapper.selectNoticeCount()));
		return result;
	}
	
	@Override
	public void insertNoticeImage(NoticeFileVO fileVO) throws Exception{}
	

	

}
