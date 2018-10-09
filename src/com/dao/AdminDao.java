package com.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.bean.AdminBean;
import com.mapper.AdminMapper;

public class AdminDao extends SqlSessionDaoSupport {


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
	 * 添加用户到数据库中
	 */
	public void insertUser(AdminBean adminBean) throws Exception {
		// 创建能执行映射文件中sql的sqlSession
		setUp();
		SqlSession openSession = factory.openSession();
		AdminMapper mapper = openSession.getMapper(AdminMapper.class);

		mapper.insertUser(adminBean);
		openSession.commit();
	}

	/**
	 * 权限管理
	 * 
	 * @throws Exception
	 */
	public boolean up(String username, int status) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		AdminMapper mapper = openSession.getMapper(AdminMapper.class);

		AdminBean adminBean = new AdminBean();
		adminBean.setUsername(username);
		adminBean.setStatus(status);

		int n = mapper.up(adminBean);
		openSession.commit();

		if (n > 0)
			return true;
		return false;

	}

	/**
	 * 获取用户信息列表 =3
	 * 
	 * @throws Exception
	 */
	public List<AdminBean> getByStatus() throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		AdminMapper mapper = openSession.getMapper(AdminMapper.class);

		List<AdminBean> list = mapper.getByStatus();

		return list;
	}

	/**
	 * 获取用户信息列表 不为3
	 * 
	 * @throws Exception
	 */
	public List<AdminBean> getByStatusB() throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		AdminMapper mapper = openSession.getMapper(AdminMapper.class);

		List<AdminBean> list = mapper.getByStatusB();

		return list;
	}

	/**
	 * 获取用户信息列表 总的
	 * 
	 * @throws Exception
	 */
	public List<AdminBean> getUserList() throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		AdminMapper mapper = openSession.getMapper(AdminMapper.class);

		List<AdminBean> list = mapper.getUserList();

		return list;
	}

	/**
	 * 更新基本信息
	 * 
	 */
	public boolean updateX(AdminBean adminBean) throws Exception {

		setUp();
		SqlSession openSession = factory.openSession();
		AdminMapper mapper = openSession.getMapper(AdminMapper.class);

		int n = mapper.updateX(adminBean);
		openSession.commit();

		if (n > 0)
			return true;
		return false;
	}

	/**
	 * 检测该用户名是否存在
	 */
	public boolean checkReg(String username) throws Exception {
		System.out.println("调用checkReg!");
		setUp();
		SqlSession openSession = factory.openSession();
		AdminMapper mapper = openSession.getMapper(AdminMapper.class);

		AdminBean user = new AdminBean();
		user = mapper.checkReg(username);
		if (user == null)
			return false;

		System.out.println("是否检查到名字:" + user.getUsername());
		return true;
	}

	/**
	 * 判断是否被分配角色
	 */
	public int checkF(String username) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		AdminMapper mapper = openSession.getMapper(AdminMapper.class);

		AdminBean user = mapper.getByUsername(username);

		return user.getStatus();
	}

	/**
	 * 登录验证
	 * 
	 * @throws Exception
	 */
	public AdminBean userLogin(String username, String password) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		AdminMapper mapper = openSession.getMapper(AdminMapper.class);

		AdminBean user = new AdminBean();
		user.setUsername(username);
		user.setPassword(password);

		AdminBean admin = mapper.userLogin(user);
		System.out.println("名字为：" + admin.getName());
		return admin;
	}

	/**
	 * 通过username得到Bean
	 * 
	 * @throws Exception
	 */
	public AdminBean getByUsername(String username) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		AdminMapper mapper = openSession.getMapper(AdminMapper.class);

		AdminBean user = mapper.getByUsername(username);

		return user;
	}

	/**
	 * 修改密码
	 * 
	 * @throws Exception
	 */
	public boolean updatePsw(String username, String password) throws Exception {

		setUp();
		SqlSession openSession = factory.openSession();
		AdminMapper mapper = openSession.getMapper(AdminMapper.class);

		AdminBean adminBean = new AdminBean();
		adminBean.setUsername(username);
		adminBean.setPassword(password);

		int n = mapper.updatePsw(adminBean);
		openSession.commit();

		if (n > 0)
			return true;
		return false;
	}

	/**
	 * 删除 注销 用户
	 * 
	 * @throws Exception
	 */
	public boolean deleteUser(String username) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		AdminMapper mapper = openSession.getMapper(AdminMapper.class);

		int n = mapper.deleteUser(username);
		openSession.commit();

		if (n > 0)
			return true;
		return false;
	}

}
