package com.dana.hos.myinfo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.myinfo.repo.MyinfoDAO;
import com.dana.hos.myinfo.service.MyinfoService;
import com.dana.hos.reserve.module.ReserveDTO;

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
	
	//내 정보 수정
	@Override
	public void myinfoUpdateProcess(MemberDTO dto) {
		dao.updateMyinfoMethod(dto);
	}
	
	//내 예약 목록
	@Override
	public List<ReserveDTO> myresListProcess(String username) {
		return dao.myresList(username);
	}
}//end MyinfoServiceImp
