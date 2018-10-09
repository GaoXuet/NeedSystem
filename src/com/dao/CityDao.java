package com.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bean.CityBean;
import com.mapper.CityMapper;

public class CityDao {

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
	
//	通过city(id)获取cityBean对象
	public CityBean getCityById(int id) throws Exception{
		setUp();
		SqlSession openSession = factory.openSession();
		CityMapper mapper = openSession.getMapper(CityMapper.class);

		CityBean cityBean = mapper.getCityById(id);

		return cityBean;
	}
	
	
	
	public List<CityBean> getCityList(int provinceId) throws Exception{
		setUp();
		SqlSession openSession = factory.openSession();
		CityMapper mapper = openSession.getMapper(CityMapper.class);

		List<CityBean> list = mapper.getCityList(provinceId);

		return list;
	}
	
	
}
