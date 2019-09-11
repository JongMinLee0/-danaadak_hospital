package com.dana.hos.map.repo.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dana.hos.map.module.HosDTO;
import com.dana.hos.map.repo.HosDAO;

@Repository
public class HosDaoImp implements HosDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public HosDaoImp() {
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int lib_countAll(String data) {
		return sqlSession.selectOne("hos.hos_countAll",data);
	}
	@Override
	public List<HosDTO> lib_list(HashMap<String, Object> map) {
		return sqlSession.selectList("hos.hos_list",map);
	}
}
