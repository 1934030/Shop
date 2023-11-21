package com.shop.model;

public class Admin {

	private Integer adminid;
	private String aimg;
	private String aname;
	private String password;
	private Integer grade;
	
	public Admin() {
		super();
	}

	public Admin(Integer adminid, String password) {
		this.adminid = adminid;
		this.password = password;
	}

	public Admin(Integer adminid, String aimg, String aname, String password, Integer grade) {
		super();
		this.adminid = adminid;
		this.aimg = aimg;
		this.aname = aname;
		this.password = password;
		this.grade = grade;
	}

	public Integer getAdminid() {
		return adminid;
	}

	public void setAdminid(Integer adminid) {
		this.adminid = adminid;
	}

	public String getAimg() {
		return aimg;
	}

	public void setAimg(String aimg) {
		this.aimg = aimg;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "Admin [adminid=" + adminid + ", aimg=" + aimg + ", aname=" + aname + ", password=" + password
				+ ", grade=" + grade + "]";
	}
	
}
