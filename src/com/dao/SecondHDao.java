package com.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bean.SecondHBean;
import com.mapper.FirstHMapper;

public class SecondHDao {
	
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
	
	public List<SecondHBean> getSecondList(int parentId) throws Exception{
		setUp();
		SqlSession openSession = factory.openSession();
		FirstHMapper mapper = openSession.getMapper(FirstHMapper.class);

		List<SecondHBean> list = mapper.getSecondList(parentId);

		return list;
	}
}
