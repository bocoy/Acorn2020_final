package com.acorn.fin.cafe.service;

import javax.servlet.http.HttpServletRequest;

import com.acorn.fin.cafe.dto.CafeDto;

public interface CafeService {
	public void getList(HttpServletRequest request);
	public void insert(CafeDto dto);
}






