package com.dana.hos.myinfo.repo.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.myinfo.repo.MyinfoDAO;

@Repository
public class MyinfoDaoImp implements MyinfoDAO{
	
	@Autowired
	private SqlSession sqlSession;
	public MyinfoDaoImp() {
	
	}
	@Override
	public void updateMyinfoMethod(MemberDTO dto) {
		sqlSession.update("myinfo.myinfoUpdate", dto);
		
	}
	@Override
	public MemberDTO updateUsername(String username) {
		return sqlSession.selectOne("myinfo.selectUserById", username);
	}
}//end MyinfoDaoImp
