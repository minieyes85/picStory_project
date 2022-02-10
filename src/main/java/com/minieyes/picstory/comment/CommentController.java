package com.minieyes.picstory.comment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.minieyes.picstory.comment.bo.CommentBO;

@RequestMapping("/post/comment")
@Controller
public class CommentController {
	
	@Autowired
	private CommentBO commentBO;
	
	@GetMapping("/delete")
	@ResponseBody
	public Map<String, String> deleteComment(@RequestParam("commentId") int commentId) {
			
		int count = commentBO.removeComment(commentId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
