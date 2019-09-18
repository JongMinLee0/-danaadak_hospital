package com.dana.hos.notice.serivce;

import java.util.List;

import com.dana.hos.notice.module.NoticeDTO;
import com.dana.hos.notice.module.PageDTO;

public interface NoticeService {
	public int countProcess();
	public List<NoticeDTO> listProcess(PageDTO pg);
	public void insertProcess(NoticeDTO dto);
	public NoticeDTO contentProcess(int num);
	public NoticeDTO updateSelectProcess(int num);
	public void updateProcess(NoticeDTO dto);
	public void deleteProcess(int num);
	
	public String fileSelectProcess(int num);
	
	public int rownumfindProcess(int num);
	List<NoticeDTO> prenextProcess(NoticeDTO dto);
	
}//end interface
