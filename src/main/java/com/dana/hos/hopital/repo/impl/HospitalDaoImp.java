package com.dana.hos.hopital.repo.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dana.hos.hopital.module.EventDTO;
import com.dana.hos.hopital.repo.HospitalDAO;
import com.dana.hos.member.module.MemberDTO;
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
	public List<ReserveDTO> bookListMethod(MemberDTO dto) {
		return sqlSession.selectList("hos.sel",dto);
		
	}
	@Override
	public List<ReserveDTO> contentMethod(MemberDTO dto) {
		return sqlSession.selectList("hos.view",dto);
	}


	@Override
	public void updateMethod(ReserveDTO dto) {
		System.out.println("daoImp");
		sqlSession.update("hos.upt",dto);
		System.out.println("daoImp 끝");
		
	}



	@Override
	public void eventInsertMethod(EventDTO dto) {
		sqlSession.insert("hos.event_ins",dto);
	}


	
	
}
