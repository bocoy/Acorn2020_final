package com.acorn.fin.user.service;

import java.util.Map;

import com.acorn.fin.user.dto.UserDto;

public interface UserService {
	public Map<String, Object> isExistId(String inputId);
	public void addUser(UserDto dto);
}
