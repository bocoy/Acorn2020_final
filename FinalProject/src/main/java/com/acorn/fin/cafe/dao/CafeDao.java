package com.acorn.fin.cafe.dao;

import java.util.List;

import com.acorn.fin.cafe.dto.CafeDto;

public interface CafeDao {
	public List<CafeDto> getList(CafeDto dto);
	public int getCount(CafeDto dto);
	public void insert(CafeDto dto);
}
