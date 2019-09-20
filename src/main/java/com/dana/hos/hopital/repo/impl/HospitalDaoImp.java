package com.dana.hos.hopital.repo.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dana.hos.hopital.repo.HospitalDAO;
import com.dana.hos.reserve.module.ReserveDTO;

@Repository
public class HospitalDaoImp implements HospitalDAO{
	@Autowired
	 private SqlSession sqlSession;
	 
	public HospitalDaoImp() {
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ReserveDTO> bookListMethod(ReserveDTO dto) {
		return sqlSession.selectList("hos.sel",dto);
	}
	@Override
	public List<ReserveDTO> contentMethod(String username) {
		return sqlSession.selectList("hos.view",username);
	}


	@Override
	public void updateMethod(ReserveDTO dto) {
		sqlSession.selectList("hos.upt",dto);
	}

	@Override
	public void recInsertMethod(ReserveDTO dto) {
		sqlSession.selectList("hos.ins",dto);
	}
	
	
}
