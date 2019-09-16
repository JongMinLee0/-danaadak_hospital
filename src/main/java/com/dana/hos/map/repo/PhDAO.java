package com.dana.hos.map.repo;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dana.hos.map.module.PhDTO;

@Repository
public interface PhDAO {
	public List<PhDTO> ph_list(HashMap<String, Object> map);
	
	public int ph_countAll(String data);
}
