package com.dana.hos.myinfo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.myinfo.repo.MyinfoDAO;
import com.dana.hos.myinfo.service.MyinfoService;

@Service
public class MyinfoServiceImp implements MyinfoService{

	@Autowired
	private MyinfoDAO dao;
	
	public MyinfoServiceImp() {
	
	}

	public void setDao(MyinfoDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public MemberDTO myinfoUpdateSelectProcess(String username) {
		return dao.updateUsername(username);
	}
	
	@Override
	public void myinfoUpdateProcess(MemberDTO dto) {
		dao.updateMyinfoMethod(dto);
	}
	
}//end MyinfoServiceImp
