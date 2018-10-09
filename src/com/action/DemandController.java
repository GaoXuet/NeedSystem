package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.action.Paging;
import com.alibaba.fastjson.JSON;
import com.bean.AdminBean;
import com.bean.CodeBean;
import com.bean.DemandBean;
import com.bean.FirstHBean;
import com.bean.FirstXBean;
import com.bean.Tongjibean;
import com.dao.AdminDao;
import com.dao.CodeDao;
import com.dao.DemandDao;
import com.dao.FirstHDao;
import com.dao.FirstXDao;
import com.util.Constants;
import com.util.StringUtil;

@Controller
@RequestMapping(value = "/DemandController")
public class DemandController {

	// private static ApplicationContext context = new
	// ClassPathXmlApplicationContext("bean.xml");

	/*
	 * else if ("list_type".equals(method)) { list_type(req, resp); } else if
	 * ("listFen".equals(method)) { listFen(req, resp); } else if
	 * ("selectList".equals(method)) { selectList(req, resp); }
	 */

	/*------------------------------------------填报需求------------------------------------------------------------*/

	/**
	 * 添加需求时的初始页面
	 */
	@RequestMapping(value = "/info/{username}", method = RequestMethod.GET)
	private String info(@PathVariable("username") String username, HttpServletRequest req, HttpServletResponse resp,
			ModelMap model) throws Exception {
		req.setCharacterEncoding("utf-8");
		// String url="login";
		System.out.println("传参：用户名：" + username);
		AdminBean adminBean = new AdminBean();// 用到Spring工厂方法
		AdminDao adminDao = new AdminDao();
		adminBean = adminDao.getByUsername(username);

		try {
			CodeBean codeBean = new CodeBean();
			// context.getBean("code", Code.class);// 用到Spring工厂方法
			CodeDao codeDao = new CodeDao();
			codeBean = codeDao.getByNum(adminBean.getCode());
			String code_name = codeBean.getCode_name();

			DemandBean demandBean = new DemandBean();
			// context.getBean("demand", Demand.class);// 用到Spring工厂方法
			demandBean.setJGMC(code_name);
			demandBean.setYZBM(adminBean.getPostal());
			demandBean.setTXDZ(adminBean.getAddress());
			// 需求编号，自动生成
			Date currentTime = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String WJID = formatter.format(currentTime);
			demandBean.setWJID(WJID);

			// 搜出一级学科分类
			FirstXDao firstXDao = new FirstXDao();
			List<FirstXBean> firstXBeans = firstXDao.getFirstList();

			// 搜出一级国民经济分类
			FirstHDao firstHDao = new FirstHDao();
			List<FirstHBean> firstHBeans = firstHDao.getFirstList();

			req.getSession().setAttribute("demandBean", demandBean);
			req.getSession().setAttribute("firstXBeans", firstXBeans);
			req.getSession().setAttribute("firstHBeans", firstHBeans);
			// model.addAttribute("demandBean", demandBean);
			// req.setAttribute("firstXBeans", firstXBeans);
			// req.setAttribute("firstHBeans", firstHBeans);

			// req.getRequestDispatcher("my/addInfo.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/my/addInfo.jsp";
	}

	/**
	 * 提交技术需求表，0代表审核未通过，1代表已审核通过
	 */
	@RequestMapping(value = "/addInfo/{username}", method = RequestMethod.POST)
	private String addInfo(@PathVariable("username") String username, HttpServletRequest req, HttpServletResponse resp,
			ModelMap model) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		int status = 0;
		try {
			System.out.println("用户名username:" + username);
			String WJID = req.getParameter("WJID");
			// int SFSH=Integer.parseInt(req.getParameter("SFSH"));
			// //0表示未通过，1表示通过，缺省取值为0
			String JGMC = req.getParameter("JGMC");
			String GLBM = req.getParameter("GLBM");
			String TXDZ = req.getParameter("TXDZ");
			String SZDY = req.getParameter("SZDY");
			String DWWZ = req.getParameter("DWWZ");
			String DZYX = req.getParameter("DZYX");
			String FRDB = req.getParameter("FRDB");
			String YZBM = req.getParameter("YZBM");
			String LXR = req.getParameter("LXR");
			String GDDH = req.getParameter("GDDH");
			String YDDH = req.getParameter("YDDH");
			String CZ = req.getParameter("CZ");
			String JGSX = req.getParameter("JGSX");
			String JGJJ = req.getParameter("JGJJ");
			String JSXQMC = req.getParameter("JSXQMC");
			int QSXQNF = Integer.parseInt(req.getParameter("QSXQNF"));
			int JZXQNF = Integer.parseInt(req.getParameter("JZXQNF"));
			String ZDKJXQGS1 = "1、主要问题：<p>" + req.getParameter("ZDKJXQGS1");
			String ZDKJXQGS2 = "<p>2、技术关键:<p>" + req.getParameter("ZDKJXQGS2");
			String ZDKJXQGS3 = "<p>3、预期目标:<p>" + req.getParameter("ZDKJXQGS3");
			String ZDKJXQGS = ZDKJXQGS1 + ZDKJXQGS2 + ZDKJXQGS3;
			/**
			 * 多个文本框
			 */
			String GJZ = "";
			String GJZ1 = req.getParameter("GJZ1");
			String GJZ2 = req.getParameter("GJZ2");
			String GJZ3 = req.getParameter("GJZ3");
			String GJZ4 = req.getParameter("GJZ4");
			String GJZ5 = req.getParameter("GJZ5");

			GJZ = GJZ1 + GJZ2 + GJZ3 + GJZ4 + GJZ5;

			String NTR = req.getParameter("NTR");

			/**
			 * 技术需求合作模式，单选框
			 */
			String JSXQHZMS = req.getParameter("JSXQHZMS");
			String HZYXDW = req.getParameter("HZYXDW");

			String YJLX = req.getParameter("YJLX");

			/**
			 * 学科分类
			 */
			String XKFL1 = req.getParameter("FirstXId");
			String XKFL2 = req.getParameter("SecondXId");
			String XKFL3 = req.getParameter("ThirdXId");

			/**
			 * 需求技术所属领域，复选框
			 */
			String[] fiel = req.getParameterValues("XQJSSSLY");

			String XQJSSSLY = "";
			if (fiel != null) {
				for (int j = 0; j < fiel.length; j++) {
					XQJSSSLY += "," + fiel[j];
				}
			}
			// System.out.println("需求技术所属领域XQJSSSLY:" + XQJSSSLY);

			String QTJSMS = req.getParameter("QTJSMS");

			/**
			 * 国民经济行业分类
			 */
			String XQJSYYHY = "";
			String XQJSYYHY1 = req.getParameter("FirstHId");
			String XQJSYYHY2 = req.getParameter("SecondHId");
			String XQJSYYHY3 = req.getParameter("ThirdHId");

			SimpleDateFormat createDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");

			DemandBean demandBean = new DemandBean();
			// context.getBean("demand", DemandBean.class);// 用到Spring工厂方法
			DemandDao demandDao = new DemandDao();

			demandBean.setWJID(WJID);
			demandBean.setUsername(username);
			demandBean.setJGMC(JGMC);
			demandBean.setGLBM(GLBM);
			demandBean.setTXDZ(TXDZ);
			demandBean.setSZDY(SZDY);
			demandBean.setDWWZ(DWWZ);
			demandBean.setDZYX(DZYX);
			demandBean.setFRDB(FRDB);
			demandBean.setYZBM(YZBM);
			demandBean.setLXR(LXR);
			demandBean.setGDDH(GDDH);
			demandBean.setYDDH(YDDH);
			demandBean.setCZ(CZ);
			demandBean.setJGSX(JGSX);
			demandBean.setJGJJ(JGJJ);
			demandBean.setJSXQMC(JSXQMC);
			demandBean.setQSXQNF(QSXQNF);
			demandBean.setJZXQNF(JZXQNF);
			demandBean.setZDKJXQGS(ZDKJXQGS);
			demandBean.setGJZ(GJZ);
			demandBean.setNTR(NTR);
			demandBean.setYJLX(YJLX);
			demandBean.setXKFL1(XKFL1);
			demandBean.setXKFL2(XKFL2);
			demandBean.setXKFL3(XKFL3);
			demandBean.setXQJSSSLY(XQJSSSLY);
			demandBean.setQTJSMS(QTJSMS);

			demandBean.setXQJSYYHY1(XQJSYYHY1);
			demandBean.setXQJSYYHY2(XQJSYYHY2);
			demandBean.setXQJSYYHY3(XQJSYYHY3);
			demandBean.setJSXQHZMS(JSXQHZMS);
			demandBean.setHZYXDW(HZYXDW);

			demandBean.setCreateDate(createDate.format(new Date()));

			boolean flag = demandDao.checkName(JSXQMC);

			if (flag) {// 不存在，添加成功
				demandDao.saveDemand(demandBean);
				status = 0;
				// resp.sendRedirect("my/addInfo.jsp?status=0");
			} else {// 存在，添加失败
				status = 1;
				// resp.sendRedirect("my/addInfo.jsp?status=1");
			}
		} catch (Exception e) {
			status = 2;
			// resp.sendRedirect("my/addInfo.jsp?status=2");
			e.printStackTrace();
		}

		model.addAttribute("status", status);
		return "my/addInfo";
	}

