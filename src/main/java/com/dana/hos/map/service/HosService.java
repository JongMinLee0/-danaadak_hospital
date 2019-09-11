package com.dana.hos.map.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dana.hos.map.module.HosDTO;

@Service
public interface HosService {
	public List<HosDTO> f_listProcess(
			int pageNo, int pageSize,
			String keyword);
	
	public int f_countAllProcess(String data);
}
