package com.mapper;

import java.util.List;

import com.bean.CityBean;

public interface CityMapper {

	// 通过city(id)获取cityBean对象
	public CityBean getCityById(int id);
	
	public List<CityBean> getCityList(int provinceId);
}
