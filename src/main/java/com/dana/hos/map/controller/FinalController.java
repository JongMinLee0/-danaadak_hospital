package com.dana.hos.map.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dana.hos.map.module.HosDTO;
import com.dana.hos.map.module.PhDTO;
import com.dana.hos.map.service.HosService;
import com.dana.hos.map.service.PhService;


@Controller
public class FinalController {
	
	@Autowired
	private HosService hosService;
	@Autowired
	private PhService phService;
	public FinalController() {
	}
	
	public void setSerivce(HosService hosService) {
		this.hosService = hosService;
	}
	public void setPhService(PhService phService) {
		this.phService = phService;
	}
	@RequestMapping("/map")
	public String map() {
		return "map/map";
	}
	
	@RequestMapping("/hosmap")
	public @ResponseBody ModelAndView HospitalMap(int pageNo, int pageSize, String keyword, ModelAndView mav) {
		int countAll=hosService.hosf_countAllProcess(keyword);
		int totalPage=countAll/pageSize;
		if((countAll%pageSize)>0)
			totalPage++;
		
		List<HosDTO> aList = hosService.hosf_listProcess(pageNo, pageSize, keyword);
		mav.addObject("aList",aList);
		mav.addObject("pageNo",pageNo);
		mav.addObject("totalPage",totalPage);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping("/phmap")
	public String phmap() {
		return "map/phmap";
	}
	
	@RequestMapping("/phmapsearch")
	public @ResponseBody ModelAndView PharmacyMap(int pageNo, int pageSize, String keyword, ModelAndView mav) {
		int countAll=phService.phf_countAllProcess(keyword);
		int totalPage=countAll/pageSize;
		if((countAll%pageSize)>0)
			totalPage++;
		
		List<PhDTO> aList = phService.phf_listProcess(pageNo, pageSize, keyword);
		mav.addObject("aList",aList);
		mav.addObject("pageNo",pageNo);
		mav.addObject("totalPage",totalPage);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
}
