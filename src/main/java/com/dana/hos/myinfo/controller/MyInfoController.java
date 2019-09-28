package com.dana.hos.myinfo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dana.hos.map.module.HosDTO;
import com.dana.hos.member.module.MemberDTO;
import com.dana.hos.myinfo.service.MyinfoService;
import com.dana.hos.reserve.module.ReserveDTO;

@Controller
public class MyInfoController {

	@Autowired
	private MyinfoService myinfoService;
	
	@Autowired
	private BCryptPasswordEncoder  bCryptPasswordEncoder;
	
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
	
	//내 정보  수정
	@RequestMapping(value="/myinfo/myinfoupdate", method=RequestMethod.POST)
	public String updateProc(MemberDTO dto, HttpServletRequest request) {
		fileUpload(dto, request);
		
		dto.setBirth(dto.getBirth().replaceAll(",", ""));	
		myinfoService.myinfoUpdateProcess(dto);
		HttpSession session = request.getSession();
		session.setAttribute("memberInfo", dto);
		return "/myinfo/myinfomain";
	}
	
	public void fileUpload(MemberDTO dto, HttpServletRequest request) {
		//기존 첨부파일
		String filename = myinfoService.fileSelectprocess(dto.getUsername());
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root + "temp" + File.separator;
		
		System.out.println(saveDirectory);
		
		//수정할 첨부파일
		MultipartFile profile = dto.getFilename();
		
		//수정한 첨부파일이 있으면
		if(!profile.isEmpty()) {
			//중복파일을 처리하기 위해 난수 발생
			UUID random = UUID.randomUUID();
			//기존 첨부파일이 있으면 기존첨부파일을 제거시켜줘라
			if(filename !=null) {
				File pro = new File(saveDirectory, filename);
				if(!pro.exists())
					pro.mkdir();
				pro.delete();
			}
			String fileName = profile.getOriginalFilename();
			dto.setProfile_image(random + "_" + fileName);
			File ff = new File(saveDirectory, random + "_" + fileName);
			try {
		            FileCopyUtils.copy(profile.getInputStream(), new FileOutputStream(ff));
		         } catch (IOException e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		         }
		}
	}//end fileUpload
	
	//예약 취소
	@ResponseBody
	@RequestMapping(value="cancel", method=RequestMethod.POST, produces = "application/text;charset=UTF-8")
	public String cancelReserve(int rno) {
		return myinfoService.myresCancelProcess(rno);
	}

}//end class
