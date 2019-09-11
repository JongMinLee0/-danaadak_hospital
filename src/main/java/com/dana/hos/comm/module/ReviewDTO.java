package com.dana.hos.comm.module;

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
	private String id;
	private String name;
	private String hos_name; // 병원 아이디 말고 병원 이름 넣는게 더 편할 듯
	private String vi_date; // 작성일 추가 됨
}



/*
  vino number, -> sequence vi_seq
  vi_subject varchar2(300),
  vi_content clob,
  id varchar2(50),
  name varchar2(100),
  hos_id varchar2(100)
 */