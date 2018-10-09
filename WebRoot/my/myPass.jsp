<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap.css" />

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



<script type="text/javascript">
		function tijiao() {

		/* 为空的验证 */

		if (document.getElementById('P1').value == "") {
			alert("旧密码为空！");
			return false;
		}
		if (document.getElementById('P2').value == "") {
			alert("新密码为空！");
			return false;
		}
		if (document.getElementById('P3').value == "") {
			alert("再次输入的新密码为空！");
			return false;
		}
		if (document.getElementById('P2').value != document.getElementById('P3').value) {
			alert("两次输入的新密码不一致！");
			return false;
		}
		
		}
		

	
	
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/static/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/static/bootstrap-3.3.5-dist/css/bootstrap.css">

<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000
}
-->
</style>
</head>
<body onload='document.getElementById("P1").focus();'>
	<div class="container-fulid">
		<div class="col-md-12">
			<h1 align="center">修改密码</h1>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<form name="form1" method="post"
		action="/Technology/AdminController/updateP/${admin.username }_${admin.password }.action">
				<c:if test="${status==0}">
			<div class='alert alert-danger' role='alert'>旧密码错误</div>
		</c:if>
		<c:if test="${status==1}">
			<div class="alert alert-success" role="alert">修改成功</div>
		</c:if>
		<c:if test="${status==2}">
			<div class="alert alert-danger" role="alert">修改失败</div>
		</c:if>
		<div class="col-md-1"></div>
		<div class="col-md-12">
		  <table class="table table-bordered">
            <tbody>
              <tr>
                <td>输入旧密码</td>
                <td><input type="password" class="form-control"
								name="P1" id="P1" maxlength="20"></td>
              </tr>
			  <tr>
                <td>输入新密码</td>
                <td><input type="password" class="form-control"
								name="P2" id="P2" maxlength="20"></td>
              </tr>
			  <tr>
                <td>再一次输入新密码</td>
                <td><input type="password" class="form-control"
								name="P3" id="P3" maxlength="20"></td>
              </tr>
            </tbody>
          </table>
		</div>
				<input class="form-control btn btn-info" type="submit" onClick="return tijiao();" value="确认修改密码">
			</form>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-12"></div>
	</div>
</body>
</html>