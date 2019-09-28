package com.dana.hos.myinfo.repo.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dana.hos.comm.module.ReviewDTO;
import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.myinfo.repo.MyinfoDAO;
import com.dana.hos.reserve.module.ReserveDTO;

@Repository
public class MyinfoDaoImp implements MyinfoDAO {

	@Autowired
	private SqlSession sqlSession;

	public MyinfoDaoImp() {

	}

	// 내정보 수정
	@Override
	public void updateMyinfoMethod(MemberDTO dto) {
		sqlSession.update("myinfo.myinfoUpdate", dto);
	}

	// 내정보 확인
	@Override
	public MemberDTO updateUsername(String username) {
		return sqlSession.selectOne("myinfo.selectUserById", username);
	}

	//내정보 프로필 사진
	@Override
	public String getFile(String username) {
		return sqlSession.selectOne("myinfo.uploadProfile_image", username);
	}
	
	//내 예약 정보 확인
	@Override
	public List<ReserveDTO> myresList(String username) {
		return sqlSession.selectList("myinfo.myresList", username);
	}

	// 내 예약 취소
	@Override
	public int cancelMyresMethod(int rno) {
		return sqlSession.update("myinfo.myresCancel", rno);
	}

	// 내 후기글 보기
	@Override
	public List<ReviewDTO> myreviewList(String username) {
		return sqlSession.selectList("myinfo.myReviewList", username);
	}

	// 진료완료 건 후기 작성 버튼 확인
	@Override
	public List<ReviewDTO> myresRevBtn(String username) {
		return sqlSession.selectList("myinfo.reviewBtnCheck", username);
	}

	@Override
	public void updatePasswordMethod(MemberDTO dto) {
		sqlSession.update("myinfo.passwordUpdate", dto);
	}
}// end MyinfoDaoImp
