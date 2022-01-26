package com.minieyes.picstory.user;

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
	
	@GetMapping("/test")
	public String test() {
		return "user/test";
	}
}
