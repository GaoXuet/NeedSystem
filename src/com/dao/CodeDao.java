package com.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bean.CodeBean;
import com.mapper.CodeMapper;

public class CodeDao {

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
	
	 /**
	  * 得到code的列表
	 * @throws Exception 
	  */
	public List<CodeBean> getCodeList() throws Exception{
		setUp();
		SqlSession openSession = factory.openSession();
		CodeMapper mapper = openSession.getMapper(CodeMapper.class);

		List<CodeBean> list = mapper.getCodeList();

		return list;
	}
	
	
	/**
	 * 通过num得到Bean
	 * @throws Exception 
	 */
	public CodeBean getByNum(String code_num) throws Exception{
		setUp();
		SqlSession openSession = factory.openSession();
		CodeMapper mapper = openSession.getMapper(CodeMapper.class);

		CodeBean codeBean = mapper.getByNum(code_num);

		return codeBean;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