	/*------------------------------------------我的需求浏览------------------------------------------------------------*/

	/**
	 * 以列表查看用户自己已填的需求信息
	 */
	@RequestMapping(value = "/myList/{username}", method = RequestMethod.GET)
	private String myList(@PathVariable("username") String username, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		DemandDao demandDao = new DemandDao();
		List<DemandBean> demandBeans = null;
		try {
			demandBeans = demandDao.getMyList(username);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		req.getSession().setAttribute("demandBeans", demandBeans);
		// req.getRequestDispatcher("my/myList.jsp").forward(req, resp);
		String url = "/my/myList";
		return url;
	}

	/**
	 * 用户自己的需求问卷详情信息
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/myDetails/{WJID}", method = RequestMethod.GET)
	private String myDetails(@PathVariable("WJID") String WJID, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.setCharacterEncoding("utf-8");
		DemandBean demandBean = new DemandBean();
		// context.getBean("demand",DemandBean.class);
		DemandDao demandDao = new DemandDao();

		demandBean = demandDao.getById(WJID);
		// req.setAttribute("demandBean", demandBean);
		req.getSession().setAttribute("demandBean", demandBean);
		// req.getRequestDispatcher("my/myDetails.jsp").forward(req, resp);
		return "/my/myDetails";
	}

	/*------------------------------------------总需求------------------------------------------------------------*/

	/**
	 * 分页的列表浏览
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	private String list(HttpServletRequest req, HttpServletResponse resp, ModelMap model) throws Exception {
		req.setCharacterEncoding("utf-8");
		System.out.println("转至list方法中！");
		String status = req.getParameter("status");
		DemandDao demandDao = new DemandDao();
		int currentPage = StringUtil.StringToInt(req.getParameter("currentPage"));
		// 注意此处是调用方法，而不是获取属性值（而且这个属性是adminBean里面的）——方法：获取数据表中数据总量：public int
		// getCount(){}
		int countSize = demandDao.getCount();
		// Constants.PAGE_SIZE_1: 该常量表示： 一页多少条数据,这里size1为一页一条数据
		Paging pagingBean = new Paging(currentPage, countSize, Constants.PAGE_SIZE_5);
		List<DemandBean> demandBeans = demandDao.getListByPage(currentPage * Constants.PAGE_SIZE_5, countSize);
		pagingBean.setPrefixUrl(req.getContextPath() + "/DemandController/list.action");
		pagingBean.setAnd(true); // true的时候是&，否是？
		// req.setAttribute("demandBeans", demandBeans);
		// req.setAttribute("pagingBean", pagingBean);
		req.getSession().setAttribute("demandBeans", demandBeans);
		req.getSession().setAttribute("pagingBean", pagingBean);

		if (status != null) {
			// req.getRequestDispatcher("first/list.jsp?status=" +
			// status).forward(req, resp);
			model.addAttribute("status", status);
		} else {
			// req.getRequestDispatcher("first/list.jsp").forward(req, resp);

		}

		return "/first/list";
	}

	/**
	 * 详情信息
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/details/{WJID}", method = RequestMethod.GET)
	private String details(@PathVariable("WJID") String WJID, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.setCharacterEncoding("utf-8");
		System.out.println("WJID=" + WJID);
		DemandBean demandBean = new DemandBean();
		// context.getBean("demand",DemandBean.class);
		DemandDao demandDao = new DemandDao();

		demandBean = demandDao.getById(WJID);
		req.getSession().setAttribute("demandBean", demandBean);

		// req.getRequestDispatcher("first/details.jsp").forward(req, resp);
		return "/first/details";
	}

	/*------------------------------------------图表统计------------------------------------------------------------*/

	/**
	 * 图表统计
	 * 
	 * @param req
	 * @param resp
	 * @throws Exception 
	 */
	@RequestMapping(value = "/tongji", method = RequestMethod.GET)
	protected String tongji(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		DemandDao xuqiudao = new DemandDao();
		Tongjibean tongjibean = new Tongjibean();
		// context.getBean("tongji",Tongjibean.class);
		tongjibean = xuqiudao.tongji();
		tongjibean.setWeishenhe1(tongjibean.jiussuan(tongjibean.getWeishenhe(), tongjibean.getZong()));
		tongjibean.setShenhe1(tongjibean.jiussuan(tongjibean.getShenhe(), tongjibean.getZong()));
		tongjibean.setTongguo1(tongjibean.jiussuan(tongjibean.getTongguo(), tongjibean.getZong()));
		tongjibean.setTuihui1(tongjibean.jiussuan(tongjibean.getTuihui(), tongjibean.getZong()));

		// req.setAttribute("tongjibean", tongjibean);
		req.getSession().setAttribute("tongjibean", tongjibean);
		// req.getRequestDispatcher("jquery-css3-vote-bar-150326231418/tongji.jsp").forward(req,
		// resp);

		return "/jquery-css3-vote-bar-150326231418/tongji";
	}

	/*------------------------------------------审核------------------------------------------------------------*/

	/**
	 * 更改审核的状态
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/check/{WJID}", method = RequestMethod.POST)
	private String check(@PathVariable("WJID") String WJID, HttpServletRequest req, HttpServletResponse resp,
			ModelMap model) throws Exception {
		req.setCharacterEncoding("utf-8");

		int SFSH = Integer.parseInt(req.getParameter("SFSH"));
		DemandDao demandDao = new DemandDao();
		if (SFSH == 1) {
			demandDao.updateSFSH(WJID, SFSH, "空");
		} else {
			String V = req.getParameter("V");
			demandDao.updateSFSH(WJID, SFSH, V);
		} // 成功

		model.addAttribute("status", 1);
		// req.getRequestDispatcher("check/demandDetails.jsp?status=1").forward(req,
		// resp);// 审核成功
		return "/check/demandDetails";

	}

	/**
	 * 详情信息
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/demandDetails/{WJID}", method = RequestMethod.GET)
	private String demandDetails(@PathVariable("WJID") String WJID, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.setCharacterEncoding("utf-8");

		DemandBean demandBean = new DemandBean();
		//context.getBean("demand", DemandBean.class);
		DemandDao demandDao = new DemandDao();

		demandBean = demandDao.getById(WJID);
		// req.setAttribute("demandBean", demandBean);
		req.getSession().setAttribute("demandBean", demandBean);

		/*
		 * int len = demandBean.getType().length();
		 * System.out.println("类型的种类len=" + len); req.setAttribute("len", len);
		 */

		// req.getRequestDispatcher("check/demandDetails.jsp").forward(req,
		// resp);
		return "/check/demandDetails";
	}

