package com.acorn.fin.user.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.acorn.fin.user.dao.UserDao;
import com.acorn.fin.user.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	public Map<String, Object> isExistId(String inputId) {
		boolean isExist=userDao.isExist(inputId); 
		Map<String, Object> map=new HashMap<>();
		map.put("isExist", isExist);
		return map;
	}

	@Override
	public void addUser(UserDto dto) {
		String inputPwd=dto.getPwd();
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(inputPwd);
		dto.setPwd(encodedPwd);
		userDao.addUser(dto);
	}
}
