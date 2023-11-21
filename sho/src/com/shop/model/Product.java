package com.shop.model;

public class Product {

	private Integer pid;	//商品id
	private String pname;	//商品�?
	private String pimg;	//图片
	private Float price;	//价格
	private Integer stock;	//库存
	private String title;	//标题
	private String descb;	//描述
	private String bytime;	//上架时间
	private Integer classid;	//商品类别编号
	private String cname;	//类别名称
	
	public Product() {
		super();
	}

	public Product(Integer pid, String pname, String pimg, Float price, Integer stock, String title, String descb,
			String bytime, Integer classid, String cname) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pimg = pimg;
		this.price = price;
		this.stock = stock;
		this.title = title;
		this.descb = descb;
		this.bytime = bytime;
		this.classid = classid;
		this.cname = cname;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPimg() {
		return pimg;
	}

	public void setPimg(String pimg) {
		this.pimg = pimg;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", pimg=" + pimg + ", price=" + price + ", stock=" + stock
				+ ", title=" + title + ", descb=" + descb + ", bytime=" + bytime + ", classid=" + classid
				+ ", cname=" + cname + "]";
	}

	
}
