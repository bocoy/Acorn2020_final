package com.acorn.fin.ceo.dto;

public class CeoDto {
	private int code;
	private String pwd;
	private String cname;
	private String addr;
	private String lat;
	private String lng;
	private String newPwd;
	private String profile;
	private String context;

	public CeoDto() {}

	public CeoDto(int code, String pwd, String cname, String addr, String lat, String lng, String newPwd,
			String profile, String context) {
		super();
		this.code = code;
		this.pwd = pwd;
		this.cname = cname;
		this.addr = addr;
		this.lat = lat;
		this.lng = lng;
		this.newPwd = newPwd;
		this.profile = profile;
		this.context = context;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}
	
	
}
