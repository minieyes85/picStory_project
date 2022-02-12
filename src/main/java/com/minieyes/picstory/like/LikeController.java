package com.minieyes.picstory.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.minieyes.picstory.like.BO.LikeBO;

@Controller
@RequestMapping("/post/like")
public class LikeController {

	@Autowired
	private LikeBO likeBO;
	
	@GetMapping("/create")
	public Map<String, String> createLike(
			@RequestParam("postId") int postId,
			HttpServletRequest req){
		
		HttpSession session = req.getSession();
		
		int userId = (int) session.getAttribute("userId");
		
		int count = likeBO.createLike(postId, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}
}
