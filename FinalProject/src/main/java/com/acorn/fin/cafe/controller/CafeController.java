package com.acorn.fin.cafe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.fin.cafe.dto.CafeDto;
import com.acorn.fin.cafe.service.CafeService;

@Controller
public class CafeController {
	@Autowired
	private CafeService cafeService;
	
	@RequestMapping("/cafe/newtextform")
	public String newTextForm(HttpSession session) {
		return "cafe/newtextform";
	}
	
	@RequestMapping("/cafe/list")
	public ModelAndView getList(HttpServletRequest request, 
			ModelAndView mView) {
		cafeService.getList(request);
		mView.setViewName("cafe/list");
		return mView;
	}
	
	@RequestMapping(value = "/cafe/insert", method=RequestMethod.POST)
	public ModelAndView insert(CafeDto dto, ModelAndView mView, HttpSession session) {
		String id=(String)session.getAttribute("id");
		dto.setWriter(id);
		cafeService.insert(dto);
		mView.setViewName("cafe/insert");
		return mView;
	}
}
