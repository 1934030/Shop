package com.shop.model;

public class ClassIfication {

	private Integer classid;
	private String cname;
	private String descb;
	
	public ClassIfication() {
		super();
	}

	public ClassIfication(Integer classid, String cname, String descb) {
		super();
		this.classid = classid;
		this.cname = cname;
		this.descb = descb;
	}

	public Integer getClassid() {
		return classid;
	}

	public void setClassid(Integer classid) {
		this.classid = classid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getDescb() {
		return descb;
	}

	public void setDescb(String descb) {
		this.descb = descb;
	}

	@Override
	public String toString() {
		return "ClassIfication [classid=" + classid + ", cname=" + cname + ", descb=" + descb + "]";
	}
	
	
}
