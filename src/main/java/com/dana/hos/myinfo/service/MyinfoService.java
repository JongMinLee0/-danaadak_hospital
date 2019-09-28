package com.dana.hos.myinfo.service;

import java.util.List;

import com.dana.hos.comm.module.ReviewDTO;
import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.reserve.module.ReserveDTO;

public interface MyinfoService {
	
	//내 정보 아이디값 받기
	public MemberDTO myinfoUpdateSelectProcess(String username);
	//내 정보 수정
	public void myinfoUpdateProcess(MemberDTO dto);
	
	//내 예약 목록
	public List<ReserveDTO> myresListProcess(String username);
	
	//내 예약 취소
	public void myresCancelProcess(ReserveDTO rdto);
	
	//내 후기 목록
	public List<ReviewDTO> myReviewListProcess(String username);
	
	//내 예약 후기버튼 확인
	public List<ReviewDTO> myReviewBtnCheck(String username);
	
	// 비밀번호 변경
	public void myinfoPwUpdateProcess(MemberDTO dto);
}//end interface
