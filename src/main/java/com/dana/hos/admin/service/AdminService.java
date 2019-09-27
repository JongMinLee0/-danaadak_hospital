package com.dana.hos.admin.service;

import java.util.List;

import com.dana.hos.hopital.module.EventDTO;
import com.dana.hos.member.module.MemberDTO;

public interface AdminService {
	// 병원 정보 리스트 받기
	public List<MemberDTO> Hos_Join_Info();

	// 병원 가입 관리
	public void Hos_Join(MemberDTO dto);

	// 병원 이벤트 리스트
	public List<EventDTO> EventListProcess();

	// 병원 이벤트 타입 리스트
	public List<EventDTO> EventTypeProcess(EventDTO aedto);
}
