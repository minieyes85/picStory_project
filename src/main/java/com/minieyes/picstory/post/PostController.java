package com.minieyes.picstory.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {

	@GetMapping("/timeline_view")
	public String postTimeLine() {
		return "post/timeLine";
	}
	
	@GetMapping("/create_view")
	public String postCreate() {
		return "post/create";
	}
}
