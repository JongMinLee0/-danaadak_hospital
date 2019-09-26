package com.dana.hos.admin.repo.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dana.hos.admin.repo.AdminDAO;
import com.dana.hos.member.module.MemberDTO;

@Repository
public class AdminDaoImp implements AdminDAO {

	@Autowired // 빈 주입 !(의존성 주입)
	private SqlSession sqlSession;


	public AdminDaoImp() {}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//관리자 리스트 확인
	@Override
	public List<MemberDTO> Join_Hos_list() {
		return sqlSession.selectList("admin.joinList");
	}
	
	
	//관리자 가입 승인
	@Override
	public void Join_HosMethod(MemberDTO dto) {
		sqlSession.update("admin.hos_join", dto);
	}

}
