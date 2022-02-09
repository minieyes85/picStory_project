package com.minieyes.picstory.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.minieyes.picstory.post.bo.PostBO;

@RestController
public class PostRestController {
	
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/post/create")
	public Map<String, String> postCreate(
			@RequestParam("content") String content,
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		int userId = (int) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		
		int count = postBO.createPost(userId, userName, content, file);
				
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result","success");
		} else {
			result.put("result","fail");			
		}
		
		return result;
	}
	
	@PostMapping("/post/update")
	public Map<String, String> postUpdate(
			@RequestParam("postId") int postId,
			@RequestParam("content") String content) {
		
		int count = postBO.updatePost(postId, content);
		
		Map<String, String> result = new HashMap<>();

		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	
	}
}

