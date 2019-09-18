package com.dana.hos.notice.serivce;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dana.hos.notice.controller.FileDownload;

@Service
public class FileDownloadImp implements FileDownload{

	@Override
	public String profileDownload(MultipartFile file, HttpServletRequest reqest) {
		//
		
		return null;
	}
	
	
}