	/**
	 * 以列表查看需求信息，加上审核
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "/demandList", method = RequestMethod.GET)
	private String demandList(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		DemandDao demandDao = new DemandDao();
		List<DemandBean> demandBeans = demandDao.getListNo();

		// req.setAttribute("demandBeans", demandBeans);
		req.getSession().setAttribute("demandBeans", demandBeans);
		// req.getRequestDispatcher("check/demandList.jsp").forward(req, resp);
		return "/check/demandList";
	}

	/**
	 * 根据条件，搜索
	 */
	@RequestMapping(value = "/selectDemandList", method = RequestMethod.POST)
	private String selectDemandList(ModelMap model, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String name = req.getParameter("name");

		DemandDao demandDao = new DemandDao();

		List<DemandBean> demandBeans = demandDao.getByName(name);// 这里使用二分查找法（即折半查找）

		if (demandBeans != null) {
			// req.setAttribute("demandBeans", demandBeans);
			req.getSession().setAttribute("demandBeans", demandBeans);
			// req.getRequestDispatcher("check/demandList.jsp").forward(req,
			// resp);
		} else {
			// req.getRequestDispatcher("check/demandList.jsp?status=1").forward(req,
			// resp);
			model.addAttribute("status", 1);
		}
		return "/check/demandList";
	}

