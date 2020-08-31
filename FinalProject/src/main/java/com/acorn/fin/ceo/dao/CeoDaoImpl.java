package com.acorn.fin.ceo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CeoDaoImpl implements CeoDao{
	@Autowired
	private SqlSession session;

	@Override
	public int getCode() {
		return session.selectOne("ceoMapper.getCode");
	}
	
}
