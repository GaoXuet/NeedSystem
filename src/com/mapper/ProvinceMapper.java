package com.mapper;

import java.util.List;

import com.bean.ProvinceBean;

public interface ProvinceMapper {

	// 通过province(id)获取provinceBean对象
	public ProvinceBean getProvinceById(int id);

	/**
	 * 获取ProvinceBeans,LIST
	 */
	public List<ProvinceBean> getProvinceList();
}