	/*------------------------------------------分类浏览功能------------------------------------------------------------*/

	/**
	 * 分类浏览，从数据库中读出，科技活动类型的集合
	 * @throws Exception 
	 */
	@RequestMapping(value = "/preType", method = RequestMethod.POST)
	private void preType(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		System.out.println("OK  转至preType方法！");
		DemandDao demandDao = new DemandDao();
		List<String> YJLXs = demandDao.getTypeList();

		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		out.print(JSON.toJSONString(YJLXs));
		out.flush();
		out.close();

	}

	/**
	 * 第二级：学科分类，国民经济行业分类的第一级结点显示
	 * 
	 * @param req
	 * @param resp
	 * @throws Exception 
	 */
	@RequestMapping(value = "/getNextA", method = RequestMethod.POST)
	private void getNextA(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		// @RequestMapping(value="/abc",method=RequestMethod.POST,produces =
		// {"application/json;charset=UTF-8"});
		System.out.println("转至getNext方法！");
		DemandDao demandDao = new DemandDao();
		String type = req.getParameter("id");

		System.out.println("类型为:" + type);
		List<String> NEXTs = new ArrayList<String>();

		if (type.equals("基础研究")) {
			NEXTs = demandDao.getXKFLListA();// 第一级
		} else {
			NEXTs = demandDao.getXQJSYYHYListA();// 第一级
		}

		// System.out.println(NEXTs.toString());

		PrintWriter out = resp.getWriter();
		out.print(JSON.toJSONString(NEXTs));
		out.flush();
		out.close();
	}

