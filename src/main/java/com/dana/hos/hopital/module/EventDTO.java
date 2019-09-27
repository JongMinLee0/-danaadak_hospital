package com.dana.hos.hopital.module;

import com.dana.hos.map.module.HosDTO;

public class EventDTO {
	private int eno;
	private String e_subject;
	private String e_content , e_url, e_type, hos_id, hos_name;
	private HosDTO e_hosDTO;
	
	
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


	public String getE_url() {
		return e_url;
	}


	public void setE_url(String e_url) {
		this.e_url = e_url;
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


	public HosDTO getE_hosDTO() {
		return e_hosDTO;
	}


	public void setE_hosDTO(HosDTO e_hosDTO) {
		this.e_hosDTO = e_hosDTO;
	}


	public String getHos_name() {
		return hos_name;
	}


	public void setHos_name(String hos_name) {
		this.hos_name = hos_name;
	}
	
	
	

	

}