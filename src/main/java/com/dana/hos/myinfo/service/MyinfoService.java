package com.dana.hos.myinfo.service;

import com.dana.hos.member.module.MemberDTO;

public interface MyinfoService {
	
	//내 정보 아이디값 받기
	public MemberDTO myinfoUpdateSelectProcess(String username);
	//내 정보 수정
	public void myinfoUpdateProcess(MemberDTO dto);
	
	
}//end interface
