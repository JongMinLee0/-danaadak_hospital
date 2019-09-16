package com.dana.hos.comm.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dana.hos.comm.module.CommentDTO;
import com.dana.hos.comm.module.PageDTO;
import com.dana.hos.comm.module.ReviewDTO;
import com.dana.hos.comm.repo.CommDAO;
import com.dana.hos.comm.service.CommService;

@Service
public class CommServiceImpl implements CommService {

	private static final Logger logger = LoggerFactory.getLogger(CommServiceImpl.class);

	@Autowired
	CommDAO commDAO;

	// 후기 글 작성
	@Override
	public String writeService(ReviewDTO dto) {
		int ins = commDAO.reviewWrite(dto);
		String result = "";
		if (ins > 0) {
			result = "후기 작성에 성공했습니다!!";
		} else {
			result = "후기 작성에 실패했습니다..";
		}
		return result;
	}

	// 후기 전체 목록
	@Override
	public List<ReviewDTO> totalList() {
		PageDTO pdto = new PageDTO(1);
		List<ReviewDTO> rList = commDAO.totalList(pdto);
		return rList;
	}

	// 전체 해시 리스트
	@Override
	public List<String> hashList() {
		List<ReviewDTO> hList = commDAO.hashList();
		List<String> temp = new ArrayList<String>();

		// 해시 리스트를 분리하여 중복제거
		for (int i = 0; i < hList.size(); i++) {
			String[] strArray = hList.get(i).getVi_hash().split("#");
			for (int k = 0; k < strArray.length; k++) {

				// 존재하지 않으면
				if (temp.lastIndexOf(strArray[k]) == -1 && !strArray[k].equals("")) {
					temp.add(strArray[k]);
				}
			}
		}

		return temp;
	}

	// 무한 스크롤
	@Override
	public List<ReviewDTO> scrollList(PageDTO pdto) {
		List<ReviewDTO> pList = commDAO.totalList(pdto);
		return pList;
	}

	// 특정번호 후기 상세
	@Override
	public ReviewDTO reviewDetail(int vino) {
		ReviewDTO rdto = commDAO.reviewDetail(vino);
		return rdto;
	}

	// 후기 댓글작성
	@Override
	public String writeCom(CommentDTO dto) {
		int cnt = commDAO.writeCom(dto);
		String result = "";
		if(cnt > 0) {
			result = "댓글 작성에 성공했습니다!!";
		}else {
			result = "댓글 작성에 실패했습니다..";
		}
		return result;
	}

	// 후기 댓글 리스트 가지고 오기
	@Override
	public List<CommentDTO> commList(int vino) {
		return commDAO.comList(vino);
	}

	
	// 후기글 삭제하기
	@Override
	public void deleteReview(int vino) {
		commDAO.deleteReview(vino);
	}

	@Override
	public String updateReview(ReviewDTO rdto) {
		int cnt = commDAO.updateReview(rdto);
		String result = "";
		if(cnt > 0) {
			result = "후기 수정에 성공했습니다!!";
		}else {
			result = "후기 수정에 실패했습니다!!";
		}
		return result;
	}

}
