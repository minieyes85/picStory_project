package com.minieyes.picstory.comment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/post/comment")
@Controller
public class CommentController {
	
	@GetMapping("/delete")
	public int deleteComment(@RequestParam("id") int commentId) {
		
		return 1;
	}
}
