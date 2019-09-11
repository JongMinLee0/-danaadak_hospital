package com.dana.hos.comm.service;

import com.dana.hos.comm.module.ReviewDTO;

public interface CommService {
	
	// 후기 글 작성
	public String writeService(ReviewDTO dto);
}