	/**
	 * 第三级：学科分类的第二级结点显示
	 * 
	 * @param req
	 * @param resp
	 * @throws Exception 
	 */
	@RequestMapping(value = "/getNextBX", method = RequestMethod.POST)
	private void getNextBX(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		// @RequestMapping(value="/abc",method=RequestMethod.POST,produces =
		// {"application/json;charset=UTF-8"});
		// System.out.println("转至getNext方法！");
		DemandDao demandDao = new DemandDao();
		String type = req.getParameter("id");

		System.out.println("类型为:" + type);
		List<String> NEXTs = new ArrayList<String>();

		NEXTs = demandDao.getXKFLListB(type);// 第一级

		// System.out.println(NEXTs.toString());

		PrintWriter out = resp.getWriter();
		out.print(JSON.toJSONString(NEXTs));
		out.flush();
		out.close();
	}

	/**
	 * 第四级：学科分类的第三级结点显示
	 * 
	 * @param req
	 * @param resp
	 * @throws Exception 
	 */
	@RequestMapping(value = "/getNextCX", method = RequestMethod.POST)
	private void getNextCX(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		// @RequestMapping(value="/abc",method=RequestMethod.POST,produces =
		// {"application/json;charset=UTF-8"});
		// System.out.println("转至getNext方法！");
		DemandDao demandDao = new DemandDao();
		String type = req.getParameter("id");

		System.out.println("类型为:" + type);
		List<String> NEXTs = new ArrayList<String>();

		NEXTs = demandDao.getXKFLListC(type);// 第一级

		// System.out.println(NEXTs.toString());

		PrintWriter out = resp.getWriter();
		out.print(JSON.toJSONString(NEXTs));
		out.flush();
		out.close();
	}

	/**
	 * 第三级：国民经济行业分类的第二级结点显示
	 * 
	 * @param req
	 * @param resp
	 * @throws Exception 
	 */
	@RequestMapping(value = "/getNextBH", method = RequestMethod.POST)
	private void getNextBH(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		// @RequestMapping(value="/abc",method=RequestMethod.POST,produces =
		// {"application/json;charset=UTF-8"});
		// System.out.println("转至getNext方法！");
		DemandDao demandDao = new DemandDao();
		String type = req.getParameter("id");

		System.out.println("类型为:" + type);
		List<String> NEXTs = new ArrayList<String>();

		NEXTs = demandDao.getXQJSYYHYListB(type);// 第二级

		// System.out.println(NEXTs.toString());

		PrintWriter out = resp.getWriter();
		out.print(JSON.toJSONString(NEXTs));
		out.flush();
		out.close();
	}

	/**
	 * 第四级：国民经济行业分类的第三级结点显示
	 * 
	 * @param req
	 * @param resp
	 * @throws Exception 
	 */
	@RequestMapping(value = "/getNextCH", method = RequestMethod.POST)
	private void getNextCH(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		System.out.println("到达！");
		// @RequestMapping(value="/abc",method=RequestMethod.POST,produces =
		// {"application/json;charset=UTF-8"});
		// System.out.println("转至getNext方法！");
		DemandDao demandDao = new DemandDao();
		String type = req.getParameter("id");

		System.out.println("类型为:" + type);
		List<String> NEXTs = new ArrayList<String>();

		NEXTs = demandDao.getXQJSYYHYListC(type);// 第三级

		// System.out.println(NEXTs.toString());

		PrintWriter out = resp.getWriter();
		out.print(JSON.toJSONString(NEXTs));
		out.flush();
		out.close();
	}

