package com.acorn.fin.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.fin.user.dto.UserDto;
import com.acorn.fin.user.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login/user/user_loginform")
	public ModelAndView userLoginForm(ModelAndView mView, HttpServletRequest request) {
		String url=request.getParameter("url");
		if(url==null){
			String cPath=request.getContextPath();
			url=cPath+"/home.do";
		}
		mView.addObject("url",url);
		
		mView.setViewName("login/user/user_loginform");
		return mView;
	}

	@RequestMapping("/login/choice_form_login")
	public String choiceLogin() {
		return "login/choice_form_login";
	}
	
	@RequestMapping("/signup/choice_form_signup")
	public String choiceSignup() {
		return "signup/choice_form_signup";
	}
	
	@RequestMapping("/signup/signup_form_user")
	public String SignupFormUser() {
		return "signup/signup_form_user";
	}
	
	@RequestMapping("/signup/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId){
		//service가 리턴해주는 Map 객체를 리턴한다.
		return userService.isExistId(inputId);
	}
	
	@RequestMapping("/signup/user_signup")
	public String UserSignup(UserDto dto) {
		userService.addUser(dto);
		return "signup/user_signup";
	}
}
