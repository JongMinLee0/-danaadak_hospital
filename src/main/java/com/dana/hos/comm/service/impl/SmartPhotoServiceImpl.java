package com.dana.hos.comm.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.dana.hos.comm.service.SmartPhotoService;

import lombok.extern.slf4j.Slf4j;

// 스마트 에디터 사진 업로드
@Service
public class SmartPhotoServiceImpl implements SmartPhotoService {
	
	private static final Logger logger = LoggerFactory.getLogger(SmartPhotoServiceImpl.class);

	@Override
	public void smartUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 파일 정보
			String sFileInfo = "";
			// 파일명을 받는다 - 일반 원본 파일명
			String filename = request.getHeader("file-name");
			// 파일 기본경로
			String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			//System.out.println("dftFilePath : " + dftFilePath);
			// 파일 기본경로 _ 상세경로
			
			String filePath = dftFilePath + "review_image" + File.separator;
			System.out.println("filePath : " + filePath);
			File file = new File(filePath);
			if (!file.exists()) {
				file.mkdirs();
			}
			String realFileNm = "";
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String today = formatter.format(new java.util.Date());
			realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			String rlFileNm = filePath + realFileNm;

			// 서버에 파일 쓰기 //////
			InputStream is = request.getInputStream();
			OutputStream os = new FileOutputStream(rlFileNm);
			int numRead;
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			while ((numRead = is.read(b, 0, b.length)) != -1) {
				os.write(b, 0, numRead);
			}
			if (is != null)
				is.close();

			os.flush();
			os.close();

			///////////////////////

			// 정보 출력
			sFileInfo += "&bNewLine=true";
			// img 태그의 title 속성을 원본 파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName=" + filename;
			sFileInfo += "&sFileURL=" + "/hos/review_image/" + realFileNm;
			//System.out.println("sFileInfo : " + sFileInfo);
			PrintWriter out = response.getWriter();
			out.print(sFileInfo);
			out.flush();
			out.close();

		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}

}
