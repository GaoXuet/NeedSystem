package com.mapper;

import java.util.List;

import com.bean.FirstHBean;
import com.bean.SecondHBean;
import com.bean.ThirdHBean;

public interface FirstHMapper {
	public List<FirstHBean> getFirstList();
	
	public List<SecondHBean> getSecondList(int parentId);
	
	public List<ThirdHBean> getThirdList(int parentId);
}
