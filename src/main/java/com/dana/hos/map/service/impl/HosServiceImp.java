package com.dana.hos.map.service.impl;

import java.util.HashMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.dana.hos.map.module.HosDTO;
import com.dana.hos.map.repo.HosDAO;
import com.dana.hos.map.service.HosService;

@Service
public class HosServiceImp implements HosService{
	
	@Autowired
	private HosDAO dao;
	
	public HosServiceImp() {
	}
	
	public void setDao(HosDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public int hosf_countAllProcess(String data) {
		return dao.hos_countAll(data);
	}
	@Override
	public List<HosDTO> hosf_listProcess(int pageNo, int pageSize, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startpage",((pageNo - 1) * pageSize) + 1);
		map.put("endpage",pageNo* pageSize);
		map.put("keyword",keyword);
		return dao.hos_list(map);
	}
}
