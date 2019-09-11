package com.dana.hos.notice.serivce;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dana.hos.notice.controller.FileUpload;

@Service
public class FileUploadImp implements FileUpload {

	@Override
	public String profileUpload(MultipartFile file, HttpServletRequest request)
			throws Exception {
		
		
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("profileUpload");

		//UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		//String str_filename = uuid.toString() + org_filename;
		String str_filename = org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = realFolder + "\\" + str_filename;

		System.out.println("파일경로 : " + filepath);
		
		File f = new File(realFolder);
		if (!f.exists()) {
			f.mkdirs();
		}
		byte fileData[] = file.getBytes();
		FileOutputStream fos = new FileOutputStream(filepath);
		fos.write(fileData);
		fos.flush();
		return str_filename;
	}


}