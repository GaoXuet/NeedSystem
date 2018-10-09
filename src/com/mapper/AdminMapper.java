package com.mapper;
import java.util.List;
import com.bean.AdminBean;
public interface AdminMapper {

	/**
	 * 添加用户到数据库
	 */
	public int insertUser(AdminBean adminBean);
	
	/*
	 * 登录验证
	 */
	public AdminBean userLogin(AdminBean adminBean);
	
	/*
	 * 检查该用户名是否已存在 返回用户
	 */
	public AdminBean checkReg(String username);
	
	/*
	 * 获取用户信息列表
	 * =3
	 */
	public List<AdminBean> getByStatus();
	
	/*
	 * 获取用户信息列表
	 * !=3
	 */
	public List<AdminBean> getByStatusB();
	
	/*
	 * 获取用户信息列表
	 * 总的
	 */
	public List<AdminBean> getUserList();
	
	/*
	 * 更新信息
	 */
	public int updateX(AdminBean adminBean);
	
	/*
	 * 修改密码
	 */
	public int updatePsw(AdminBean adminBean);
	
	/**
	 * 删除 注销 用户
	 */
	public int deleteUser(String username);
	
	/**
	 * 权限管理
	 */
	public int up(AdminBean adminBean);
	
	/**
	 * 通过username得到Bean
	 */
	public AdminBean getByUsername(String username);
	
}
