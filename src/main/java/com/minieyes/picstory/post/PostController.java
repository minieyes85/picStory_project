package com.minieyes.picstory.post;

import java.util.ArrayList;
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

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostBO postBO;
	
	@GetMapping("/timeline_view")
	public String postTimeLine(
			Model model,
			HttpServletRequest req) {
		
		List<Post> posts = new ArrayList<>();
		posts = postBO.viewTimeLine();
		
		HttpSession session = req.getSession();
		
		model.addAttribute("Posts", posts);
		model.addAttribute("userId", session.getAttribute("userId"));
		
		return "post/timeLine";
	}
	
	@GetMapping("/create_view")
	public String postCreate() {
		return "post/create";
	}
	
	@GetMapping("/delete")
	public String postDelete(@RequestParam("id") int id) {
		
		int count = postBO.deletePost(id);
		
		if(count == 1) {
			return "redirect:/post/timeline_view";
		} else {
			return "post/timeLine";
		}
	}
}
