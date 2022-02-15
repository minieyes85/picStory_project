package com.minieyes.picstory.like.DAO;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.minieyes.picstory.like.model.LikeDTO;

@Repository
public interface LikeDAO {

	public int insertLike(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	public LikeDTO selectLike(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	public int deleteLike(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	
}
