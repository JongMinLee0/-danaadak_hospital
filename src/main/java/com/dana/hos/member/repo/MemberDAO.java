package com.dana.hos.member.repo;

import java.util.List;

import com.dana.hos.map.module.HosDTO;
import com.dana.hos.member.module.MemberDTO;

public interface MemberDAO {
	public void joinMedthod(MemberDTO dto);
	public void hosjoinMedthod(MemberDTO dto);
	public MemberDTO getUserInfo(String username);
	public int kakaoChkMethod(String kakao_id);
	public MemberDTO kakaoLoginMethod(String kakao_id);
	public List<HosDTO> findHospitalMethod(String keyword);
	public int userNameChkMethod(String username);
	public int hosIdChkMethod(String hos_id);
	public MemberDTO findIdMethod(MemberDTO dto);
	public int findPwMethod(MemberDTO dto);
	public void changePw(MemberDTO dto);
}
