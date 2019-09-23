package com.dana.hos.myinfo.repo;

import java.util.List;

import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.reserve.module.ReserveDTO;

public interface MyinfoDAO {
	
	//내정보 수정
	public void updateMyinfoMethod(MemberDTO dto);
	public MemberDTO updateUsername(String username);
	
	//예약 내역 출력
	public List<ReserveDTO> myresList(String username);
	
	//내 예약 취소
	public void cancelMyresMethod(ReserveDTO rdto);
}//end interface
