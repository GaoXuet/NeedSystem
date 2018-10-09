<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改基本信息</title>
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
<body>
	<div class="container-fulid">
		<div class="col-md-12">
			<h1 align="center">修改基本信息</h1>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<form name="form1" method="post"
		action="${pageContext.request.contextPath }/AdminServlet?method=fenpei&username=${adminBean.username }">
		<c:if test="${param.status.equals('0')}">
			<div class="alert alert-success" role="alert">更新成功</div>
		</c:if>
		<c:if test="${param.status.equals('1')}">
			<div class="alert alert-danger" role="alert">更新失败</div>
		</c:if>
		<div class="col-md-12">
		  <table class="table table-bordered">
            <tbody>
              <tr>
                <td>用户名</td>
                <td>${adminBean.username }</td>
                <td>机构代码</td>
								  <td>	${adminBean.code }</td>
              </tr>
			  <tr>
                <td>姓名</td>
                <td>${adminBean.name }</td>
								 <td>身份证号</td>
								  <td>${adminBean.id_number }</td>
              </tr>
			  <tr>
                <td>性别</td>
                <td>${adminBean.sex }</td>
                <td>国家/省份</td>
								  <td>空</td>
              </tr>
			  <tr>
                <td>工作单位</td>
                <td>${adminBean.unit }</td>
								 <td>专业方向</td>
								  <td>${adminBean.direction }</td>
              </tr>
			  <tr>
                <td>所在行业</td>
                <td>${adminBean.industry }</td>
								 <td>教育程度</td>
								  <td>${adminBean.levels }</td>
              </tr>
			  <tr>
                <td>职称</td>
			    <td>${adminBean.title }</td>
			    <td>通讯地址</td>
			    <td>	${adminBean.address }</td>
		      </tr>
			  <tr>
                <td>邮政编码</td>
			    <td>${adminBean.postal }</td>
			    <td>手机</td>
			    <td>	${adminBean.phone }</td>
		      </tr>
			  <tr>
                <td>固定电话</td>
			    <td>${adminBean.telephone }</td>
			    <td>邮箱</td>
			    <td>${adminBean.email }</td>
		      </tr>
			  <tr>
                <td>QQ</td>
			    <td>${adminBean.qq}</td>
			    <td>MSN</td>
			    <td>${adminBean.msn }</td>
		      </tr>
			  <tr>
                <td><span class="STYLE1">*</span>分配角色</td>
			    <td colspan="3">
										<select name="status" id="status" class="form-control">
							<option value="3" selected>--请选择--</option>
							<option value="0">管理员</option>
							<option value="1">网络审核员</option>
							<option value="2">注册用户</option>
							
						</select></td>
		      </tr>
            </tbody>
          </table>
		</div>
				<input class="form-control btn btn-info" type="submit" value="确认分配">
			</form>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-12"></div>
	</div>
</body>
</html>