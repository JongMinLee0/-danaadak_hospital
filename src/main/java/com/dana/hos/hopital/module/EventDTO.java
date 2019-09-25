package com.dana.hos.hopital.module;

public class EventDTO {
	private int eno;
	private String e_subject;
	private String e_content , e_price, e_type, hos_id;
	
	
	public EventDTO() {
		// TODO Auto-generated constructor stub
	}


	public int getEno() {
		return eno;
	}


	public void setEno(int eno) {
		this.eno = eno;
	}


	public String getE_subject() {
		return e_subject;
	}


	public void setE_subject(String e_subject) {
		this.e_subject = e_subject;
	}


	public String getE_content() {
		return e_content;
	}


	public void setE_content(String e_content) {
		this.e_content = e_content;
	}


	public String getE_price() {
		return e_price;
	}


	public void setE_price(String e_price) {
		this.e_price = e_price;
	}


	public String getE_type() {
		return e_type;
	}


	public void setE_type(String e_type) {
		this.e_type = e_type;
	}


	public String getHos_id() {
		return hos_id;
	}


	public void setHos_id(String hos_id) {
		this.hos_id = hos_id;
	}

}