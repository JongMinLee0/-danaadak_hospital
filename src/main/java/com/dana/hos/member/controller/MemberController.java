package com.dana.hos.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dana.hos.map.module.HosDTO;
import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberservice;

/*	@RequestMapping(value = "/login/loginForm")
	public String loginForm(HttpServletRequest request, Model model) {
		String referer = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", referer);

		return "member/login/loginForm";
	}*/
	
	@RequestMapping(value = "/login")
	public String loginForm(HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		request.getSession().setAttribute("prevPage", referer);
		
		return "member/login/loginForm";
	}
	
	@RequestMapping(value = "/kakao_login")
	public @ResponseBody int kakao_login(MemberDTO dto) {
		return memberservice.kakaoChkProcess(dto.getKakao_id());
	}
	
	@RequestMapping(value = "/kakao_login_action")
	public @ResponseBody MemberDTO kakao_login_action(MemberDTO dto) {
		System.out.println(memberservice.kakaoLoginProcess(dto.getKakao_id()).getUsername());
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

	@RequestMapping(value = "/join/join", method = RequestMethod.POST)
	public String join(MemberDTO dto, ModelAndView mav) {
	//	dto.setAddress(dto.getAddress().replaceAll(",", " "));
		if(dto.getBirth()!=null) {
			dto.setBirth(dto.getBirth().replaceAll(",", ""));
		}
		memberservice.joinProcess(dto);
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/join/hosjoin", method = RequestMethod.POST)
	public String hosjoin(MemberDTO dto, ModelAndView mav) {
		memberservice.hosjoinProcess(dto);
		return "redirect:/login";
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
