package com.mapper;

import java.util.List;

import com.bean.FirstXBean;
import com.bean.SecondXBean;
import com.bean.ThirdXBean;

public interface FirstXMapper {
	public List<FirstXBean> getFirstList();

	public List<SecondXBean> getSecondList(int parentId);
	
	public List<ThirdXBean> getThirdList(int parentId);
}
