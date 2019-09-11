package com.dana.hos.notice.repo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dana.hos.notice.module.NoticeDTO;
import com.dana.hos.notice.module.PageDTO;

@Repository
public class NoticeDaoImp implements NoticeDAO{

	@Autowired
	private SqlSession sqlSession;
	
	public NoticeDaoImp() {
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int count() {
		return sqlSession.selectOne("notice.count");
	}

	@Override
	public List<NoticeDTO> list(PageDTO pg) {
		return sqlSession.selectList("notice.list", pg);
	}

	public NoticeDTO content(int num) {
		return sqlSession.selectOne("notice.content", num);
		
	}
	
	@Override
	public void readCount(int num) {
		sqlSession.update("notice.readCount",num);
	}

	@Override
	public void save(NoticeDTO dto) {
		sqlSession.insert("notice.save",dto);
	}

	@Override
	public NoticeDTO updateNum(int num) {
		return sqlSession.selectOne("notice.content", num);
	}

	@Override
	public void update(NoticeDTO dto) {
		sqlSession.selectOne("notice.update", dto);
		
	}

	@Override
	public void delete(int num) {
		sqlSession.delete("notice.delete",num);
	}

	@Override
	public String getFile(int num) {
		return sqlSession.selectOne("notice.uploadFile",num);
	}
	
	
}//end class


