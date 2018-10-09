package com.oracle.jsp.tag;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.bean.PagingBean;


public class PageTag extends SimpleTagSupport {
	private PagingBean pagingBean;
	private HttpServletRequest request;

//	
//	JSP 自定义标签
//	自定义标签是用户定义的JSP语言元素。当JSP页面包含一个自定义标签时将被转化为servlet，标签转化为对被 称为tag handler的对象的操作，即当servlet执行时Web container调用那些操作。
//	JSP标签扩展可以让你创建新的标签并且可以直接插入到一个JSP页面。 JSP 2.0规范中引入Simple Tag Handlers来编写这些自定义标记。
//	你可以继承SimpleTagSupport类并重写的doTag()方法来开发一个最简单的自定义标签。
	@Override
	public void doTag() throws JspException,IOException{
		StringBuffer sb=new StringBuffer();
		if(pagingBean!=null){
//			定义导航链接的部分呢——如果文档中有“前后”按钮，则应该把它放到 <nav> 元素中。
			sb.append("<nav><ul class='pagination'>");
			//处理上一页和首页
			if(pagingBean.getCurrentPage()<=0){
				//当前页为第一页
				//则首页按钮和上一页 按钮为不可用状态——点击无效
				sb.append("<li class='disabled'><a>首页</a></li>");
				sb.append("<li class='disabled'><a href='#'>上一页</a></li>");
			}else{
				//当前页不是第一页，则首页和上一页为可用状态——点击有效
				sb.append("<li><a href='").append(pagingBean.getPrefixUrl())
				.append("' aria-label='Previous'><span aria-hidden='true'>首页</span></a></li>");
				sb.append("<li><a href='").append(pagingBean.getPrefixUrl()).append(pagingBean.isAnd()?"&":"?")
				.append("currentPage=").append(pagingBean.getCurrentPage()-1).append("'>上一页</a></li>");
			}
				//处理下一页和尾页	
				if(pagingBean.getCurrentPage()>=(pagingBean.getPageCount()-1)){
					//当前页是最后一页，下一页和尾页按钮不可用状态——点击无效
					sb.append("<li class='disabled'><a>下一页</a></li>");
					sb.append("<li class='disabled'><a>尾页</a></li>");
				}else{
					//当前页不是最后一页
					sb.append("<li><a href='").append(pagingBean.getPrefixUrl()).append(pagingBean.isAnd() ? "&" : "?")
					.append("currentPage=").append(pagingBean.getCurrentPage() + 1).append("'>下一页</a></li>");
					
					sb.append("<li><a href='").append(pagingBean.getPrefixUrl()).append(pagingBean.isAnd() ? "&" : "?")
					.append("currentPage=").append(pagingBean.getPageCount() - 1)
					.append("' aria-label='Previous'><span aria-hidden='true'>尾页</span></a></li>");
				}
				sb.append("<li><a href='#'");
				sb.append("<span>");
				sb.append(pagingBean.getCurrentPage() + 1);
				sb.append("/");
				sb.append(pagingBean.getPageCount());
				sb.append("</span>");
				sb.append("</a></li>");
				sb.append("</ul></nav>"); 
				getJspContext().getOut().write(sb.toString());
			
		}
	}

	public PagingBean getPagingBean(){
		return pagingBean;
	}
	
	public void setPagingBean(PagingBean pagingBean){
		this.pagingBean=pagingBean;
	}
	
	public HttpServletRequest getRequest(){
		return request;
	}

	public void setRequest(HttpServletRequest request)
	{
		this.request=request;
	}
}
