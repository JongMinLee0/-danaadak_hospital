package com.dana.hos.reserve.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dana.hos.reserve.module.ReserveDTO;
import com.dana.hos.reserve.service.ReserveService;
import com.dana.hos.reserve.service.impl.ReserveServiceImp;

import ch.qos.logback.core.net.SyslogOutputStream;

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
		mav.addObject("list", reserveService.reserveListProcess());

		mav.setViewName("reserve/reserve");
		return mav;
	}

	@RequestMapping(value = "/re_register", method = RequestMethod.POST)
	public ModelAndView registerPage(ReserveDTO dto, ModelAndView mav) {

		reserveService.re_registerProcess(dto);
		mav.setViewName("map/map");
		return mav;
	}// end registerPage

	@RequestMapping(value = "/check_time", method = RequestMethod.GET)
	public @ResponseBody int timeCheckPage(@ModelAttribute ReserveDTO dto) {
		int res = 0;
		int time = reserveService.timeChkProcess(dto);
		if (time == 0) {
			System.out.println("time;" + time);
		} else {
			res = 1;
		}
		System.out.println("res : " + res);
		return res;
	}// end timeCheckPage

}// end class
