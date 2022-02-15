package com.minieyes.picstory.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.minieyes.picstory.comment.dao.CommentDAO;
import com.minieyes.picstory.comment.model.Comment;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	public int createComment(
			int postId,
			int userId,
			String userName,
			String content) {
		
		return commentDAO.insertComment(postId, userId, userName, content);
		
	}
	
	public List<Comment> getCommentList(int postId){
		return commentDAO.selectComment(postId);
	}
	
	public int removeComment(int commentId) {
		return commentDAO.deleteComment(commentId);
	}
	
	public int updateComment(int commentId, String content) {
		return commentDAO.updateComment(commentId, content);
	}
}
