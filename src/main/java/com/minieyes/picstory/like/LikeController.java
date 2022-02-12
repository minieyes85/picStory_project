package com.minieyes.picstory.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/post/like")
public class LikeController {

	@GetMapping("/create")
	public Map<String, String> createLike(
			@RequestParam("id") int postId,
			HttpServletRequest req){
		
		Map<String, String> result = new HashMap<>();
		
		
		return result;
		
	}
}
