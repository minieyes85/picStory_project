package com.minieyes.picstory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class TestController {
	
	@GetMapping("/test")
	@ResponseBody
	public String test() {
		
		return "Hello World";
	}
}
