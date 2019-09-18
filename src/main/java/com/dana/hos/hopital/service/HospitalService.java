package com.dana.hos.hopital.service;

import java.util.List;

import com.dana.hos.hopital.module.HospitalDTO;
import com.dana.hos.reserve.module.ReserveDTO;

public interface HospitalService {
	
	public List<ReserveDTO> bookListProcess(ReserveDTO dto);
	public List<ReserveDTO> contentProcess(String username);
	public void updateProcess(ReserveDTO dto);

}
