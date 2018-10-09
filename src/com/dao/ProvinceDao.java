package com.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bean.ProvinceBean;
import com.mapper.ProvinceMapper;

public class ProvinceDao {

	private SqlSessionFactory factory;

	// 作用:在测试方法前执行这个方法
	// @Before
	public void setUp() throws Exception {
		String resource = "SqlMapConfig.xml";
		// 通过流将核心配置文件读取进来
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// 通过核心配置文件输入流来创建会话工厂
		factory = new SqlSessionFactoryBuilder().build(inputStream);
	}

	// 通过province(id)获取provinceBean对象
	public ProvinceBean getProvinceById(int id) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		ProvinceMapper mapper = openSession.getMapper(ProvinceMapper.class);

		ProvinceBean pBean = mapper.getProvinceById(id);

		return pBean;
	}

	/**
	 * 获取ProvinceBeans,LIST
	 * @throws Exception 
	 */
	public List<ProvinceBean> getProvinceList() throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		ProvinceMapper mapper = openSession.getMapper(ProvinceMapper.class);

		List<ProvinceBean> list = mapper.getProvinceList();

		return list;
	}
}
