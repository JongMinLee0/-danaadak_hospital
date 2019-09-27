package com.dana.hos.myinfo.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dana.hos.map.module.HosDTO;
import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.myinfo.service.MyinfoService;
import com.dana.hos.reserve.module.ReserveDTO;

@Controller
public class MyInfoController {

	@Autowired
	private MyinfoService myinfoService;
	
	private ReserveDTO rdto;
	
	//마이페이지 메인
	@RequestMapping("/myinfo/myinfomain")
	public ModelAndView process(ModelAndView mav, Principal principal) {
		mav.addObject("myres", myinfoService.myresListProcess(principal.getName()));
	//	System.out.println(myinfoService.myresListProcess(principal.getName()).get(0).getHos_name());
		mav.setViewName("/myinfo/myinfomain");
		return mav;
	}

	//내 정보 페이지
	@RequestMapping(value="/myinfo/memInfo", method=RequestMethod.GET)
	public String memInfo() {
		return "/myinfo/memInfo";
	}
	
	//내 예약 조회
	@RequestMapping("/myinfo/myResInfo")
	public ModelAndView myResInfo(ModelAndView mav, Principal principal) {
		mav.addObject("myres", myinfoService.myresListProcess(principal.getName()));
		mav.addObject("myRevBtn", myinfoService.myReviewBtnCheck(principal.getName()));
		mav.setViewName("/myinfo/myResInfo");
		return mav;
	}
	
	//내 처방전 목록
	@RequestMapping("/myinfo/myPharmInfo")
	public ModelAndView myPharmInfo(ModelAndView mav, Principal principal) {
		mav.addObject("myres", myinfoService.myresListProcess(principal.getName()));
		mav.setViewName("/myinfo/myPharmInfo");
		return mav;
	}

//	//내 처방전 상세 - 안씀!!!!! 처방전 목록에 통합함
//	@RequestMapping("/myinfo/myPharmDetail")
//	public String myPharmDetail() {
//		return "/myinfo/myPharmDetail";
//	}
	
	//내 리뷰
	@RequestMapping("/myinfo/myReview")
	public ModelAndView myReview(ModelAndView mav, Principal principal) {
		mav.addObject("myReview", myinfoService.myReviewListProcess(principal.getName()));
		mav.setViewName("/myinfo/myReview");
		return mav;
	}
	
	//마이페이지 수정
	@RequestMapping(value="/myinfo/myinfoupdate", method=RequestMethod.POST)
	public String updateProc(MemberDTO dto, HttpServletRequest request) {
		//System.out.println(dto.getUsername());
		dto.setBirth(dto.getBirth().replaceAll(",", ""));
		myinfoService.myinfoUpdateProcess(dto);
		HttpSession session = request.getSession();
		session.setAttribute("memberInfo", dto);
		return "/myinfo/myinfomain";
	}
	
	//내 예약 취소(update)
	@RequestMapping(value="/myinfo/myresCancel", method=RequestMethod.POST)
	public String myresCancel(ReserveDTO rdto) {
		System.out.println("AAAAA");
		myinfoService.myresCancelProcess(rdto);
		
		return "/myinfo/myResInfo"; 
	}

}//end class
