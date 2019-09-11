package com.dana.hos.comm.repo;

import java.util.List;

import com.dana.hos.comm.module.ReviewDTO;

public interface CommDAO {
	// 후기 작성
	public int reviewWrite(ReviewDTO dto);
	
	// 전체 후기 리스트
	public List<ReviewDTO> totalList();
}
