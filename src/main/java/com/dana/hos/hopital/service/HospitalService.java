package com.dana.hos.hopital.service;

import java.util.List;

import com.dana.hos.hopital.module.EventDTO;
import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.reserve.module.ReserveDTO;

public interface HospitalService {
	
	public List<ReserveDTO> bookListProcess(MemberDTO dto);
	public List<ReserveDTO> contentProcess(MemberDTO dto);
	public void updateProcess(ReserveDTO dto);
	public void recInsertProcess(ReserveDTO dto);
	public void eventInsertProcess(EventDTO dto);
}
