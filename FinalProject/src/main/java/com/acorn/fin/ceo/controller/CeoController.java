package com.acorn.fin.ceo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.fin.ceo.service.CeoService;

@Controller
public class CeoController {
	@Autowired
	private CeoService ceoService;
	
	@RequestMapping("/login/ceo/ceo_loginform")
	public ModelAndView CeoLoginForm(HttpServletRequest request, ModelAndView mView) {
		String url=request.getParameter("url");
		if(url==null){
			String cPath=request.getContextPath();
			url=cPath+"/home.do";
		}
		mView.addObject("url",url);
		mView.setViewName("login/ceo/ceo_loginform");
		return mView;
	}
	
	@RequestMapping("/signup/signup_form_ceo")
	public ModelAndView CeoSignupForm(ModelAndView mView) {
		ceoService.getCode(mView);
		mView.setViewName("signup/signup_form_ceo");
		return mView;
		
	}
	
}
