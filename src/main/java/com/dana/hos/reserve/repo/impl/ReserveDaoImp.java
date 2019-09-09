package com.dana.hos.reserve.repo.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dana.hos.reserve.module.ReserveDTO;
import com.dana.hos.reserve.repo.ReserveDAO;

@Repository
public class ReserveDaoImp implements ReserveDAO {

	@Autowired //빈 주입 !(의존성 주입)
	private SqlSession sqlSession;

	public ReserveDaoImp() {
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ReserveDTO> reserveListMethod() {
		return null;
	}

	@Override
	public void re_registerMedthod(ReserveDTO dto) {
		sqlSession.insert("re.ins",dto);
	}

	@Override
	public int timeChkMethod(ReserveDTO dto) {
		return sqlSession.selectOne("re.chk",dto);
	}

	
}// end class
