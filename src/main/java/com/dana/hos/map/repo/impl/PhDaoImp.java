package com.dana.hos.map.repo.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dana.hos.map.module.PhDTO;
import com.dana.hos.map.repo.PhDAO;

@Repository
public class PhDaoImp implements PhDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public PhDaoImp() {
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int ph_countAll(String data) {
		return sqlSession.selectOne("ph.ph_countAll",data);
	}
	@Override
	public List<PhDTO> ph_list(HashMap<String, Object> map) {
		return sqlSession.selectList("ph.ph_list",map);
	}
}
