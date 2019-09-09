package com.dana.hos.reserve.controller;



import java.util.Date;

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
	private String path;
	
	public ReserveController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setService(ReserveServiceImp service) {
		this.setService(service); 
	}
	
	public void setPath(String path) {
		this.path = path;
	}
	
	@RequestMapping("/reserve")
	public ModelAndView bookListpage(ModelAndView mav) {
		mav.addObject("list",reserveService.reserveListProcess());
		mav.setViewName("reserve/reserve");
		return mav;
	}
	
	@RequestMapping(value="/re_register", method = RequestMethod.POST)
	public ModelAndView registerPage(ReserveDTO dto, ModelAndView mav){
		System.out.println("날짜 :" +dto.getRe_date());
		System.out.println("시간: " +  dto.getRe_time());
/*		String[] re_date_time = dto.getRe_date().split("T");
		dto.setRe_date(re_date_time[0]);
		dto.setRe_time(re_date_time[1]);
		
		System.out.println(dto.getRe_time());
*/		reserveService.re_registerProcess(dto);
		
		mav.setViewName("reserve/reserve");
		return mav;
	}//end registerPage
	
	@RequestMapping(value="/check_time",method = RequestMethod.GET)
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
	}
}//end class
