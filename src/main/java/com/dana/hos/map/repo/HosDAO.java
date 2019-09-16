package com.dana.hos.map.repo;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dana.hos.map.module.HosDTO;

@Repository
public interface HosDAO {
	public List<HosDTO> hos_list(HashMap<String, Object> map);
	
	public int hos_countAll(String data);
}
