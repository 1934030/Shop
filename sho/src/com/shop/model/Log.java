package com.shop.model;

public class Log {

	private Integer logid;
	private Integer uid;
	private Integer adminid;
	private String descb;
	private String bytime;
	private String uname;
	
	public Log() {
		super();
	}
	
	public Log(Integer uid, String descb, String bytime) {
		super();
		this.uid = uid;
		this.descb = descb;
		this.bytime = bytime;
	}

	public Log(Integer logid, Integer uid, Integer adminid, String descb, String bytime, String uname) {
		super();
		this.logid = logid;
		this.uid = uid;
		this.adminid = adminid;
		this.descb = descb;
		this.bytime = bytime;
		this.uname = uname;
	}

	public Integer getLogid() {
		return logid;
	}

	public void setLogid(Integer logid) {
		this.logid = logid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getAdminid() {
		return adminid;
	}

	public void setAdminid(Integer adminid) {
		this.adminid = adminid;
	}

	public String getDescb() {
		return descb;
	}

	public void setDescb(String descb) {
		this.descb = descb;
	}

	public String getBytime() {
		return bytime;
	}

	public void setBytime(String bytime) {
		this.bytime = bytime;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	@Override
	public String toString() {
		return "Log [logid=" + logid + ", uid=" + uid + ", adminid=" + adminid + ", descb=" + descb + ", bytime="
				+ bytime + ", uname=" + uname + "]";
	}

}
