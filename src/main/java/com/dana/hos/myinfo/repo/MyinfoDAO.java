package com.dana.hos.myinfo.repo;

import java.util.List;

import com.dana.hos.comm.module.ReviewDTO;
import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.reserve.module.ReserveDTO;

public interface MyinfoDAO {
	
	//내정보 수정
	public void updateMyinfoMethod(MemberDTO dto);
	public MemberDTO updateUsername(String username);
	
	//내정보 프로필 사진
	public String getFile(String username);
	
	//예약 내역 출력
	public List<ReserveDTO> myresList(String username);
	
	//내 예약 취소
	public int cancelMyresMethod(int rno);
	
	//내 리뷰 목록 출력
	public List<ReviewDTO> myreviewList(String username);
	
	//진료완료 건 리뷰 작성 버튼 확인
	public List<ReviewDTO> myresRevBtn(String username);
}//end interface
