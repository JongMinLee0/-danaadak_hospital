package com.dana.hos.hopital.repo;

import java.util.List;

import com.dana.hos.hopital.module.EventDTO;
import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.reserve.module.ReserveDTO;

public interface HospitalDAO {

	public List<ReserveDTO> bookListMethod(MemberDTO dto);
	public List<ReserveDTO> contentMethod(MemberDTO dto);
	public void updateMethod(ReserveDTO dto);
	public void recInsertMethod(ReserveDTO dto);
	public void eventInsertMethod(EventDTO dto);
}//end 
