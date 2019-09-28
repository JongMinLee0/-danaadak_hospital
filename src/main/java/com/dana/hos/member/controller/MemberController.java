package com.dana.hos.member.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
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
	private MemberService memberService;

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

	@RequestMapping(value = "/login/accessDenied", method = RequestMethod.GET)
	public String accessDenied() {
		return "member/login/accessDenied";
	}

	@RequestMapping(value = "/login/typeChk", method = RequestMethod.POST)
	public @ResponseBody String typeChk(String username) {
		MemberDTO dto = memberService.userInfoProcess(username);
		return dto.getType();
	}

	@RequestMapping("/kakaoLogin")
	public String test(HttpServletRequest request, MemberDTO dto, Principal principal){
		System.out.println("되는거니..?");
		
		dto = memberService.kakaoLoginProcess(dto.getKakao_id()); // pk로 사용자 정보 뽑아옴 각자 맞는 쿼리 사용
	
		Authentication authentication = new UsernamePasswordAuthenticationToken(dto.getUsername(), dto.getPassword(), AuthorityUtils.createAuthorityList(dto.getAuthority()));
		SecurityContext securityContext = SecurityContextHolder.getContext();
		securityContext.setAuthentication(authentication);
	
		MemberDTO mdto = memberService.userInfoProcess(dto.getUsername());

		HttpSession session = request.getSession(true);
		session.setAttribute("SPRING_SECURITY_CONTEXT",securityContext);   // 세션에 spring security context 넣음
	
		session.setMaxInactiveInterval(30 * 60);
		session.setAttribute("memberInfo", mdto);
		
		return "redirect:/home";
	}

	@RequestMapping(value = "/kakao_login")
	public @ResponseBody int kakao_login(MemberDTO dto) {
		return memberService.kakaoChkProcess(dto.getKakao_id());
	}

	@RequestMapping(value = "/member/findIdPwForm", method = RequestMethod.GET)
	public String findIdPwForm() {
		return "member/login/findIdPw";
	}

	@RequestMapping(value = "/member/findIdPwForm", method = RequestMethod.POST)
	public String findIdPw(String result, ModelAndView mav) {
		mav.addObject("result", result);
		System.out.println(result);
		return "member/login/findIdPw";
	}

	@RequestMapping(value = "/member/findIdPw", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String findIdPw(String type, MemberDTO dto, ModelAndView mav) {
		String result = "";
		if (type.equals("findId")) {
			try {
				String username = memberService.findIdProcess(dto).getUsername();
				System.out.println(username);
				result = "고객님의 아이디는 '" + username + "'입니다.";
			} catch (NullPointerException e) {
				result = "해당하는 정보가 없습니다.";
			}
		} else {
			if (memberService.findPwProcess(dto) != 1) {
				result = "해당하는 정보가 없습니다.";
			} else {
				result = "비밀번호 수정";
			}
		}

		return result;
	}

	@RequestMapping(value = "/member/passwordChange", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String changePw(MemberDTO dto) {
		dto.setPassword(this.bCryptPasswordEncoder.encode(dto.getPassword())); // 암호화 하여 테이블에 저장
		memberService.changePw(dto);
		return "비밀번호 변경에 성공하셨습니다.";
	}

	@RequestMapping(value = "/join/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "member/join/joinForm";
	}

	@RequestMapping(value = "/join/join", method = RequestMethod.POST) // 일반 사용자 회원가입
	public ModelAndView join(MemberDTO dto, ModelAndView mav, HttpServletRequest request) throws IOException {
		// dto.setAddress(dto.getAddress().replaceAll(",", " "));
		dto.setPassword(this.bCryptPasswordEncoder.encode(dto.getPassword())); // 암호화 하여 테이블에 저장
		if (dto.getBirth() != null) {
			dto.setBirth(dto.getBirth().replaceAll(",", ""));
		}

		if (dto.getProfile_image() == null) {
			dto.setProfile_image("/hos/resources/images/defaultIcon.png");
		}

		memberService.joinProcess(dto);

		mav.addObject("successMsg", "회원가입에 성공하셨습니다.");
		mav.setViewName("redirect:/login?type=user");

		return mav;
	}

	@RequestMapping(value = "/join/hosjoin", method = RequestMethod.POST) // 병원 회원가입
	public ModelAndView hosjoin(MemberDTO dto, ModelAndView mav, HttpServletRequest request) {
		dto.setPassword(this.bCryptPasswordEncoder.encode(dto.getPassword())); // 암호화 하여 테이블에 저장
		memberService.hosjoinProcess(dto);

		mav.addObject("successMsg", "회원가입에 성공하셨습니다.");
		mav.setViewName("redirect:/login?type=hospital");

		return mav;
	}

	@RequestMapping(value = "/join/phone", method = RequestMethod.GET)
	public String phone(Model model) {
		return "member/join/phone";
	}

	@RequestMapping(value = "/join/findHos", method = RequestMethod.POST)
	public @ResponseBody List<HosDTO> replyListPage(String keyword) {
		return memberService.findHospitalProcess(keyword);
	}

	@RequestMapping(value = "/join/usernameChk", method = RequestMethod.POST)
	public @ResponseBody int usernameChk(MemberDTO dto) {
		return memberService.usernameChkProcess(dto.getUsername());
	}

	@RequestMapping(value = "/join/hospitalChk", method = RequestMethod.POST)
	public @ResponseBody int hospitalChk(MemberDTO dto) {
		return memberService.hospitalChkProcess(dto.getHos_id());
	}

}
