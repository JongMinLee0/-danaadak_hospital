package com.dana.hos.comm.repo;

import com.dana.hos.comm.module.ReviewDTO;

public interface CommDAO {
	// 후기 작성
	public int reviewWrite(ReviewDTO dto);
}
