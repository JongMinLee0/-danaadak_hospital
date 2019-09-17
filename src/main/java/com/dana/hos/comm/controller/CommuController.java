package com.dana.hos.comm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dana.hos.comm.module.CommentDTO;
import com.dana.hos.comm.module.PageDTO;
import com.dana.hos.comm.module.ReviewDTO;
import com.dana.hos.comm.service.CommService;
import com.dana.hos.comm.service.SmartPhotoService;

@Controller
@RequestMapping("/comm/")
public class CommuController {

	@Autowired
	SmartPhotoService smartPhotoService;

	@Autowired
	CommService commService;

	// 커뮤니티 메인 페이지
	@RequestMapping("main")
	public String commMain() {
		return "commu/commain";
	}

	// 이벤트 페이지
	@RequestMapping("event")
	public String comEvent() {
		return "event";
	}

	// 후기 페이지
	// 후기 리스트 생성
	@RequestMapping("review")
	public ModelAndView comReview(ModelAndView mav) {
		mav.setViewName("review");
		mav.addObject("rList", commService.totalList());
		mav.addObject("hList", commService.hashList());
		return mav;
	}

	// 스크롤시 후기 리스트 가져오기
	@ResponseBody
	@RequestMapping(value = "scrollReview", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public List<ReviewDTO> scrollReview(String page) {
		int page2 = Integer.parseInt(page);
		PageDTO pdto = new PageDTO(page2);
		/* mav.addAttribute("pList", commService.scrollList(pdto)); */
		return commService.scrollList(pdto);
	}

	// 채팅 페이지
	@RequestMapping("chat")
	public String comChat() {
		return "chat";
	}

	// 후기 작성페이지로 이동
	@RequestMapping("reviewWrite")
	public String reviewWriteForm() {
		return "write";
	}

	// 스마트에디터 파일 첨부
	@RequestMapping(value = "smartPhoto", method = RequestMethod.POST)
	public void multiSmartPhoto(HttpServletRequest request, HttpServletResponse response) {
		smartPhotoService.smartUpload(request, response);
	}

	// 후기 작성요청
	@ResponseBody
	@RequestMapping(value = "write", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
	public String reviewWrite(@ModelAttribute ReviewDTO dto) {
		String result = commService.writeService(dto);
		return result;
	}

	// 후기 상세페이지
	@RequestMapping(value = "reviewDetail", method = RequestMethod.GET)
	public ModelAndView reviewDetail(int vino, ModelAndView mav) {
		mav.addObject("dList", commService.reviewDetail(vino));
		mav.addObject("cList", commService.commList(vino));
		mav.setViewName("comm_redetail");
		return mav;
	}

	// 후기 댓글 쓰기
	@ResponseBody
	@RequestMapping(value = "writeCom", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
	public String reviewCom(@ModelAttribute CommentDTO dto) {
		String result = commService.writeCom(dto);
		return result;
	}

	// 후기글 삭제하기
	@ResponseBody
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public void deleteDetail(int vino) {
		commService.deleteReview(vino);
	}

	// 후기 글 수정페이지
	@RequestMapping(value = "reviewModify", method = RequestMethod.GET)
	public ModelAndView reviewModify(int vino, ModelAndView mav) {
		mav.addObject("dList", commService.reviewDetail(vino));
		mav.setViewName("comm_modify");
		return mav;
	}

	// 후기 수정 요청
	@ResponseBody
	@RequestMapping(value = "modifyWrite", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
	public String modifyWrite(@ModelAttribute ReviewDTO dto) {
		System.out.println("dto" + dto.getVi_subject());
		String result = commService.updateReview(dto);
		return result;
	}

	// 후기 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "comDelete", method = RequestMethod.POST)
	public void deleteCom(int cno) {
		commService.comDelete(cno);
	}

	// 후기 댓글 수정
	@ResponseBody
	@RequestMapping(value = "modifyCom", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
	public String modifyCom(@ModelAttribute CommentDTO dto) {
		String result = commService.modifyCom(dto);
		return result;
	}

}
