package com.dana.hos.comm.module;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageDTO {
	private int startPage;
	private int endPage;
	
	public PageDTO(int page) {
		this.startPage = (page-1)*10 + 1;
		this.endPage = this.startPage + 9;
	}
}
