package com.dana.hos.map.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dana.hos.map.module.PhDTO;

@Service
public interface PhService {
	public List<PhDTO> phf_listProcess(
			int pageNo, int pageSize,
			String keyword);
	
	public int phf_countAllProcess(String data);
}
