package com.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;
import com.bean.SecondHBean;
import com.bean.SecondXBean;
import com.bean.ThirdHBean;
import com.bean.ThirdXBean;
import com.dao.SecondHDao;
import com.dao.SecondXDao;
import com.dao.ThirdHDao;
import com.dao.ThirdXDao;
import com.util.StringUtil;

/**
 * 学科分类和国民经济分类的三级下拉菜单
 */

@Controller
@RequestMapping(value="/XQController") 
public class XQController {
	
	/*------------------------------------------学科分类------------------------------------------------------------*/
	
	@RequestMapping(value = "/getSecondX", method = RequestMethod.POST)
	private void getSecondX(HttpServletRequest req, HttpServletResponse resp) throws Exception { 
		int parentId = StringUtil.StringToInt(req.getParameter("id"));
		SecondXDao secondXDao = new SecondXDao();
		System.out.println("转到getSecondX");
		List<SecondXBean> secondList = secondXDao.getSecondList(parentId);
		//System.out.println(cityList.get(0).getName());
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		out.print(JSON.toJSONString(secondList));
		out.flush();
		out.close();

		}
	@RequestMapping(value = "/getThirdX", method = RequestMethod.POST)
	private void getThirdX(HttpServletRequest req, HttpServletResponse resp) throws Exception { 
		int parentId = StringUtil.StringToInt(req.getParameter("id"));
		ThirdXDao thirdXDao = new ThirdXDao();
		System.out.println("转到getThirdX");
		List<ThirdXBean> thirdList = thirdXDao.getThirdList(parentId);
		//System.out.println(cityList.get(0).getName());
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		out.print(JSON.toJSONString(thirdList));
		out.flush();
		out.close();

		}
	
	
	
			
	/*------------------------------------------国民经济行业分类------------------------------------------------------------*/
	
	@RequestMapping(value = "/getSecondH", method = RequestMethod.POST)
	private void getSecondH(HttpServletRequest req, HttpServletResponse resp) throws Exception { 
		int parentId = StringUtil.StringToInt(req.getParameter("id"));
		SecondHDao secondHDao = new SecondHDao();
		System.out.println("转到getSecondH");
		List<SecondHBean> secondList = secondHDao.getSecondList(parentId);
		//System.out.println(cityList.get(0).getName());
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		out.print(JSON.toJSONString(secondList));
		out.flush();
		out.close();

		}
	@RequestMapping(value = "/getThirdH", method = RequestMethod.POST)
	private void getThirdH(HttpServletRequest req, HttpServletResponse resp) throws Exception { 
		int parentId = StringUtil.StringToInt(req.getParameter("id"));
		ThirdHDao thirdHDao = new ThirdHDao();
		System.out.println("转到getThirdH");
		List<ThirdHBean> thirdList = thirdHDao.getThirdList(parentId);
		//System.out.println(cityList.get(0).getName());
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		out.print(JSON.toJSONString(thirdList));
		out.flush();
		out.close();

		}
	


}
