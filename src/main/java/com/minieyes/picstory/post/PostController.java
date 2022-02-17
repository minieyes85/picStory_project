package com.minieyes.picstory.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.minieyes.picstory.post.bo.PostBO;
import com.minieyes.picstory.post.model.Post;
import com.minieyes.picstory.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostBO postBO;
	
	@GetMapping("timeline_view")
	public String postTimeLine1(
				Model model,
				HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		int userId = (int) session.getAttribute("userId");
		
		List<PostDetail> post = postBO.getPostList(userId);
		
		model.addAttribute("userId", userId);
		model.addAttribute("post", post);
		
		return "post/timeLine";
	}

	@GetMapping("/create_view")
	public String postCreate() {
		return "post/create";
	}
	
	@GetMapping("/update_view")
	public String postUpdate(
			@RequestParam("id") int id,
			HttpServletRequest req,
			Model model) {
		
		HttpSession session = req.getSession();
		
		int userId = (Integer) session.getAttribute("userId");
		
		Post post = postBO.findPost(id);
		
		if(userId != post.getUserId()) {
			return "unavailable request";
		} else {
			model.addAttribute("post", post);
			
			return "post/update";	
		}
		
	}
	
	@GetMapping("/delete")
	public String postDelete(
			@RequestParam("id") int postId,
			HttpServletRequest req) {
		
		HttpSession session = req.getSession(); 
		int userId = (Integer) session.getAttribute("userId");
		
		int count = postBO.deletePost(userId, postId);
		
		if(count == 1) {
			return "redirect:/post/timeline_view";
		} else {
			return "post/timeLine";
		}
	}
}
