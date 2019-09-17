package com.dana.hos.comm.module;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageDTO {
	private int startPage;
	private int endPage;
	private String vi_hash; // 해시 페이지에서 mapper를 처리하기 위함
	
	public PageDTO(int page) {
		this.startPage = (page-1)*10 + 1;
		this.endPage = this.startPage + 9;
	}
}
