<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>分类浏览</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/bootstrap-3.3.5-dist/css/bootstrap.css" />

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<script type="text/javascript"
	src="${pageContext.request.contextPath }/static/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/static/bootstrap-3.3.5-dist/css/bootstrap.css">

<style type="text/css">
<!--
.STYLE1 {
	font-size: x-large
}
-->
</style>
</head>
<body>
	<div class="container-fulid">
		<div class="col-md-12">
			<h1 align="center">分类浏览</h1>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-10">
	<form name="form1" method="post"
		action="${pageContext.request.contextPath }/DemandServlet?method=selectDemandList">
		<p align="center">
		<div class="col-md-10">
			<div class="col-md-5">
				<input type="text" name="name" class="form-control"
					placeholder="点击输入技术需求名称">
			</div>
			<div class="col-md-5">
				<input class="btn btn-primary" type="submit" name="Submit"
					value="点击查询">
			</div>
		</div>
		</p>
		<c:if test="${param.status.equals('1')}">
			<div class="alert alert-danger" role="alert">
				<div align="center">抱歉，查询不到</div>
			</div>
		</c:if>
	</form>
	<p>&nbsp;</p>
	<div class="col-md-1"></div>
	<div class="col-md-1"></div>
	<c:if test="${demandBeans!=null }">
		<table class="table table-striped">
			<tr>
				<td>序号</td>
				<td>技术需求名称</td>
				<td>提交日期</td>
				<td></td>
			</tr>
			<c:forEach items="${demandBeans }" var="item" varStatus="status">

				<tr>
					<td>${item.WJID }</td>
					<td>${item.JSXQMC }</td>
					<td>${item.createDate }</td>
					<td><a
						href="${pageContext.request.contextPath }/DemandServlet?method=demandDetails&WJID=${item.WJID }">去审核</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
		<div class="col-md-1"></div>
		<div class="col-md-12"></div>
	</div>
	<p>&nbsp;</p>
</body>

</html>