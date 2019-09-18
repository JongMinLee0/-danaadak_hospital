package com.dana.hos.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface FileDownload {
	public String profileDownload(MultipartFile file, HttpServletRequest reqest);
}
