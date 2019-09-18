package com.dana.hos.myinfo.repo;

import com.dana.hos.member.module.MemberDTO;

public interface MyinfoDAO {
	public void updateMyinfoMethod(MemberDTO dto);
	public MemberDTO updateUsername(String username);
}//end interface
