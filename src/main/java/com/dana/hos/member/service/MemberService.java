package com.dana.hos.member.service;

import java.util.List;

import com.dana.hos.map.module.HosDTO;
import com.dana.hos.member.module.MemberDTO;

public interface MemberService {
	public MemberDTO userInfoProcess(String username);
	public void joinProcess(MemberDTO dto);
	public void hosjoinProcess(MemberDTO dto);
	public int kakaoChkProcess(String kakao_id);
	public MemberDTO kakaoLoginProcess(String kakao_id);
	public List<HosDTO> findHospitalProcess(String keyword);
	public int usernameChkProcess(String username);
}
