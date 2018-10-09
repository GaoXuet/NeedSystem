<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改密码</title>
<style type="text/css">
<!--
.STYLE1 {font-size: large}
-->
</style>
<script type="text/javascript">
	function check() {
		if (document.getElementById("password").value != document.getElementById("password2").value) {
			alert("前后密码不一致！");
			return false;
		}
	}
</script>
</head>
<body>
<div align="center" class="STYLE1">修改密码</div>
  <p>&nbsp;</p>
    <p>&nbsp;</p>
<form name="form1" method="post" action="${pageContext.request.contextPath }/AdminServlet?method=update&id=${adminBean.id }">
  <table width="550" border="1" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><input type="password" name="password" id="password" style="width:550px; height:30px" placeholder="请输入新密码"></td>
    </tr>
    <tr>
      <td><input type="password" name="password2" id="password2" style="width:550px; height:30px" placeholder="请再次输入新密码"></td>
    </tr>
  </table>
  <p align="center">
    <input type="submit" name="submit" value="修改密码">
    <input type="reset" name="reset" value="重置">
  </p>
  <c:if test="${param.status.equals('1')}">
					<div class="alert alert-danger" role="alert">密码修改完成</div>
				</c:if>
				<c:if test="${param.status.equals('2')}">
					<div class="alert alert-danger" role="alert">修改失败</div>
				</c:if>
</form>
</body>
</html>