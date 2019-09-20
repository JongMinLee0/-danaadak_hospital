package com.dana.hos.myinfo.service;

import java.util.List;

import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.reserve.module.ReserveDTO;

public interface MyinfoService {
	
	//내 정보 아이디값 받기
	public MemberDTO myinfoUpdateSelectProcess(String username);
	//내 정보 수정
	public void myinfoUpdateProcess(MemberDTO dto);
	
	//내 예약 목록
	public List<ReserveDTO> myresListProcess(String username);
}//end interface
