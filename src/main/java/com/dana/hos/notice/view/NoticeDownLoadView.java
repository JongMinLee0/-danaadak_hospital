package com.dana.hos.notice.view;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.dana.hos.notice.repo.NoticeDAO;

public class NoticeDownLoadView extends AbstractView{
	private NoticeDAO dao;
	
	public NoticeDownLoadView() {
	
	}
	
	public void setDao(NoticeDAO dao) {
		this.dao = dao;
	}
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		int num = Integer.parseInt(request.getParameter("num"));
		
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root + "temp" + File.separator;
		
		String upload = dao.getFile(num);  //num의 해당되는 첨부파일을 가져온다.
		String fileName= upload.substring(upload.indexOf("_")+1);
		
		//파일명이 한글일때 인코딩 작업
		String str = URLEncoder.encode(fileName,"UTF-8");
		
		//원본파일명에서 공백이 있을때 +로 표시가되므로 공백처리
		str = str.replaceAll("\\+", "%20");
		
		//컨텐트 타입
		response.setContentType("application/octet-stream");
		
		//다운로드창에 보여줄 파일명을 지정
		response.setHeader("Content-Disposition", "attachment;filename="+str+";");
		
		//서버에 저장된 파일을 읽어와 클라이언트에 출력
		FileCopyUtils.copy(new FileInputStream(
				new File(saveDirectory,upload)),
				response.getOutputStream());
	}//end renderMergedOutputModel()

}//end class
