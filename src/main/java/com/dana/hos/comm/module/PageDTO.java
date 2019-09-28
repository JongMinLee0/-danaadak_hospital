package com.dana.hos.comm.module;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageDTO {
	private int total; //총 레코드 수 
	private int currPage; //현재페이지	
	private int startPage; //한 블록의 시작 페이지 번호
	private int endPage; //한블록의 끝페이지 번호
	private String vi_hash; // 해시 페이지에서 mapper를 처리하기 위함
	private int blockCount=6; // 페이지에 나올 레코드수 
	private int blockPage = 5;
	private int startRow; //시작레코드 번호
	private int endRow; //끝 레코드 번호
	private int totalpage ;
	public PageDTO() {
		// TODO Auto-generated constructor stub
	}
	public PageDTO(int page) {
		this.startPage = (page-1)*10 + 1;
		this.endPage = this.startPage + 9;
	}
	
	
	public PageDTO(int currPage, int total) {
		this.currPage = currPage;
		this.total = total;

		// 시작레코드
		startRow = (currPage - 1) * blockCount + 1;

		// 끝레코드
		endRow = startRow + blockCount - 1;

		// 총페이지수
		totalpage = total / blockCount + (totalpage % blockCount == 0 ? 0 : 1);

		// 시작페이지
		startPage = (int) ((currPage - 1) / blockPage) * blockPage + 1;

		// 끝페이지
		endPage = startPage + blockPage - 1;
		if (total < endPage)
			endPage = total;

		// 리스트페이지에 출력번호
		int number = total - (currPage - 1) * blockCount;
	}
	
}//end class 
