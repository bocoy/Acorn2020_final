package com.acorn.fin.ceo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.fin.ceo.dao.CeoDao;

@Service
public class CeoServiceImpl implements CeoService{
	@Autowired
	private CeoDao ceoDao;

	@Override
	public void getCode(ModelAndView mView) {
		int code = ceoDao.getCode();
		System.out.println(code);
		mView.addObject("code",code);
	}
	
	
}
