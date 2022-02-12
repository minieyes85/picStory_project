package com.minieyes.picstory.like.BO;

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
	
}