	/**
	 * 分类查询 以列表查看需求信息
	 * @throws Exception 
	 */
	@RequestMapping(value = "/getList", method = RequestMethod.GET)
	private String getList(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		// System.out.println("Success!!!");
		String NEXT = req.getParameter("id");

		NEXT = new String(NEXT.getBytes("ISO8859-1"), "UTF-8");
		System.out.println("选择:" + NEXT);
		// System.out.println("夏小暑选择了"+NEXT);
		DemandDao demandDao = new DemandDao();

		List<DemandBean> demandBeans = demandDao.getListNext(NEXT);

		// req.setAttribute("demandBeans", demandBeans);
		req.getSession().setAttribute("demandBeans", demandBeans);
		// req.getRequestDispatcher("type/demandList.jsp").forward(req, resp);
		return "/type/demandList";
	}

	@RequestMapping(value = "/getListAX", method = RequestMethod.GET)
	private String getListAX(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		String NEXT = req.getParameter("id");
		// System.out.println("id2:"+id);
		// String parent=req.getParameter("parentId");
		NEXT = new String(NEXT.getBytes("ISO8859-1"), "UTF-8");
		System.out.println("选择:" + NEXT);
		// System.out.println("夏小暑选择了"+NEXT);
		DemandDao demandDao = new DemandDao();

		List<DemandBean> demandBeans = demandDao.getListAX(NEXT);

		// req.setAttribute("demandBeans", demandBeans);
		// req.getRequestDispatcher("type/demandList.jsp").forward(req, resp);
		req.getSession().setAttribute("demandBeans", demandBeans);
		return "/type/demandList";
	}

	@RequestMapping(value = "/getListBX", method = RequestMethod.GET)
	private String getListBX(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");

		String NEXT = req.getParameter("id");
		String parent = req.getParameter("parentId");

		NEXT = new String(NEXT.getBytes("ISO8859-1"), "UTF-8");
		parent = new String(parent.getBytes("ISO8859-1"), "UTF-8");
		// System.out.println("夏小暑选择了"+NEXT);
		System.out.println("选择:" + NEXT + "   parentId3:" + parent);

		DemandDao demandDao = new DemandDao();

		List<DemandBean> demandBeans = demandDao.getListBX(NEXT, parent);

		req.getSession().setAttribute("demandBeans", demandBeans);
		return "/type/demandList";
	}

	@RequestMapping(value = "/getListCX", method = RequestMethod.GET)
	private String getListCX(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		String NEXT = req.getParameter("id");
		String parent = req.getParameter("parentId");
		NEXT = new String(NEXT.getBytes("ISO8859-1"), "UTF-8");
		parent = new String(parent.getBytes("ISO8859-1"), "UTF-8");
		// System.out.println("夏小暑选择了"+NEXT);
		System.out.println("选择:" + NEXT + "   parentId3:" + parent);

		DemandDao demandDao = new DemandDao();

		List<DemandBean> demandBeans = demandDao.getListCX(NEXT, parent);

		req.getSession().setAttribute("demandBeans", demandBeans);
		return "/type/demandList";
	}

	/**
	 * 国民经济行业分类
	 * @throws Exception 
	 */
	@RequestMapping(value = "/getListAH", method = RequestMethod.GET)
	private String getListAH(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		String NEXT = req.getParameter("id");
		// String parent=req.getParameter("parentId");
		NEXT = new String(NEXT.getBytes("ISO8859-1"), "UTF-8");
		System.out.println("选择:" + NEXT);
		// System.out.println("夏小暑选择了"+NEXT);
		DemandDao demandDao = new DemandDao();

		List<DemandBean> demandBeans = demandDao.getListAH(NEXT);

		req.getSession().setAttribute("demandBeans", demandBeans);
		return "/type/demandList";
	}

