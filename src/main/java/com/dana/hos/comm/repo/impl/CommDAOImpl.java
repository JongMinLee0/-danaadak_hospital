package com.dana.hos.comm.repo.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dana.hos.comm.module.CommentDTO;
import com.dana.hos.comm.module.PageDTO;
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

	// 전체 후기 리스트
	@Override
	public List<ReviewDTO> totalList(PageDTO pdto) {
		return sqlSession.selectList("comm.comList", pdto);
	}

	// 전체 해시 리스트
	@Override
	public List<ReviewDTO> hashList() {
		return sqlSession.selectList("comm.hash_list");
	}

	// 특정 번호 후기 상세
	@Override
	public ReviewDTO reviewDetail(int vino) {
		return sqlSession.selectOne("reviewDetail", vino);
	}

	// 후기 댓글 작성
	@Override
	public int writeCom(CommentDTO dto) {
		return sqlSession.insert("write_com", dto);
	}

	// 댓글 가지고 오기
	@Override
	public List<CommentDTO> comList(int vino) {
		return sqlSession.selectList("com_list", vino);
	}

	// 후기 글 삭제하기
	@Override
	public int deleteReview(int vino) {
		return sqlSession.delete("review_delete", vino);
	}

	// 후기 수정하기
	@Override
	public int updateReview(ReviewDTO rdto) {
		int cnt = sqlSession.update("review_update", rdto);
		System.out.println("cnt : " + cnt);
		return sqlSession.update("review_update", rdto);
	}

}
