package com.dana.hos.reserve.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dana.hos.reserve.module.ReserveDTO;
import com.dana.hos.reserve.repo.ReserveDAO;
import com.dana.hos.reserve.service.ReserveService;

@Service
public class ReserveServiceImp implements ReserveService {

	@Autowired
	private ReserveDAO reserveDAO;
	
	public ReserveServiceImp() {
	}
	
	public void setDao(ReserveDAO reserveDAO) {
		this.reserveDAO = reserveDAO;
	}

	@Override
	public List<ReserveDTO> reserveListProcess() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void re_registerProcess(ReserveDTO dto) {
		reserveDAO.re_registerMedthod(dto);
	}
	
	

	
	
}//end classs
