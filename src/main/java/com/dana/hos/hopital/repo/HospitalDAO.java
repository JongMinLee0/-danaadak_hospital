package com.dana.hos.hopital.repo;

import java.util.List;

import com.dana.hos.hopital.module.HospitalDTO;
import com.dana.hos.reserve.module.ReserveDTO;

public interface HospitalDAO {

	public List<ReserveDTO> bookListMethod(ReserveDTO dto);
	public List<ReserveDTO> contentMethod(String username);
	public void updateMethod(ReserveDTO dto);

}//end 
