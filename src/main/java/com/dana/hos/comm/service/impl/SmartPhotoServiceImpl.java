package com.dana.hos.comm.service.impl;

import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.amazonaws.util.IOUtils;
import com.dana.hos.comm.service.SmartPhotoService;

// 스마트 에디터 사진 업로드
@Service
public class SmartPhotoServiceImpl implements SmartPhotoService {

	private static final Logger logger = LoggerFactory.getLogger(SmartPhotoServiceImpl.class);

	// S3 사용
	S3Util s3 = new S3Util();
	String bucketName = "danaatdak-bucket";

	/*
	 * InputStream is; byte[] bytes = IOUtils.toByteArray(is);
	 */

	@Override
	public void smartUpload(HttpServletRequest request, HttpServletResponse response) {
		try {
			InputStream is = request.getInputStream();
			byte[] bytes = IOUtils.toByteArray(is);
			///////////////////////
			// 파일명을 받는다 - 일반 원본 파일명
			String filename = request.getHeader("file-name");

			// 업로드 경로
			String uploadPath = "dak/images";
			String decoding = URLDecoder.decode(filename, "UTF-8");
			String encoding = URLEncoder.encode(decoding, "UTF-8");

			// S3에 업로드
			ResponseEntity<String> img_path = new ResponseEntity<>(
					UploadFileUtils.uploadFile(uploadPath, encoding, bytes), HttpStatus.CREATED);

			// 이미지 경로
			String image_path = img_path.getBody();
			String fullPath = "/hos/comm/displayFile?fileName=" + image_path;

			// 파일 정보
			String sFileInfo = "";
			// 정보 출력
			sFileInfo += "&bNewLine=true";
			// img 태그의 title 속성을 원본 파일명으로 적용시켜주기 위함
			sFileInfo += "&sFileName=" + image_path;
			sFileInfo += "&sFileURL=" + fullPath;
			// System.out.println("sFileInfo : " + sFileInfo);
			PrintWriter out = response.getWriter();

			out.print(sFileInfo);
			out.flush();
			out.close();

		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
}