	@RequestMapping(value = "/getListBH", method = RequestMethod.GET)
	private String getListBH(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		String NEXT = req.getParameter("id");
		String parent = req.getParameter("parentId");
		NEXT = new String(NEXT.getBytes("ISO8859-1"), "UTF-8");
		parent = new String(parent.getBytes("ISO8859-1"), "UTF-8");
		System.out.println("选择:" + NEXT + "   parentId3:" + parent);
		// System.out.println("夏小暑选择了"+NEXT);
		DemandDao demandDao = new DemandDao();

		List<DemandBean> demandBeans = demandDao.getListBH(NEXT, parent);

		req.getSession().setAttribute("demandBeans", demandBeans);
		return "/type/demandList";
	}

	@RequestMapping(value = "/getListCH", method = RequestMethod.GET)
	private String getListCH(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		String NEXT = req.getParameter("id");
		String parent = req.getParameter("parentId");
		NEXT = new String(NEXT.getBytes("ISO8859-1"), "UTF-8");
		parent = new String(parent.getBytes("ISO8859-1"), "UTF-8");
		System.out.println("选择:" + NEXT + "   parentId3:" + parent);
		// System.out.println("夏小暑选择了"+NEXT);
		DemandDao demandDao = new DemandDao();

		List<DemandBean> demandBeans = demandDao.getListCH(NEXT, parent);

		req.getSession().setAttribute("demandBeans", demandBeans);
		return "/type/demandList";
	}

	/*------------------------------------------综合检索------------------------------------------------------------*/

	/*
	 * 审核多条件查询第一页
	 */
	@RequestMapping(value = "/shenhechaxun", method = RequestMethod.POST)
	private String shenhechaxun(ModelMap model, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.setCharacterEncoding("UTF-8");
		String num = req.getParameter("num");// 查询依据的个数

		// "logic" + strId; 与或非
		// "sType" + strId; 类型
		// "q" + strId; 输入框

		// 申明
		String q0 = null;
		String q1 = null;
		String q2 = null;
		String logic1 = null;
		String logic2 = null;
		String sType0 = null;
		String sType1 = null;
		String sType2 = null;
		if (req.getParameter("q0") != null) {
			q0 = req.getParameter("q0");
			sType0 = req.getParameter("sType0");
		}
		if (req.getParameter("q1") != null) {
			q1 = req.getParameter("q1");
			logic1 = req.getParameter("logic1");
			sType1 = req.getParameter("sType1");
		}
		if (req.getParameter("q2") != null) {
			q2 = req.getParameter("q2");
			logic2 = req.getParameter("logic2");
			sType2 = req.getParameter("sType2");
		}

		DemandDao cs = new DemandDao();

		List<DemandBean> xx = cs.xdshPolicy(num, sType0, q0, logic1, sType1, q1, logic2, sType2, q2);

		req.getSession().setAttribute("xxbeans", xx);
		if (xx.size() != 0) {
			// req.getRequestDispatcher("/first/Type.jsp").forward(req, resp);
			return "/first/Type";
		} else {
			model.addAttribute("status", 1);
			// resp.sendRedirect(req.getContextPath() +
			// "/first/Type.jsp?status=1");
			return "/first/Type";
		}

		// return "/first/Type";

	}

	/*********************************************** ↓还未改完的部分↓ **************************************************************************/

	/*
	
	*//**
		 * 以列表查看需求信息
		 *//*
		 * private void list_type(HttpServletRequest req, HttpServletResponse
		 * resp) throws ServletException, IOException {
		 * req.setCharacterEncoding("utf-8"); DemandDao demandDao = new
		 * DemandDao(); List<Demand> demandBeans = demandDao.getList();
		 * 
		 * req.setAttribute("demandBeans", demandBeans);
		 * req.getRequestDispatcher("first/list_type.jsp").forward(req, resp); }
		 * 
		 */
	/**
	 * 根据条件，搜索
	 */
	/*
	 * private void selectList(HttpServletRequest req, HttpServletResponse resp)
	 * throws ServletException, IOException { req.setCharacterEncoding("utf-8");
	 * String JSXQMC = req.getParameter("JSXQMC"); DemandDao demandDao = new
	 * DemandDao();
	 * 
	 * List<Demand> demandBeans = demandDao.getByName(JSXQMC);
	 * 
	 * if (demandBeans != null) { req.setAttribute("demandBeans", demandBeans);
	 * req.getRequestDispatcher("first/list.jsp?status=0").forward(req, resp); }
	 * else { req.getRequestDispatcher("first/list.jsp?status=1").forward(req,
	 * resp); } }
	 */

}
