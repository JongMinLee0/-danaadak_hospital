package com.dana.hos.comm.service;

import java.util.List;

import com.dana.hos.comm.module.CommentDTO;
import com.dana.hos.comm.module.PageDTO;
import com.dana.hos.comm.module.ReviewDTO;

public interface CommService {
	
	// 후기 글 작성
	public String writeService(ReviewDTO dto);
	
	// 후기 전체 목록
	public List<ReviewDTO> totalList();
	
	// 전체 해시 리스트
	public List<String> hashList();
	
	// 스크롤 이벤트
	public List<ReviewDTO> scrollList(PageDTO pdto);
	
	// 특정번호 후기 상세
	public ReviewDTO reviewDetail(int vino);
	
	// 후기 댓글 작성
	public String writeCom(CommentDTO dto);
	
	// 댓글 리스트
	public List<CommentDTO> commList(int vino);
}
