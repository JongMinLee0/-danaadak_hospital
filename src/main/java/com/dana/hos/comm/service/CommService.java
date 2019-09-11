package com.dana.hos.comm.service;

import java.util.List;

import com.dana.hos.comm.module.ReviewDTO;

public interface CommService {
	
	// 후기 글 작성
	public String writeService(ReviewDTO dto);
	
	// 후기 전체 목록
	public List<ReviewDTO> totalList();
}
