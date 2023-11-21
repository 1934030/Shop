package com.shop.model;

public class User {

	private Integer uid;
	private String headimg;
	private String uname;
	private String password;
	private String myname;
	private String sex;
	private String birthday;
	private Integer vip;
	private String phone;
	private String idnum;	//身份�?
	private String email;
	private String address;
	private String signature;	//个�?�标�?
	private int status;
	private String bytime;	//注册时间
	private String lasttime;	//�?后登录时�?
	
	public User() {
		super();
	}

	public User(Integer uid, String password) {
		super();
		this.uid = uid;
		this.password = password;
	}

	public User(Integer uid, String headimg, String uname, String password, String myname, String sex, String birthday,
			Integer vip, String phone, String idnum, String email, String address, String signature, int status,
			String bytime, String lasttime) {
		super();
		this.uid = uid;
		this.headimg = headimg;
		this.uname = uname;
		this.password = password;
		this.myname = myname;
		this.sex = sex;
		this.birthday = birthday;
		this.vip = vip;
		this.phone = phone;
		this.idnum = idnum;
		this.email = email;
		this.address = address;
		this.signature = signature;
		this.status = status;
		this.bytime = bytime;
		this.lasttime = lasttime;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getHeadimg() {
		return headimg;
	}

	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMyname() {
		return myname;
	}

	public void setMyname(String myname) {
		this.myname = myname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public Integer getVip() {
		return vip;
	}

	public void setVip(Integer vip) {
		this.vip = vip;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIdnum() {
		return idnum;
	}

	public void setIdnum(String idnum) {
		this.idnum = idnum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getBytime() {
		return bytime;
	}

	public void setBytime(String bytime) {
		this.bytime = bytime;
	}
	
	public String getLasttime() {
		return lasttime;
	}

	public void setLasttime(String lasttime) {
		this.lasttime = lasttime;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", headimg=" + headimg + ", uname=" + uname + ", password=" + password + ", myname="
				+ myname + ", sex=" + sex + ", birthday=" + birthday + ", vip=" + vip + ", phone=" + phone + ", idnum="
				+ idnum + ", email=" + email + ", address=" + address + ", signature=" + signature + ", status="
				+ status + ", bytime=" + bytime + ", lasttime=" + lasttime + "]";
	}
	
}
