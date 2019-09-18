package com.dana.hos.hopital.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dana.hos.hopital.repo.HospitalDAO;
import com.dana.hos.hopital.service.HospitalService;
import com.dana.hos.reserve.module.ReserveDTO;

@Service
public class HospitalServiceImp implements HospitalService {

	@Autowired
	private HospitalDAO hospitalDAO;

	public void setHospitalDAO(HospitalDAO hospitalDAO) {
		this.hospitalDAO = hospitalDAO;
	}

	public HospitalServiceImp() {
	}

	@Override
	public List<ReserveDTO> bookListProcess(ReserveDTO dto) {
		return hospitalDAO.bookListMethod(dto);
	}

	@Override
	public List<ReserveDTO> contentProcess(String username) {
		return hospitalDAO.contentMethod(username);
	}
	@Override
	public void updateProcess(ReserveDTO dto) {
		 hospitalDAO.updateMethod(dto);
	}
}//end class 
