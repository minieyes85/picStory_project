package com.minieyes.picstory.like.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public int insertLike(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	public List<Map<String, Integer>> selectLike(@Param("userId") int userId);
	
	public int deleteLike(
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	
}
