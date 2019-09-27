package com.dana.hos.member.module;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.dana.hos.map.module.HosDTO;

public class MemberDTO {
	private String username;
	private String password;
	private String name;
	private String address;
	private String phone;
	private String birth;
	private int gender;
	private String kakao_id;
	private String hos_id;
	private String type;
	private String authority;
	private int enabled;
	private HosDTO hosDTO;
	private String profile_image;
	private MultipartFile filename;

	public MemberDTO() {

	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getKakao_id() {
		return kakao_id;
	}

	public void setKakao_id(String kakao_id) {
		this.kakao_id = kakao_id;
	}

	public String getHos_id() {
		return hos_id;
	}

	public void setHos_id(String hos_id) {
		this.hos_id = hos_id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public HosDTO getHosDTO() {
		return hosDTO;
	}

	public void setHosDTO(HosDTO hosDTO) {
		this.hosDTO = hosDTO;
	}

	public String getProfile_image() {
		return profile_image;
	}

	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}

	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}
	
	
}