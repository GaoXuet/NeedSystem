<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>河北省重大技术需求征集问卷调查系统</title>
	<!-- 导入bootstrap. css-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.5-dist/css/bootstrap.css" />
	<!--导入jquery.js-->
	   <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-1.12.1.js" ></script>	
	<!--导入bootstrap.js-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap-3.3.5-dist/js/bootstrap.js" ></script>
</head>
<!-- 没有body -->
	<frameset frameborder="no" rows="73px,*" >
   		<frame src="${pageContext.request.contextPath }/head.jsp" scrolling="no">
   		<frameset cols="285px, *" rows="*">
   			<frame src="${pageContext.request.contextPath }/left.jsp">
   			<frameset rows="40px,*">
			<frame src="${pageContext.request.contextPath }/mainBar.jsp" />	
			<frame src="${pageContext.request.contextPath }/index.html" name="mainAction"/>
			</frameset>
   		</frameset>
   	</frameset>
</html>