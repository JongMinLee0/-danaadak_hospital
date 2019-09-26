package com.dana.hos.member.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dana.hos.admin.service.AdminService;
import com.dana.hos.member.module.MemberDTO;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Autowired
	private AdminService adminService;
	public AdminController() {
	}
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	// 병원 관리자 메인 페이지
	@RequestMapping(value = "/admin/adminmain", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome Admin Home!");

		return "admin/adminmain";
	}
	
	// 관리자가 병원 회원 가입을 승인 할때 테이블 업데이트
	@RequestMapping(value="/admin/hos_join", method=RequestMethod.POST)
	public String hosmanagement(MemberDTO dto) {
//		System.out.println("조인 눌림?");
		adminService.Hos_Join(dto);
		
		return "admin/hos_join"; 
	}
	
	// 병원들이 회원 가입 요청을 했을 때 리스트 뿌리기
	@RequestMapping("/admin/hos_joinmanagement")
	public ModelAndView hos_joinList(ModelAndView mav) {
		mav.addObject("hsList", adminService.Hos_Join_Info());
		mav.setViewName("admin/hos_join");
		return mav;
	}

}
