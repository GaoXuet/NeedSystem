package com.mapper;
import java.util.List;
import com.bean.DemandBean;
public interface DemandMapper {

	/*
	 * 获取数据表中数据总量
	 */
	public int getCount();

	/*
	 * 判断需求名称是否存在
	 */
	public DemandBean getByName(String JSXQMC);

	/*
	 * 添加需求
	 */
	public int saveDemand(DemandBean demandBean);

	/*
	 * 更新审核的状态
	 */
	public int updateSFSH(DemandBean demandBean);

	/**
	 * 以列表形式显示未审核的需求信息
	 */
	public List<DemandBean> getListNo();

	/**
	 * 根据id查看详细信息
	 */
	public DemandBean getById(String WJID);

	/**
	 * 以列表形式显示,用户已提交的问卷
	 */
	public List<DemandBean> getMyList(String username);

	/**
	 * 带条件的搜索,通过name
	 */
	public List<DemandBean> getByLikeName(String JSXQMC);

	/**
	 * 以列表形式显示
	 */
	public List<DemandBean> getList();

	/**
	 * 获取分页数据
	 */
	public List<DemandBean> getListPage(int start, int size);

	/**
	 * 显示基础研究的集合
	 */
	public List<String> getTypeList();

	/**
	 * 显示学科分类第一级
	 */
	public List<String> getXKFLListA();

	/**
	 * 显示学科分类第二级
	 */
	public List<String> getXKFLListB(String type);

	/**
	 * 显示学科分类第三级
	 */
	public List<String> getXKFLListC(String type);

	/**
	 * 显示国明经济行业第一级
	 */
	public List<String> getXQJSYYHYListA();

	/**
	 * 显示国民经济行业第二级
	 */
	public List<String> getXQJSYYHYListB(String type);

	/**
	 * 显示国民经济行业第三级
	 */
	public List<String> getXQJSYYHYListC(String type);

	/**
	 * 获取n页的数据
	 */
	public List<DemandBean> getListNext(String next);

	public List<DemandBean> getListAX(String next);

	public List<DemandBean> getListBX(String next, String parent);

	public List<DemandBean> getListCX(String next, String parent);

	public List<DemandBean> getListAH(String next);

	public List<DemandBean> getListBH(String next, String parent);

	public List<DemandBean> getListCH(String next, String parent);

	/**
	 * 未审核的需求数目
	 */
	public int getWeishenhe();

	/**
	 * 已审核的需求数目
	 */
	public int getShenhe();

	/**
	 * 已通过的需求数目
	 */
	public int getTongguo();

	/**
	 * 已退回的需求数目
	 */
	public int getTuihui();

	/**
	 * 综合检索
	 */

	public List<DemandBean> xdshPolicy(String num, String sType0, String q0, String logic1, String sType1, String q1,
			String logic2, String sType2, String q2);
}
