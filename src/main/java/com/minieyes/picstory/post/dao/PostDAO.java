package com.minieyes.picstory.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.minieyes.picstory.post.model.Post;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("content") String content,
			@Param("imagePath") String imagePath);
	
	public List<Post> selectPost();
	
	public Post selectTargetPost(@Param("id") int id);
	
	public int updatePost(
			@Param("id") int id,
			@Param("content") String content);
	
	public int deletePost(@Param("id") int id);
	
}
