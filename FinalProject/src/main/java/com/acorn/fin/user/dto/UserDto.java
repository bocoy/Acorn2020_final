package com.acorn.fin.user.dto;

public class UserDto {
	private String id;
	private String pwd;
	private String pwd2;
	private String name;
	private String email;
	private int birth;
	private String regdate;
	public UserDto(String id, String pwd, String pwd2, String name, String email, int birth, String regdate) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.pwd2 = pwd2;
		this.name = name;
		this.email = email;
		this.birth = birth;
		this.regdate = regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwd2() {
		return pwd2;
	}
	public void setPwd2(String pwd2) {
		this.pwd2 = pwd2;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
