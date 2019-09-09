package com.dana.hos.comm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comm/")
public class CommuController {
	
	@RequestMapping("main")
	public String commMain() {
		return "commu/commain";
	}
}
