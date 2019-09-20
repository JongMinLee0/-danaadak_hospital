package com.dana.hos.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dana.hos.notice.module.NoticeDTO;
import com.dana.hos.notice.module.PageDTO;
import com.dana.hos.notice.serivce.NoticeService;


@ComponentScan("com.dana.hos")
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	private int currentPage;
	
	private PageDTO pdto;

	@Autowired
	com.dana.hos.notice.controller.FileUpload upload;
	@Autowired
	com.dana.hos.notice.controller.FileDownload download;
	
	public NoticeController() {

	}
	
	@Autowired
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	
	@RequestMapping("/noticelist")
	public ModelAndView listMethod(PageDTO pg, ModelAndView mav) {
		int totalRecord = noticeService.countProcess();
		if (totalRecord >= 1) {
			if (pg.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pg.getCurrentPage();
			}
			pdto = new PageDTO(currentPage, totalRecord);
			mav.addObject("pg", pdto);
			mav.addObject("aList", noticeService.listProcess(pdto));
		}
		mav.setViewName("notice/list");
		return mav;
	}// end listMethod()//////////////////////

	@RequestMapping("/noticeview")
	public ModelAndView viewMethod(int currentPage, NoticeDTO dto, ModelAndView mav) {
		System.out.println("빌드가 안돼..");
		
		dto.setRownum(noticeService.rownumfindProcess(dto.getNum()));
		dto.setPre(dto.getRownum()-1);
		dto.setNext(dto.getRownum()+1);
	
		mav.addObject("prenext", noticeService.prenextProcess(dto));
		mav.addObject("dto", noticeService.contentProcess(dto.getNum()));
		mav.addObject("currentPage", currentPage);
		mav.addObject("rownum", dto.getRownum());
		
		mav.setViewName("notice/view");
		
		return mav;

	}// end viewMethod()/////////////////////////////////

	@RequestMapping(value = "/noticewrite", method = RequestMethod.GET)
	public ModelAndView writeMethod(PageDTO pg, NoticeDTO dto, ModelAndView mav) {
		mav.setViewName("notice/write");
		return mav;

	}// end writeMethod()////////////////////////////////
	
	@RequestMapping(value = "/noticewrite", method = RequestMethod.POST)
	public String writeMethod(MultipartFile filename, NoticeDTO dto, HttpServletRequest request) throws Exception {
		fileUpdate(dto, request);
		
	//	dto.setUpload(filename.getOriginalFilename());
		noticeService.insertProcess(dto);
		
		return "redirect:/noticelist";
	}
	
	public void fileUpdate(NoticeDTO dto, HttpServletRequest request ) {
		String filename = noticeService.fileSelectProcess(dto.getNum());
		String root = request.getSession().getServletContext().getRealPath("/");

		String saveDirectory = root + "temp" + File.separator;
		File fe = new File(saveDirectory);
		
		System.out.println(saveDirectory);
		
		if(!fe.exists())
			fe.mkdir();
		// 수정할 첨부파일
		MultipartFile file = dto.getFilename();
		
		//수정한 첨부파일이 있으면
		if(!file.isEmpty()) {
			//중복파일을 처리하기 위해 난수 발생
			UUID random = UUID.randomUUID();
			//기존 첨부파일이 있으면 기존첨부파일을 제거시켜줘라
			if(filename !=null) {
				File fi = new File(saveDirectory, filename);
				fe.delete();
			}
			
			String fileName = file.getOriginalFilename();
			dto.setUpload(random + "_" +fileName);
			File ff = new File (saveDirectory, random + "_" +fileName);
			
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}//end fileupdate()/////////////////////////////
	

//http://localhost:8090/hos/noticelist
	@RequestMapping(value = "/noticeupdate", method = RequestMethod.GET)
	public ModelAndView updateMethod(int num, int currentPage, ModelAndView mav) {
		
		mav.addObject("dto", noticeService.updateSelectProcess(num));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("notice/update");
		return mav;

	}// end updateMethod()//////////////////////////////
	
	
	@RequestMapping(value="/noticeupdate", method=RequestMethod.POST)
	public ModelAndView updateProc(MultipartFile filename,NoticeDTO dto, int currentPage, HttpServletRequest request, ModelAndView mav) {
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/noticelist");
		dto.setUpload(filename.getOriginalFilename());
		noticeService.updateProcess(dto);
		return mav;
		
	}//end updateProc()//////////////////////////////////
	
	
	@RequestMapping(value = "/noticedelete")
	public ModelAndView deleteMethod(int num, int currentPage, HttpServletRequest request, ModelAndView mav) {
		String upload = noticeService.fileSelectProcess(num);
		if (upload != null) {
			String root = request.getSession().getServletContext().getRealPath("/");
			String seveDirectory = root + "temp" + File.separator;
			File fe = new File(seveDirectory, upload);
			fe.delete();
		}
		noticeService.deleteProcess(num);
		PageDTO pg = new PageDTO(currentPage, noticeService.countProcess());
		if (pg.getTotalPage() <= currentPage)
			mav.addObject("currentpage", currentPage);
		else
			mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/noticelist");
		return mav;
	}// end deleteMehtod()//////////////////

	@RequestMapping("/contentdownload")
	public ModelAndView downMethod(int num, ModelAndView mav) {
		mav.addObject("num", num);
		mav.setViewName("download");
		return mav;
		
	}
}// end class
