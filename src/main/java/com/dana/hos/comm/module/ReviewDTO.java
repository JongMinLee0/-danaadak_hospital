package com.dana.hos.comm.module;

import com.dana.hos.reserve.module.ReserveDTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewDTO {
	private int vino;
	private String vi_subject;
	private String vi_content;
	private String vi_hash;
	private int vi_star;
	private String username; // 아이디
	private String name; // 이름
	private String hos_name; // 병원 아이디 말고 병원 이름 넣는게 더 편할 듯
	private String vi_date; // 작성일 추가 됨
	private int rno; // 예약 번호
	private ReserveDTO reserveDTO;

}



/*
  vino number, -> sequence vi_seq
  vi_subject varchar2(300),
  vi_content clob,
  id varchar2(50),
  name varchar2(100),
  hos_id varchar2(100)
 */