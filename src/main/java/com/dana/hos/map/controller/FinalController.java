package com.dana.hos.map.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dana.hos.map.module.HosDTO;
import com.dana.hos.map.service.HosService;


@Controller
public class FinalController {
	
	@Autowired
	private HosService hosService;
	
	public FinalController() {
	}
	
	public void setSerivce(HosService hosService) {
		this.hosService = hosService;
	}
	@RequestMapping("/map")
	public String map() {
		return "map/map";
	}
	
	@RequestMapping("/hosmap")
	public @ResponseBody ModelAndView libraryMap(int pageNo, int pageSize, String keyword, ModelAndView mav) {
		int countAll=hosService.f_countAllProcess(keyword);
		int totalPage=countAll/pageSize;
		if((countAll%pageSize)>0)
			totalPage++;
		
		List<HosDTO> aList = hosService.f_listProcess(pageNo, pageSize, keyword);
		mav.addObject("aList",aList);
		mav.addObject("pageNo",pageNo);
		mav.addObject("totalPage",totalPage);
		mav.setViewName("jsonView");
		return mav;
	}
}
