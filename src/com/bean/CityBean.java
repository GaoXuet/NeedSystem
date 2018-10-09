package com.bean;

public class CityBean {

	private int id;
	private String name;	//市名称
	private String postcode;	//邮政编码
	private String createDate;	//创建时间
	private int provinceId;	//省id
	private ProvinceBean provinceBean;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(int provinceId) {
		this.provinceId = provinceId;
	}
	public ProvinceBean getProvinceBean() {
		return provinceBean;
	}
	public void setProvinceBean(ProvinceBean provinceBean) {
		this.provinceBean = provinceBean;
	}
	
	
}
