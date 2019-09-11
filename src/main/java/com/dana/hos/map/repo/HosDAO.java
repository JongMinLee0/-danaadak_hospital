package com.dana.hos.map.repo;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dana.hos.map.module.HosDTO;

@Repository
public interface HosDAO {
	public List<HosDTO> lib_list(HashMap<String, Object> map);
	
	public int lib_countAll(String data);
}
