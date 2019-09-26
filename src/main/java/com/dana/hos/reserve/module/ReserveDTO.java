package com.dana.hos.reserve.module;

import com.dana.hos.map.module.HosDTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReserveDTO {
	private int rno;
	private String re_date;
	private String re_time;
	private String category;
	private String message;
	private int re_state;
	private String username;
	private String hos_id;
	private String medicine;
	private String birth;
	private String eat_cnt;
	private HosDTO hosDTO;
  
	public ReserveDTO() {
		// TODO Auto-generated constructor stub
	}


	
}//end class 

