package com.dana.hos.notice.repo;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dana.hos.notice.module.NoticeDTO;
import com.dana.hos.notice.module.PageDTO;

@Repository
public interface NoticeDAO {
	
	public int count();
	public List<NoticeDTO> list(PageDTO pg);
	public void readCount(int num);
	public void save(NoticeDTO dto);
	public NoticeDTO updateNum(int num);
	public void update(NoticeDTO dto);
	public void delete(int num);
	public String getFile(int num);
	public NoticeDTO content(int num);
	public List<NoticeDTO> getPreNext(NoticeDTO dto);
	public int getRownum(int num);
}//end interface
