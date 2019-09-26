package com.dana.hos.reserve.module;

import com.dana.hos.map.module.HosDTO;


public class ReserveDTO {
	private int rno;
	private String re_date;
	private String re_time;
	private String category;
	private String message;
	private int re_state;
	private String username;

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	private String hos_id;
	private String medicine;
	private String birth;
	private String eat_cnt;
	private HosDTO hosDTO;

	public ReserveDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getEat_cnt() {
		return eat_cnt;
	}

	public void setEat_cnt(String eat_cnt) {
		this.eat_cnt = eat_cnt;
	}

	public String getRe_date() {
		return re_date;
	}

	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}

	public String getRe_time() {
		return re_time;
	}

	public void setRe_time(String re_time) {
		this.re_time = re_time;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getRe_state() {
		return re_state;
	}

	public void setRe_state(int re_state) {
		this.re_state = re_state;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getHos_id() {
		return hos_id;
	}

	public void setHos_id(String hos_id) {
		this.hos_id = hos_id;
	}

	public String getMedicine() {
		return medicine;
	}

	public void setMedicine(String medicine) {
		this.medicine = medicine;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public HosDTO getHosDTO() {
		return hosDTO;
	}

	public void setHosDTO(HosDTO hosDTO) {
		this.hosDTO = hosDTO;
	}

}// end class
