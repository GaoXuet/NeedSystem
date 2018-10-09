package com.mapper;

import java.util.List;

import com.bean.CodeBean;

public interface CodeMapper {

	 /**
	  * 得到code的列表
	  */
	public List<CodeBean> getCodeList();
	
	/**
	 * 通过num得到Bean
	 */
	public CodeBean getByNum(String code_num);
}
