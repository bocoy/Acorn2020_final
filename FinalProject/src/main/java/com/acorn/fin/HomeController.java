package com.acorn.fin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class HomeController {
	
	
	@RequestMapping("/home")
	public String home() {

		return "home";
	}
	
	@RequestMapping("/cafe/list")
	public String list() {
		return "cafe/list";
	}
	
	@RequestMapping("/navbar")
	public String navbar() {
		return "navbar";
	}
}
