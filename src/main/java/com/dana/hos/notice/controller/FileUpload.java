package com.dana.hos.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface FileUpload {
	public String profileUpload(MultipartFile file, HttpServletRequest request)
			throws Exception;
}

