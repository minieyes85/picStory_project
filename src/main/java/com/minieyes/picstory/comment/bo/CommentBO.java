package com.minieyes.picstory.comment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.minieyes.picstory.comment.dao.CommentDAO;

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
}
