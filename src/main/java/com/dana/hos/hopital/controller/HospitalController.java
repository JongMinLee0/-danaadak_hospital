package com.dana.hos.hopital.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dana.hos.hopital.service.HospitalService;
import com.dana.hos.reserve.module.ReserveDTO;
import com.dana.hos.reserve.service.impl.ReserveServiceImp;

@Controller
public class HospitalController {
	
	@Autowired
	private HospitalService hospitalService;
		
	public HospitalController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setHospitalService(HospitalService hospitalService) {
		this.hospitalService = hospitalService;
	}
	
	@RequestMapping("/hospital")
	public ModelAndView reserveListpage(ModelAndView mav,ReserveDTO dto) {
		mav.addObject("list", hospitalService.bookListProcess(dto));
		mav.setViewName("hospital/hospital_page");
		return mav;
	}
	@RequestMapping("/view")
	public ModelAndView viewMethod(ModelAndView mav, String username) {
		mav.addObject("list",hospitalService.contentProcess(username));
		mav.setViewName("hospital/view");
		return mav;
	}
	
	@RequestMapping(value="/re_stateUpdate" ,method=RequestMethod.POST)
	public ModelAndView  re_stateUpdateMethod(ModelAndView mav, ReserveDTO dto) {
		mav.setViewName("redirect:/hospital");
		hospitalService.updateProcess(dto);
		return mav;
	}
	
	@RequestMapping(value="/rec_insert", method= RequestMethod.POST)
	public ModelAndView recipeInsertMethod(ModelAndView mav, ReserveDTO dto) {
		hospitalService.recInsertProcess(dto);
		mav.setViewName("hospital/view");
		return mav;
	}
	
	@RequestMapping(value="/event_register", method=RequestMethod.GET)
	public ModelAndView eventInsertMethod(ModelAndView mav) {
		mav.setViewName("hospital/eventRegister");
		return mav;
	}
}//end class 
