package com.dana.hos.member.service;

import com.dana.hos.member.module.MemberDTO;

public interface MemberService {
	public MemberDTO userInfoProcess(String username);
	public void joinProcess(MemberDTO dto);
}
