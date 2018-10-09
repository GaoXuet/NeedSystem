package com.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;

import com.dao.CodeDao;
import com.dao.ProvinceDao;
import com.bean.AdminBean;
import com.bean.CodeBean;
import com.bean.ProvinceBean;
import com.dao.AdminDao;

/**
 * 基于注解的控制器
 * 
 * @author a
 *
 */

@Controller
@RequestMapping(value = "/AdminController")
public class AdminController {

	// spring应用，工厂方法，bean类改造
	// 只要用到bean即...
	// value属性表明URL映射到哪个处理方法
	// method属性定义了 service 方法来处理 HTTP POST/GET 请求

	/**
	 * 所有用户的登录login
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest req, HttpServletResponse resp, ModelMap model) throws Exception {

		String username = req.getParameter("username");
		String password = req.getParameter("password");
		System.out.println("用户名：" + username + " ，  密码：" + password);

		AdminBean admin = new AdminBean();
		// context.getBean("admin", AdminBean.class);// 用到Spring工厂方法
		AdminDao adminDao = new AdminDao();
		int status = 0;// 密码是否正确
		String url = "";

		boolean flag = adminDao.checkReg(username);
		System.out.println("controller中检查结果为：" + flag);
		if (!flag) {// 登录失败，username不存在
			status = 1;// 用户名不存在
			url = "login";
			model.addAttribute("status", status);
		} else {
			// username存在
			admin = adminDao.userLogin(username, password);
			if (admin != null) {// 密码正确
				System.out.println("密码正确！");
				if (admin.getStatus() == 0) {// 如果是管理员
					url = "redirect:/first/index.jsp";// 重定向
					// model.addAttribute("username", username);
					req.getSession().setAttribute("admin", admin);
				} else {// 如果非管理员
					url = "/index";
					req.getSession().setAttribute("admin", admin);
					// req.setAttribute("admin", admin);
					// model.addAttribute("admin", admin);
				}

			} else {// 密码错误
				System.out.println("密码错误！");
				status = 2;
				url = "login";
				model.addAttribute("status", status);
			}
		}
		// System.out.println("跳转路径：" + url);
		return url;
	}

	/*------------------------------------------个人中心------------------------------------------------------------*/

