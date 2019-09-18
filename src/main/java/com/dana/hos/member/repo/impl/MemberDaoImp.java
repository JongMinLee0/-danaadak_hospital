package com.dana.hos.member.repo.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.member.repo.MemberDAO;

@Repository
public class MemberDaoImp implements MemberDAO {

	@Autowired //빈 주입 !(의존성 주입)
	private SqlSession sqlSession;

	public MemberDaoImp() {
		
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void joinMedthod(MemberDTO dto) {
		sqlSession.insert("member.userjoin", dto);
	}

	@Override
	public MemberDTO getUserInfo(String username) {
		return sqlSession.selectOne("member.selectUserById", username);
	}

	@Override
	public int kakaoChkMethod(String kakao_id) {
		return sqlSession.selectOne("member.kakaoChk", kakao_id);
	}
	
}
