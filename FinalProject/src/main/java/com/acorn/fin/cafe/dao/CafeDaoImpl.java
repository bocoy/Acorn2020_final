package com.acorn.fin.cafe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.fin.cafe.dto.CafeDto;

@Repository
public class CafeDaoImpl implements CafeDao {
	@Autowired
	private SqlSession session;
	@Override
	public List<CafeDto> getList(CafeDto dto) {
		return session.selectList("cafeMapper.getList", dto);
	}
	@Override
	public int getCount(CafeDto dto) {
		return session.selectOne("cafeMapper.getCount", dto);
	}
	@Override
	public void insert(CafeDto dto) {
		session.insert("cafeMapper.insert", dto);
	}
}
