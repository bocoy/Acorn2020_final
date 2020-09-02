package com.acorn.fin.cafe.dao;

import java.util.List;

public interface CafeDao {
	public List<CafeCommentDto> getList(CafeCommentDto dto);
}
