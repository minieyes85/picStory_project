package com.minieyes.picstory.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.minieyes.picstory.common.FileManagerService;
import com.minieyes.picstory.post.dao.PostDAO;
import com.minieyes.picstory.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public int createPost(
			int userId,
			String userName,
			String content,
			MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file);

		return postDAO.insertPost(userId, userName, content);
	}
	
	public List<Post> viewTimeLine() {
		return postDAO.selectPost();
	}
}
