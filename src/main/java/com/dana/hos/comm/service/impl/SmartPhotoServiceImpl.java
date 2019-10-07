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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.dana.hos.comm.service.SmartPhotoService;

import lombok.extern.slf4j.Slf4j;

// 스마트 에디터 사진 업로드
@Service
public class SmartPhotoServiceImpl implements SmartPhotoService {

	private static final Logger logger = LoggerFactory.getLogger(SmartPhotoServiceImpl.class);

	// S3 사용
	S3Util s3 = new S3Util();
	String bucketName = "danaatdak-bucket";

	@Override
	public void smartUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			///////////////////////
			// 파일명을 받는다 - 일반 원본 파일명
			String filename = request.getHeader("file-name");
			System.out.println("file-name : " + filename);
			// 업로드 경로
			String uploadPath = "dak/images";
			byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			
			// S3에 업로드
			ResponseEntity<String> img_path = new ResponseEntity<>(
					UploadFileUtils.uploadFile(uploadPath, filename, b),
					HttpStatus.CREATED);
			
			// 이미지 경로
			String image_path = img_path.getBody();
			System.out.println("image_path : " + image_path);
			String fullPath = "/comm/displayFile?fileName="+image_path;
			System.out.println("fullPath : " + fullPath);

			// 파일 정보
			String sFileInfo = "";
			// 정보 출력
			sFileInfo += "&bNewLine=true";
			// img 태그의 title 속성을 원본 파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName=" + filename;
			sFileInfo += "&sFileURL=" + fullPath;
			// System.out.println("sFileInfo : " + sFileInfo);
			PrintWriter out = response.getWriter();
			System.out.println("sFileInfo : " + sFileInfo);
			out.print(sFileInfo);
			out.flush();
			out.close();

		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}

}
