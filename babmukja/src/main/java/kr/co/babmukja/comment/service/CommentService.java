package kr.co.babmukja.comment.service;

import java.util.List;

import kr.co.babmukja.repository.domain.Comment;

public interface CommentService {
public int commentInsert(Comment comment) throws Exception;
	public List<Comment> commentList(int noticeNo) throws Exception;
	public int commentUpdate(Comment comment) throws Exception;
	public int commentDelete(int noticeCommentNo) throws Exception;
	public Comment commentSelectByNo(int noticeCommentNo) throws Exception;
}
