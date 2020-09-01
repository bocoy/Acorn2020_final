package com.acorn.fin.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.fin.user.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private SqlSession session;

	@Override
	public boolean isExist(String inputId) {
		String id=session.selectOne("userMapper.isExist", inputId);
		if(id==null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public void addUser(UserDto dto) {
		session.insert("userMapper.addUser", dto);
	}
}
