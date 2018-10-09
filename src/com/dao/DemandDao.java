package com.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.bean.DemandBean;
import com.bean.Tongjibean;
import com.mapper.DemandMapper;

public class DemandDao {

	private SqlSessionFactory factory;

	/*
	 * 获取数据表中数据总量
	 */

	public void setUp() throws Exception {
		String resource = "SqlMapConfig.xml";
		// 通过流将核心配置文件读取进来
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// 通过核心配置文件输入流来创建会话工厂
		factory = new SqlSessionFactoryBuilder().build(inputStream);
	}

	public int getCount() throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		return mapper.getCount();
	}

	/**
	 * 判断需求名称是否存在
	 * 
	 * @throws Exception
	 */
	@SuppressWarnings("finally")
	public boolean checkName(String JSXQMC) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		DemandBean demandBean = new DemandBean();

		try {
			demandBean = mapper.getByName(JSXQMC);
			if (demandBean == null) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			openSession.close();
			return false;
		}

	}

	/*
	 * 添加需求
	 */
	public void saveDemand(DemandBean demandBean) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		int n = mapper.saveDemand(demandBean);
		openSession.commit();
	}

	/*
	 * 更新审核的状态
	 */
	public boolean updateSFSH(String WJID, int SFSH, String V) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		DemandBean demandBean = new DemandBean();
		demandBean.setWJID(WJID);
		demandBean.setSFSH(SFSH);
		demandBean.setV(V);

		int n = mapper.updateSFSH(demandBean);
		openSession.commit();

		if (n > 0)
			return true;
		return false;
	}

	// 获取每一个分页的数据
	public List<DemandBean> getListByPage(int start, int size) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<DemandBean> list = mapper.getListPage(start, size);

		openSession.close();
		return list;
	}

	/**
	 * 根据需求状态 获取数目
	 */
	public Tongjibean tongji() throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		Tongjibean tongjibean = new Tongjibean();
		tongjibean.setWeishenhe(mapper.getWeishenhe());
		tongjibean.setShenhe(mapper.getShenhe());
		tongjibean.setTongguo(mapper.getTongguo());
		tongjibean.setTuihui(mapper.getTuihui());

		openSession.close();
		return tongjibean;
	}

	// 去掉分页
	public List<DemandBean> xdshPolicy(String num, String sType0, String q0, String logic1, String sType1,
			String q1, String logic2, String sType2, String q2) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<DemandBean> list = mapper.xdshPolicy(num, sType0, q0, logic1, sType1, q1, logic2, sType2, q2);

		openSession.close();
		return list;
	}

	/**
	 * 显示基础研究，，，，集合
	 * 
	 * @throws Exception
	 */
	public List<String> getTypeList() throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<String> list = mapper.getTypeList();

		openSession.close();
		return list;
	}

	/* 显示学科分类第一级 */
	public List<String> getXKFLListA() throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<String> list = mapper.getXKFLListA();

		openSession.close();
		return list;
	}

	/* 显示学科分类第二级 */
	public List<String> getXKFLListB(String type) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<String> list = mapper.getXKFLListB(type);

		openSession.close();
		return list;
	}

	/* 显示学科分类第三级 */
	public List<String> getXKFLListC(String type) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<String> list = mapper.getXKFLListC(type);

		openSession.close();
		return list;
	}

	/*
	 * 检测字符串中第几个位置的字符 public String getSP(String str,int n){ String A="";
	 * String[] split=str.split("\\,"); A=split[n]; return A; String
	 * address="上海:上海市:闵行区:吴中路"; String[] splitAddress=address.split("\\:");
	 * System.out.println(splitAddress[0]+splitAddress[1]+splitAddress[2]+
	 * splitAddress[3]); }
	 * 
	 * 数组的个数 public int getStr(String a){ int num=0; String[]
	 * split=a.split("\\,"); num=split.length; return num; }
	 */

	/* 显示国民经济行业第一级 */
	public List<String> getXQJSYYHYListA() throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<String> list = mapper.getXQJSYYHYListA();

		openSession.close();
		return list;
	}

	/* 显示国民经济分类第二级 */
	public List<String> getXQJSYYHYListB(String type) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<String> list = mapper.getXQJSYYHYListB(type);

		openSession.close();
		return list;
	}

	/* 显示国民经济行业分类第三级 */
	public List<String> getXQJSYYHYListC(String type) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<String> list = mapper.getXQJSYYHYListC(type);

		openSession.close();
		return list;
	}

	public List<DemandBean> getListNext(String next) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<DemandBean> list = mapper.getListNext(next);

		openSession.close();
		return list;
	}

	public List<DemandBean> getListAX(String next) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<DemandBean> list = mapper.getListAX(next);

		openSession.close();
		return list;
	}

	public List<DemandBean> getListBX(String next, String parent) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<DemandBean> list = mapper.getListBX(next, parent);

		openSession.close();
		return list;
	}

	public List<DemandBean> getListCX(String next, String parent) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<DemandBean> list = mapper.getListCX(next, parent);

		openSession.close();
		return list;
	}

	public List<DemandBean> getListAH(String next) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<DemandBean> list = mapper.getListAH(next);

		openSession.close();
		return list;
	}

	public List<DemandBean> getListBH(String next, String parent) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<DemandBean> list = mapper.getListBH(next, parent);

		openSession.close();
		return list;
	}

	public List<DemandBean> getListCH(String next, String parent) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<DemandBean> list = mapper.getListCH(next, parent);

		openSession.close();
		return list;
	}

	/**
	 * 以列表形式显示
	 * 
	 * @throws Exception
	 */
	public List<DemandBean> getList() throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<DemandBean> list = mapper.getList();

		return list;
	}

	/**
	 * 以列表形式显示,用户已提交的问卷
	 * 
	 * @throws Exception
	 */
	public List<DemandBean> getMyList(String username) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<DemandBean> list = mapper.getMyList(username);

		return list;
	}

	/**
	 * 带条件的搜索,通过name
	 */
	public List<DemandBean> getByName(String JSXQMC) {
		try {
			setUp();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<DemandBean> list = mapper.getByLikeName(JSXQMC);

		return list;
	}

	/**
	 * 根据id查看详细信息
	 * 
	 * @throws Exception
	 */
	public DemandBean getById(String WJID) throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		DemandBean demandBean = new DemandBean();
		demandBean = mapper.getById(WJID);

		return demandBean;
	}

	/**
	 * 以列表形式显示未审核的需求信息
	 * 
	 * @throws Exception
	 */
	public List<DemandBean> getListNo() throws Exception {
		setUp();
		SqlSession openSession = factory.openSession();
		DemandMapper mapper = openSession.getMapper(DemandMapper.class);

		List<DemandBean> list = mapper.getListNo();

		return list;
	}

}
