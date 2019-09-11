package com.dana.hos.comm.repo.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dana.hos.comm.module.ReviewDTO;
import com.dana.hos.comm.repo.CommDAO;

@Repository
public class CommDAOImpl implements CommDAO{
	
	@Autowired
	SqlSession sqlSession;

	// 후기 글쓰기
	@Override
	public int reviewWrite(ReviewDTO dto) {
		return sqlSession.insert("comm.write", dto);
	}

}
