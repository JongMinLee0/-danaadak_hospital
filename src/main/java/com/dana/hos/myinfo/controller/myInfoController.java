package com.dana.hos.myinfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class myInfoController {
	
	//마이페이지 메인
	@RequestMapping("/myinfo/myinfomain")
	public String process() {
		return "/myinfo/myinfomain";
	}
	
	//내 정보 페이지
	@RequestMapping("/myinfo/memInfo")
	public String memInfo() {
		return "/myinfo/memInfo";
	}
	
	//내 예약 조회
	@RequestMapping("/myinfo/myResInfo")
	public String myResInfo() {
		return "/myinfo/myResInfo";
	}
	
	//내 처방전 목록
	@RequestMapping("/myinfo/myPharmInfo")
	public String myPharmInfo() {
		return "/myinfo/myPharmInfo";
	}
	
	//내 처방전 상세
	@RequestMapping("/myinfo/myPharmDetail")
	public String myPharmDetail() {
		return "/myinfo/myPharmDetail";
	}
	
	
}//end class