	/**
	 * 注册
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	private String register(HttpServletRequest req, HttpServletResponse resp, ModelMap model) throws Exception {
		req.setCharacterEncoding("utf-8");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String code = req.getParameter("code");
		String name = req.getParameter("name");
		String id_number = req.getParameter("id_number");
		String sex = req.getParameter("sex");
		int provinceId = Integer.parseInt(req.getParameter("ProvinceId"));
		int cityId = Integer.parseInt(req.getParameter("CityId"));
		String unit = req.getParameter("unit");
		String direction = req.getParameter("direction");
		String industry = req.getParameter("industry");
		String levels = req.getParameter("levels");
		String title = req.getParameter("title");
		String address = req.getParameter("address");
		String postal = req.getParameter("postal");
		String phone = req.getParameter("phone");
		String telephone = req.getParameter("telephone");
		String email = req.getParameter("email");
		String qq = req.getParameter("qq");
		String msn = req.getParameter("msn");

		AdminBean adminBean = new AdminBean();
		AdminDao adminDao = new AdminDao();

		adminBean.setUsername(username);
		adminBean.setPassword(password);
		adminBean.setCode(code);
		adminBean.setName(name);
		adminBean.setId_number(id_number);
		adminBean.setSex(sex);
		adminBean.setProvinceId(provinceId);
		adminBean.setCityId(cityId);
		adminBean.setUnit(unit);
		adminBean.setDirection(direction);
		adminBean.setIndustry(industry);
		adminBean.setLevels(levels);
		adminBean.setTitle(title);
		adminBean.setAddress(address);
		adminBean.setPostal(postal);
		adminBean.setPhone(phone);
		adminBean.setTelephone(telephone);
		adminBean.setEmail(email);
		adminBean.setQq(qq);
		adminBean.setMsn(msn);

		String url = "add";
		int status = 0;
		boolean flag = adminDao.checkReg(username);
		if (flag) {// 不存在，注册成功
			adminDao.insertUser(adminBean);
			// resp.sendRedirect("add.jsp?status=0");
			status = 0;
		} else {// 存在，注册失败
			// resp.sendRedirect("add.jsp?status=1");
			status = 1;
		}

		model.addAttribute("status", status);
		return url;
	}

	/**
	 * 修改密码
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateP/{username}_{password}", method = RequestMethod.POST)
	private String updateP(@PathVariable("username") String username, @PathVariable("password") String password,
			ModelMap model, HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("utf-8");
		System.out.println("1:" + username + password);
		String p1 = req.getParameter("P1");
		String p2 = req.getParameter("P2");

		int status = 0;

		if (!p1.equals(password)) {
			status = 0;
			// resp.sendRedirect(req.getContextPath() +
			// "/my/myPass.jsp?status=0");
		} else {
			AdminDao adminDao = new AdminDao();
			boolean flag = adminDao.updatePsw(username, p2);

			if (flag) {
				// 修改成功
				status = 1;
				// resp.sendRedirect(req.getContextPath() +
				// "/my/myPass.jsp?status=1");
			} else {
				// 修改失败
				status = 2;
				// resp.sendRedirect(req.getContextPath() +
				// "/my/myPass.jsp?status=2");
			}

		}
		model.addAttribute("status", status);
		return "/my/myPass";
	}

	/**
	 * 修改基本信息之前
	 * 
	 * @param req
	 * @param resp
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateBefore/{username}", method = RequestMethod.GET)
	private String updateBefore(@PathVariable("username") String username, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		AdminDao adminDao = new AdminDao();
		System.out.println("得到：" + username);
		AdminBean adminBean = adminDao.getByUsername(username);
		// 显示省份的LIST
		ProvinceDao provinceDao = new ProvinceDao();
		List<ProvinceBean> provinceBeans = provinceDao.getProvinceList();
		// 找到机构代码的名称
		CodeDao codeDao = new CodeDao();
		List<CodeBean> codeBeans = codeDao.getCodeList();

		req.setAttribute("provinceBeans", provinceBeans);
		req.setAttribute("adminBean", adminBean);
		// req.getSession().setAttribute("provinceBeans", provinceBeans);
		// req.getSession().setAttribute("adminBean", adminBean);
		// req.getRequestDispatcher("/my/myInfo.jsp").forward(req, resp);
		return "/my/myInfo";
	}

	/**
	 * 修改基本信息
	 * 
	 * @throws IOException
	 */
	@RequestMapping(value = "/update/{username}", method = RequestMethod.POST)
	private String update(@PathVariable("username") String username, HttpServletRequest req, HttpServletResponse resp,
			ModelMap model) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		boolean flag = true;
		int status = 0;
		try {
			String code = req.getParameter("code");
			String name = req.getParameter("name");
			String id_number = req.getParameter("id_number");
			String sex = req.getParameter("sex");
			int provinceId = Integer.parseInt(req.getParameter("ProvinceId"));
			// int cityId = Integer.parseInt(req.getParameter("CityId"));
			int cityId = 1;
			String unit = req.getParameter("unit");
			String direction = req.getParameter("direction");
			String industry = req.getParameter("industry");
			String levels = req.getParameter("levels");
			String title = req.getParameter("title");
			String address = req.getParameter("address");
			String postal = req.getParameter("postal");
			String phone = req.getParameter("phone");
			String telephone = req.getParameter("telephone");
			String email = req.getParameter("email");
			String qq = req.getParameter("qq");
			String msn = req.getParameter("msn");

			AdminBean adminBean = new AdminBean();
			AdminDao adminDao = new AdminDao();

			adminBean.setUsername(username);
			adminBean.setCode(code);
			adminBean.setName(name);
			adminBean.setId_number(id_number);
			adminBean.setSex(sex);
			adminBean.setProvinceId(provinceId);
			adminBean.setCityId(cityId);
			adminBean.setUnit(unit);
			adminBean.setDirection(direction);
			adminBean.setIndustry(industry);
			adminBean.setLevels(levels);
			adminBean.setTitle(title);
			adminBean.setAddress(address);
			adminBean.setPostal(postal);
			adminBean.setPhone(phone);
			adminBean.setTelephone(telephone);
			adminBean.setEmail(email);
			adminBean.setQq(qq);
			adminBean.setMsn(msn);

			flag = adminDao.updateX(adminBean);

		} catch (Exception e) {// 捕获错误
			// resp.sendRedirect("my/myInfo.jsp?status=2");
			status = 2;
			e.printStackTrace();
		} finally {
			if (flag) {// 更新成功
				// resp.sendRedirect("my/myInfo.jsp?status=0");
				status = 0;
			} else {// 更新失败
				// resp.sendRedirect("my/myInfo.jsp?status=1");
				status = 1;
			}

		}
		model.addAttribute("status", status);
		return "/my/myInfo";
	}

	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/end", method = RequestMethod.GET)
	private String end(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		// 用户登录之后,servlet用request.getSession()的形式保存了用户的登录信息
		// 然后使用request.getSession().invalidate()来注销用户信息
		req.getSession().invalidate();

		// 至此，用户已完全退出登录——信息都注销了，此时我们跳转回到登录页面
		// resp.sendRedirect(req.getContextPath() + "/login.jsp");
		return "redirect:/login.jsp";
	}

	/**
	 * 显示省份等三级菜单列表
	 * 
	 * @param req
	 * @param resp
	 * @throws Exception 
	 */
	@RequestMapping(value = "/ProvinceView", method = RequestMethod.GET)
	private String ProvinceView(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// 显示省份的LIST
		ProvinceDao provinceDao = new ProvinceDao();
		List<ProvinceBean> provinceBeans = provinceDao.getProvinceList();
		// 找到机构代码的名称
		CodeDao codeDao = new CodeDao();
		List<CodeBean> codeBeans = codeDao.getCodeList();

		// req.setAttribute("provinceBeans", provinceBeans);
		// req.setAttribute("codeBeans", codeBeans);
		req.getSession().setAttribute("provinceBeans", provinceBeans);
		req.getSession().setAttribute("codeBeans", codeBeans);
		// req.getRequestDispatcher("/add.jsp").forward(req, resp);

		return "add";
	}

	/*------------------------------------------权限管理------------------------------------------------------------*/

	/**
	 * 权限管理之前的用户列表
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/fenpeiBefore", method = RequestMethod.GET)
	private String fenpeiBefore(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		AdminDao adminDao = new AdminDao();
		List<AdminBean> adminBeans = adminDao.getByStatus();

		// req.setAttribute("adminBeans", adminBeans);
		req.getSession().setAttribute("adminBeans", adminBeans);
		// req.getRequestDispatcher("first/fenpei.jsp").forward(req, resp);

		return "/first/fenpei";

	}

	/**
	 * 赋予角色
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/addSFSH/{username}", method = RequestMethod.POST)
	private String addSFSH(@PathVariable("username") String username, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.setCharacterEncoding("utf-8");
		int status = Integer.parseInt(req.getParameter("status"));
		System.out.println("username:" + username + "    status:" + status);
		AdminDao adminDao = new AdminDao();

		boolean f = adminDao.up(username, status);

		List<AdminBean> adminBeans = adminDao.getUserList();

		// fenpeiBefore(req, resp);
		// 重定向到另一个
		// return "redirct:fenpeiBefore.action";

		return fenpeiBefore(req, resp);

	}

	/*------------------------------------------用户管理------------------------------------------------------------*/

	/**
	 * 用户管理 之用户列表
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	private String userList(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		AdminDao adminDao = new AdminDao();
		List<AdminBean> adminBeans = adminDao.getByStatusB();

		// req.setAttribute("adminBeans", adminBeans);
		req.getSession().setAttribute("adminBeans", adminBeans);

		// req.getRequestDispatcher("first/userList.jsp").forward(req, resp);

		return "/first/userList";
	}

	/**
	 * 用户管理 之重置密码
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/updatePassword/{username}", method = RequestMethod.POST)
	private String updatePassword(@PathVariable("username") String username, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		AdminDao adminDao = new AdminDao();
		String password = req.getParameter("password");
		adminDao.updatePsw(username, password);

		return userList(req, resp);
	}

	/******************************************************* 还未改完的部分 ****************************************************************/

	/*
	 * 
	 * private void get(HttpServletRequest req, HttpServletResponse resp) throws
	 * IOException, ServletException { req.setCharacterEncoding("utf-8");
	 * resp.setCharacterEncoding("utf-8");
	 * 
	 * String username = req.getParameter("id"); AdminDao adminDao = new
	 * AdminDao(); Admin adminBean = adminDao.getByUsername(username);
	 * 
	 * PrintWriter out = resp.getWriter();
	 * out.print(JSON.toJSONString(adminBean)); out.flush(); out.close(); }
	 */

	/**
	 * 用户管理 之注销用户
	 */
	/*
	 * private void delete(HttpServletRequest req, HttpServletResponse resp)
	 * throws IOException, ServletException { req.setCharacterEncoding("utf-8");
	 * AdminDao adminDao = new AdminDao(); String username =
	 * req.getParameter("username"); adminDao.delete(username); userList(req,
	 * resp);
	 * 
	 * }
	 */

}
