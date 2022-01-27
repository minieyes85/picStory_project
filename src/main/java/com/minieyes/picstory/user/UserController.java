package com.minieyes.picstory.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@GetMapping("/signin_view")
	public String signIn() {
		return "user/signIn";
	}
	
	@GetMapping("/signup_view")
	public String signUp() {
		return "user/signUp";
	}
	
	@GetMapping("/update_view")
	public String update() {
		return "user/update";
	}
	
	@GetMapping("/signOut")
	public String signOut(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		session.removeAttribute("userEmail");	
		
		return "redirect:/user/signin_view";
	}
	
	@GetMapping("/test_view")
	public String test() {
		return "user/test";
	}
}
