package com.dana.hos.comm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dana.hos.comm.module.ReviewDTO;
import com.dana.hos.comm.repo.CommDAO;
import com.dana.hos.comm.service.CommService;

@Service
public class CommServiceImpl implements CommService{
	
	@Autowired
	CommDAO commDAO;

	// 후기 글 작성
	@Override
	public String writeService(ReviewDTO dto) {
		int ins = commDAO.reviewWrite(dto);
		String result = "";
		if(ins > 0) {
			result="후기 작성에 성공했습니다!!";
		}else {
			result="후기 작성에 실패했습니다..";
		}
		return result;
	}

	// 후기 전체 목록
	@Override
	public List<ReviewDTO> totalList() {
		List<ReviewDTO> rList = commDAO.totalList();
		return rList;
	}

}
