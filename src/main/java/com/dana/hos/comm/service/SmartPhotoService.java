package com.dana.hos.comm.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public interface SmartPhotoService {
	public void smartUpload(HttpServletRequest request, HttpServletResponse response);
}
