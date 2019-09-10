package com.dana.hos.reserve.service;

import java.util.List;

import com.dana.hos.reserve.module.ReserveDTO;


public interface ReserveService {

	public List<ReserveDTO> reserveListProcess();
	public void re_registerProcess(ReserveDTO dto);
	public int timeChkProcess(ReserveDTO dto);
}///end interface

