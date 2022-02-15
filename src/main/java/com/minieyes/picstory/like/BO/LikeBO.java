package com.minieyes.picstory.like.BO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.minieyes.picstory.like.DAO.LikeDAO;
import com.minieyes.picstory.like.model.LikeDTO;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	public int createLike(int postId, int userId) {
		return likeDAO.insertLike(postId, userId);
	}
	
	public LikeDTO getLike(int postId, int userId){
		return likeDAO.selectLike(postId, userId);
	}
	
	public int deleteLike(int postId, int userId) {
		return likeDAO.deleteLike(postId, userId);
	}
	
}
