package gazua.service;

import java.util.List;

import gazua.model.Comment;

public interface CommentService {
	
	public void insertCommentTour(Comment comment) throws Exception;
	
	
	public Comment selectCommentTour(Comment comment) throws Exception;
	
	public List<Comment> selectCommentListTour(Comment comment) throws Exception;
	
	public int selectCommentCountByMemberId(Comment comment) throws Exception;
	
	public void deleteComment(Comment comment) throws Exception;
	
	public void updateComment(Comment comment) throws Exception;
	
}
