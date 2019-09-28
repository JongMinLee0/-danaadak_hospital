package com.dana.hos.myinfo.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.member.service.MemberService;
import com.dana.hos.myinfo.service.MyinfoService;
import com.dana.hos.reserve.module.ReserveDTO;

@Controller
public class MyInfoController {

	@Autowired
	private MyinfoService myinfoService;
	
	@Autowired 
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	private ReserveDTO rdto;

	// 마이페이지 메인
	@RequestMapping("/myinfo/myinfomain")
	public ModelAndView process(ModelAndView mav, Principal principal) {
		mav.addObject("myres", myinfoService.myresListProcess(principal.getName()));
		// System.out.println(myinfoService.myresListProcess(principal.getName()).get(0).getHos_name());
		mav.setViewName("/myinfo/myinfomain");
		return mav;
	}

	// 내 정보 페이지
	@RequestMapping(value = "/myinfo/memInfo", method = RequestMethod.GET)
	public String memInfo() {
		return "/myinfo/memInfo";
	}

	// 내 예약 조회
	@RequestMapping("/myinfo/myResInfo")
	public ModelAndView myResInfo(ModelAndView mav, Principal principal) {
		mav.addObject("myres", myinfoService.myresListProcess(principal.getName()));
		mav.addObject("myRevBtn", myinfoService.myReviewBtnCheck(principal.getName()));
		mav.setViewName("/myinfo/myResInfo");
		return mav;
	}

	// 내 처방전 목록
	@RequestMapping("/myinfo/myPharmInfo")
	public ModelAndView myPharmInfo(ModelAndView mav, Principal principal) {
		mav.addObject("myres", myinfoService.myresListProcess(principal.getName()));
		mav.setViewName("/myinfo/myPharmInfo");
		return mav;
	}

	// //내 처방전 상세 - 안씀!!!!! 처방전 목록에 통합함
	// @RequestMapping("/myinfo/myPharmDetail")
	// public String myPharmDetail() {
	// return "/myinfo/myPharmDetail";
	// }

	// 내 리뷰
	@RequestMapping("/myinfo/myReview")
	public ModelAndView myReview(ModelAndView mav, Principal principal) {
		mav.addObject("myReview", myinfoService.myReviewListProcess(principal.getName()));
		mav.setViewName("/myinfo/myReview");
		return mav;
	}

	// 마이페이지 수정
	@RequestMapping(value = "/myinfo/myinfoupdate", method = RequestMethod.POST)
	public String updateProc(MemberDTO dto, HttpServletRequest request, Principal principal) {
		// System.out.println(dto.getUsername());
		dto.setBirth(dto.getBirth().replaceAll(",", ""));
		
		if(!(dto.getPassword() == null || dto.getPassword().equals("null") || dto.getPassword().equals(""))) {
			dto.setPassword(this.bCryptPasswordEncoder.encode(dto.getPassword())); // 암호화 하여 테이블에 저장
			myinfoService.myinfoPwUpdateProcess(dto);	// 비밀번호 수정
		}
		
		myinfoService.myinfoUpdateProcess(dto);
		HttpSession session = request.getSession();
		session.setAttribute("memberInfo", memberService.userInfoProcess(dto.getUsername()));
		return "redirect:/myinfo/myinfomain";
	}
	
	// 비밀번호 수정
	@RequestMapping(value = "/myinfo/updatePassword", method = RequestMethod.POST)
	public @ResponseBody int updatePassword(String now_pw, String new_pw, Principal principal, MemberDTO dto) {
		String password = memberService.userInfoProcess(principal.getName()).getPassword();
		
		System.out.println(now_pw);
		System.out.println(new_pw);
		
		System.out.println("DB에 저장된 비밀번호 "+password);
		System.out.println("새로운 비밀번호" + new_pw);
		
		int pwChk;
		
		
		if (bCryptPasswordEncoder.matches(now_pw, password)) {
			System.out.println("비밀번호 일치");
			pwChk = 1;
		} else {
			System.out.println("비밀번호 불일치");
			pwChk = 0;
		}
		
		return pwChk;
	}

	// 내 예약 취소(update)
	@RequestMapping(value = "/myinfo/myresCancel", method = RequestMethod.POST)
	public String myresCancel(ReserveDTO rdto) {
		System.out.println("AAAAA");
		myinfoService.myresCancelProcess(rdto);

		return "/myinfo/myResInfo";
	}

}// end class
