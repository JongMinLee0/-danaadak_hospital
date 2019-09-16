package com.dana.hos.member.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.member.repo.MemberDAO;
import com.dana.hos.member.service.MemberService;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	public MemberServiceImp() {
		
	}
	
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	@Override
	public void joinProcess(MemberDTO dto) {
		memberDAO.joinMedthod(dto);
	}

}