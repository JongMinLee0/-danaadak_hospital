package com.dana.hos.hopital.repo;

import java.util.List;

import com.dana.hos.hopital.module.EventDTO;
import com.dana.hos.hopital.module.HospitalDTO;
import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.reserve.module.ReserveDTO;

public interface HospitalDAO {

	public List<ReserveDTO> bookListMethod(MemberDTO dto);
	public List<ReserveDTO> contentMethod(int rno);
	public void updateMethod(ReserveDTO dto);
	public void eventInsertMethod(EventDTO dto);
	public List<EventDTO> eventListMethod(EventDTO dto);
	public String nameselctMethod(String hos_id);
	
}//end 
