package com.dana.hos.hopital.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dana.hos.hopital.module.EventDTO;
import com.dana.hos.hopital.module.HospitalDTO;
import com.dana.hos.hopital.service.HospitalService;
import com.dana.hos.member.module.MemberDTO;
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
	public ModelAndView reserveListpage(ModelAndView mav, MemberDTO dto, EventDTO edto) {
		mav.addObject("list", hospitalService.bookListProcess(dto));
		mav.addObject("edto", hospitalService.eventListProcess(edto));
		mav.setViewName("hospital/hospital_page");
		return mav;
	}
	@RequestMapping(value="/view" , method= RequestMethod.GET)
	public ModelAndView viewMethod(ModelAndView mav, MemberDTO dto) {
		List<ReserveDTO> aList = hospitalService.contentProcess(dto);
		/*mav.addObject("param1",aList.get(0));*/
		mav.addObject("name",hospitalService.nameselctProcess(dto.getHos_id()));
		mav.setViewName("hospital/view");
		return mav;
	}

	@RequestMapping(value="/re_stateUpdate" ,method=RequestMethod.POST)
	public ModelAndView re_stateUpdateMethod(ModelAndView mav, ReserveDTO dto) {
		
		hospitalService.updateProcess(dto);
		mav.setViewName("redirect:/hospital?hos_id="+dto.getHos_id());
		return mav;
	}
	
	@RequestMapping(value="/event_register", method=RequestMethod.GET)
	public ModelAndView eventInsertMethod(ModelAndView mav,ReserveDTO dto) {
		mav.setViewName("hospital/eventRegister");
		return mav;
	}
	
	@RequestMapping(value="/event_registerPro", method=RequestMethod.POST)
	public ModelAndView eventInsertProMethod(ModelAndView mav, EventDTO dto) {
		hospitalService.eventInsertProcess(dto);
		mav.setViewName("redirect:hospital?hos_id="+dto.getHos_id());
		return mav;
	}
}//end class 
