package com.dana.hos.admin.repo;

import java.util.List;

import com.dana.hos.member.module.MemberDTO;

public interface AdminDAO {
	//병원 정보 리스트 뿌리기
	public List<MemberDTO> Join_Hos_list();
	
	
	//병원 가입 관리
		public void Join_HosMethod(MemberDTO dto);
}
