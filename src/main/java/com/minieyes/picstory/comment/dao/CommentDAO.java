package com.minieyes.picstory.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.minieyes.picstory.comment.model.Comment;

@Repository
public interface CommentDAO {

	public int insertComment(
			@Param("postId") int postId,
			@Param("userId") int userId,			
			@Param("userName") String userName,
			@Param("content") String content);
	
	public List<Comment> selectComment(@Param("postId") int postId);
	
	public int deleteComment(@Param("id") int commentId);
	
	public int updateComment(
			@Param("id") int commentId,
			@Param("content") String content);
}
