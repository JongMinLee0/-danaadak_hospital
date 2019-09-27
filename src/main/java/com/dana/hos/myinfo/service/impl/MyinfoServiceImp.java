package com.dana.hos.myinfo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dana.hos.comm.module.ReviewDTO;
import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.myinfo.repo.MyinfoDAO;
import com.dana.hos.myinfo.service.MyinfoService;
import com.dana.hos.reserve.module.ReserveDTO;

@Service
public class MyinfoServiceImp implements MyinfoService{

	@Autowired
	private MyinfoDAO dao;
	
	
	public MyinfoServiceImp() {
	
	}

	public void setDao(MyinfoDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public MemberDTO myinfoUpdateSelectProcess(String username) {
		return dao.updateUsername(username);
	}
	
	//내 정보 수정
	@Override
	public void myinfoUpdateProcess(MemberDTO dto) {
		dao.updateMyinfoMethod(dto);
	}
	//내 정보 프로필 사진
	@Override
	public String fileSelectprocess(String username) {
		return dao.getFile(username);
	}
	
	//내 예약 목록
	@Override
	public List<ReserveDTO> myresListProcess(String username) {
		return dao.myresList(username);
	}
	
	//내 예약 취소
	@Override
	public void myresCancelProcess(ReserveDTO rdto) {
		dao.cancelMyresMethod(rdto);
		
	}
	
	//내 리뷰 목록
	@Override
	public List<ReviewDTO> myReviewListProcess(String username) {
		return dao.myreviewList(username);
	}
	
	//내 예약 후기버튼 확인
	@Override
	public List<Integer> myReviewBtnCheck(String username) {
		List<Integer> aList = new ArrayList<Integer>();
		List<ReviewDTO> reviewDTO = dao.myresRevBtn(username);
		
		for(ReviewDTO dto : reviewDTO) {
			aList.add(dto.getRno());
		}
		
		return aList;
	}
}//end MyinfoServiceImp
