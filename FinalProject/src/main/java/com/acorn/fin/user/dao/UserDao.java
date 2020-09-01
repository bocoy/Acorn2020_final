package com.acorn.fin.user.dao;

import com.acorn.fin.user.dto.UserDto;

public interface UserDao {
	public boolean isExist(String inputId);
	public void addUser(UserDto dto);
	public UserDto getData(String id);
}
