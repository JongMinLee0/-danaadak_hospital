package com.dana.hos.reserve.repo;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dana.hos.reserve.module.ReserveDTO;

@Repository
public interface ReserveDAO {
	public List<ReserveDTO> reserveListMethod();
	public void re_registerMedthod(ReserveDTO dto);
	public int timeChkMethod(ReserveDTO dto);
}///end interface
