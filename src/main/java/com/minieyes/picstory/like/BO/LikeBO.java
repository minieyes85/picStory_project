package com.minieyes.picstory.like.BO;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.minieyes.picstory.like.DAO.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	public int createLike(int postId, int userId) {
		return likeDAO.insertLike(postId, userId);
	}
	
	public List<Map<String, Integer>> selectLike(int userId){
		return likeDAO.selectLike(userId);
	}
	
}
