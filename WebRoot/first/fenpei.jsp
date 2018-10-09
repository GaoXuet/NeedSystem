<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>需求审核</title>
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
<script type="text/javascript">
function ch(){
		alert("分配角色完成！");
	}
</script>
<body>
	<div class="container-fulid">
		<div class="col-md-12">
			<h1 align="center">权限管理</h1>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-10">
	<p>&nbsp;</p>
	<c:if test="${adminBeans!=null }">
	<div class="col-md-13">
		<table class="table table-striped">
			<tr>
				<td>用户名</td>
				<td>姓名</td>
				<td>身份证号</td>
				<td>角色选择</td>
				<td></td>
			</tr>
			<c:forEach items="${adminBeans }" var="item" varStatus="status">
<form name="form1" method="post"
		action="/Technology/AdminController/addSFSH/${item.username }.action">
				<tr>
					<td>${item.username }</td>
					<td>${item.name }</td>
					<td>${item.id_number }</td>
				  <td><input
									type="radio" id="status" name="status" value="0">
									管理员
									<input
									type="radio" id="status" name="status" value="1">
									网络审核员
									<input
									type="radio" id="status" name="status" value="2">
									注册用户
										</td>
					<td><input class="btn btn-primary btn-sm" type="submit" onClick="ch()" value="确认分配"></td>
				</tr>
				</form>
			</c:forEach>
		</table>
		</div>
	</c:if>
</div>
		<div class="col-md-1"></div>
		<div class="col-md-12"></div>
	</div>
	<p>&nbsp;</p>
</body>

</html>