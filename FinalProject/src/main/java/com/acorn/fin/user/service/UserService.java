package com.acorn.fin.user.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.acorn.fin.user.dto.UserDto;

public interface UserService {
	public Map<String, Object> isExistId(String inputId);
	public void addUser(UserDto dto);
	public void loginProcess(UserDto dto, ModelAndView mView, HttpSession session);
}