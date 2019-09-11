package com.dana.hos.notice.serivce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dana.hos.notice.module.NoticeDTO;
import com.dana.hos.notice.module.PageDTO;
import com.dana.hos.notice.repo.NoticeDAO;

@Service
public class NoticeServiceImp implements NoticeService{
	@Autowired
	private NoticeDAO dao;
	
	
	public NoticeServiceImp() {

	}
	public void setDao(NoticeDAO dao) {
		this.dao = dao;
	}
	@Override
	public int countProcess() {
		return dao.count();
	}
	@Override
	public List<NoticeDTO> listProcess(PageDTO pg) {
		return dao.list(pg);
	}
	@Override
	public void insertProcess(NoticeDTO dto) {
		dao.save(dto);
	}
	@Override
	public NoticeDTO contentProcess(int num) {
		dao.readCount(num);
		return dao.content(num);
	}
	
	@Override
	public NoticeDTO updateSelectProcess(int num) {
		return dao.updateNum(num);
	}
	@Override
	public void updateProcess(NoticeDTO dto) {
		dao.update(dto);
	}
	@Override
	public void deleteProcess(int num) {
		dao.delete(num);
	}
	@Override
	public String fileSelectProcess(int num) {
		return dao.getFile(num);
	}
}
