package com.dana.hos.reserve.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dana.hos.reserve.module.ReserveDTO;
import com.dana.hos.reserve.service.ReserveService;
import com.dana.hos.reserve.service.impl.ReserveServiceImp;


//http://localhost:8090/myproject/reserve.do
@Controller
public class ReserveController {
	@Autowired
	private ReserveService reserveService;
	
	public ReserveController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setService(ReserveServiceImp service) {
		this.setService(service); 
	}
	
	@RequestMapping("/reserve")
	public ModelAndView reserveListpage(ModelAndView mav) {
		System.out.println("여기로 들어와1");
		mav.addObject("list",reserveService.reserveListProcess());
		
		mav.setViewName("reserve/reserve");
		return mav;
	}
	
	@RequestMapping(value="/re_register", method =RequestMethod.POST)
	public ModelAndView registerPage(ReserveDTO dto, ModelAndView mav){
		System.out.println("여기로 들어와2");
		reserveService.re_registerProcess(dto);
		mav.setViewName("reserve/reserve");
		return mav;
	}//end registerPage
	
	@RequestMapping(value="/check_time",method =RequestMethod.GET)
	public @ResponseBody int timeCheckPage(ReserveDTO dto, ModelAndView mav) {
		System.out.println(dto.getRe_time());
		System.out.println(dto.getRe_date());
		int res = 0;
		int time = reserveService.timeChkProcess(dto);
		if(time == 0) {
		}else {
			res=1;
		}
		return res;
	}//end timeCheckPage
	

}//end class
