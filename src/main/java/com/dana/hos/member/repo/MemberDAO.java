package com.dana.hos.member.repo;

import com.dana.hos.member.module.MemberDTO;

public interface MemberDAO {
	public void joinMedthod(MemberDTO dto);
	public MemberDTO getUserInfo(String username);
	public int kakaoChkMethod(String kakao_id);
	public MemberDTO kakaoLoginMethod(String kakao_id);
}
