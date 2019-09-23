package com.dana.hos.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dana.hos.map.module.HosDTO;
import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberservice;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping(value = "/login")
	public ModelAndView loginForm(HttpServletRequest request, String successMsg, ModelAndView mav) {
		String referer = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", referer);
		
		mav.addObject("successMsg", successMsg);
		mav.setViewName("member/login/loginForm");

		return mav;
	}
	
	@RequestMapping(value = "/kakao_login")
	public @ResponseBody int kakao_login(MemberDTO dto) {
		return memberservice.kakaoChkProcess(dto.getKakao_id());
	}
	
	@RequestMapping(value = "/kakao_login_action")
	public @ResponseBody MemberDTO kakao_login_action(MemberDTO dto) {
		return memberservice.kakaoLoginProcess(dto.getKakao_id());
	}

	@RequestMapping(value = "/login/accessDenied", method = RequestMethod.GET)
	public String accessDenied() {
		return "member/login/accessDenied";
	}

	@RequestMapping(value = "/join/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "member/join/joinForm";
	}

	@RequestMapping(value = "/join/join", method = RequestMethod.POST)		// 일반 사용자 회원가입
	public ModelAndView join(MemberDTO dto, ModelAndView mav, HttpServletRequest request) throws IOException {
	//	dto.setAddress(dto.getAddress().replaceAll(",", " "));
		dto.setPassword(this.bCryptPasswordEncoder.encode(dto.getPassword())); // 암호화 하여 테이블에 저장
		if(dto.getBirth()!=null) {
			dto.setBirth(dto.getBirth().replaceAll(",", ""));
		}
		memberservice.joinProcess(dto);
		
		mav.addObject("successMsg", "회원가입에 성공하셨습니다.");
		mav.setViewName("redirect:/login?type=user");
		
		return mav;
	}
	
	@RequestMapping(value = "/join/hosjoin", method = RequestMethod.POST)	// 병원 회원가입
	public ModelAndView hosjoin(MemberDTO dto, ModelAndView mav, HttpServletRequest request) {
		dto.setPassword(this.bCryptPasswordEncoder.encode(dto.getPassword())); // 암호화 하여 테이블에 저장
		memberservice.hosjoinProcess(dto);
		
		mav.addObject("successMsg", "회원가입에 성공하셨습니다.");
		mav.setViewName("redirect:/login?type=hospital");
		
		return mav;
	}

	@RequestMapping(value = "/join/phone", method = RequestMethod.GET)
	public String phone(Model model) {
		return "member/join/phone";
	}
	
	@RequestMapping(value = "/join/findHos", method = RequestMethod.POST)
	public @ResponseBody List<HosDTO> replyListPage(String keyword){
		return memberservice.findHospitalProcess(keyword);
	}
	
	@RequestMapping(value = "/join/usernameChk", method = RequestMethod.POST)
	public @ResponseBody int usernameChk(MemberDTO dto) {
		return memberservice.usernameChkProcess(dto.getUsername());
	}


}
