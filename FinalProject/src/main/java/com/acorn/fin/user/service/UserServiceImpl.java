package com.acorn.fin.user.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

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

	@Override
	public void loginProcess(UserDto dto, ModelAndView mView, HttpSession session) {
		boolean isValid=false;  
		UserDto resultDto=userDao.getData(dto.getId());
		if(resultDto != null) { 
			String encodedPwd=resultDto.getPwd();
			String inputPwd=dto.getPwd(); 
			isValid=BCrypt.checkpw(inputPwd, encodedPwd);
		}
		if(isValid) { 
			session.setAttribute("id", dto.getId()); 
			mView.addObject("isSuccess", true);
		}else {
			mView.addObject("isSuccess", false);
		}
	}
}
