package com.dana.hos.map.service.impl;

import java.util.HashMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dana.hos.map.module.PhDTO;
import com.dana.hos.map.repo.PhDAO;
import com.dana.hos.map.service.PhService;

@Service
public class PhServiceImp implements PhService{
	
	@Autowired
	private PhDAO dao;
	
	public PhServiceImp() {
	}
	
	public void setDao(PhDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public int phf_countAllProcess(String data) {
		return dao.ph_countAll(data);
	}
	@Override
	public List<PhDTO> phf_listProcess(int pageNo, int pageSize, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startpage",((pageNo - 1) * pageSize) + 1);
		map.put("endpage",pageNo* pageSize);
		map.put("keyword",keyword);
		return dao.ph_list(map);
	}
}
