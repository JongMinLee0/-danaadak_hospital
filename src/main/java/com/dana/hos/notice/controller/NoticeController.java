package com.dana.hos.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
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

		dto.setRownum(noticeService.rownumfindProcess(dto.getNum()));
		dto.setPre(dto.getRownum()-1);
		dto.setNext(dto.getRownum()+1);
		         
		
		mav.addObject("prenext", noticeService.prenextProcess(dto));
		mav.addObject("dto", noticeService.contentProcess(dto.getNum()));
		mav.addObject("currentPage", currentPage);
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
		
		dto.setUpload(filename.getOriginalFilename());
		noticeService.insertProcess(dto);
		
		return "redirect:/noticelist";
	}
	
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

/*	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String path = request.getSession().getServletContext().getRealPath("저장경로");
		
		String filename = request.getParameter("fileName");
		String downname= request.getParameter("downName");
		String realPath= "";
		System.out.println("downname:" +downname);
		if(filename == null || "".equals(filename)) {
			filename = downname;
		}
		 try {
	            String browser = request.getHeader("User-Agent"); 
	            //파일 인코딩 
	            if (browser.contains("MSIE") || browser.contains("Trident")
	                    || browser.contains("Chrome")) {
	                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+",
	                        "%20");
	            } else {
	                filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
	            }
	        } catch (UnsupportedEncodingException ex) {
	            System.out.println("UnsupportedEncodingException");
	        }
	        realPath = path +"/" +downname.substring(0,4) + "/"+downname;
	        System.out.println(realPath);
	        File file1 = new File(realPath);
	        if (!file1.exists()) {
	            return ;
	        }
	         
	        // 파일명 지정        
	        response.setContentType("application/octer-stream");
	        response.setHeader("Content-Transfer-Encoding", "binary;");
	        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
	        try {
	            OutputStream os = response.getOutputStream();
	            FileInputStream fis = new FileInputStream(realPath);
	 
	            int ncount = 0;
	            byte[] bytes = new byte[512];
	 
	            while ((ncount = fis.read(bytes)) != -1 ) {
	                os.write(bytes, 0, ncount);
	            }
	            fis.close();
	            os.close();
	        } catch (FileNotFoundException ex) {
	            System.out.println("FileNotFoundException");
	        } catch (IOException ex) {
	            System.out.println("IOException");
	        }
	    }
	*/
}// end class
