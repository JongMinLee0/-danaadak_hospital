package com.dana.hos.hopital.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dana.hos.hopital.module.EventDTO;
import com.dana.hos.hopital.module.HospitalDTO;
import com.dana.hos.hopital.repo.HospitalDAO;
import com.dana.hos.hopital.service.HospitalService;
import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.reserve.module.ReserveDTO;

@Service
public class HospitalServiceImp implements HospitalService {

	@Autowired
	private HospitalDAO hospitalDAO;


	public HospitalServiceImp() {
		
	}
	public void setHospitalDAO(HospitalDAO hospitalDAO) {
		this.hospitalDAO = hospitalDAO;
	}

	@Override
	public List<ReserveDTO> bookListProcess(MemberDTO dto) {
		ReserveDTO rdto = new ReserveDTO ();
		rdto.setHos_id(dto.getHos_id());
		return hospitalDAO.bookListMethod(dto);
	}

	@Override
	public List<ReserveDTO> contentProcess(int rno) {
		return hospitalDAO.contentMethod(rno);
	}
	@Override
	public void updateProcess(ReserveDTO dto) {
		 hospitalDAO.updateMethod(dto);
	}

	@Override
	public void eventInsertProcess(EventDTO dto) {
		hospitalDAO.eventInsertMethod(dto);
	}
	@Override
	public List<EventDTO> eventListProcess(EventDTO dto) {
		return hospitalDAO.eventListMethod(dto);
	}
	@Override
	public String nameselctProcess(String hos_id) {
		return hospitalDAO.nameselctMethod(hos_id);
	}
}//end class 
