package com.minieyes.picstory.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.minieyes.picstory.comment.bo.CommentBO;

@RestController
public class CommentRestController {

	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/post/comment/create")
	public Map<String, String> createComment(
			@RequestParam("postId") int postId,
			@RequestParam("content") String content,
			HttpServletRequest req){
		
		HttpSession session = req.getSession();
		
		int userId = (int) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		
		int count = commentBO.createComment(postId, userId, userName, content);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");			
		}
		
		return result;
		
	}
}
