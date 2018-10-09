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
		if (document.getElementById('P2').value != document
				.getElementById('P3').value) {
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
<script type="text/javascript">
	//三级菜单
	/*-------------------------------------------------------------------------------------*/
	function chCity(obj) {
		$(obj).parent().nextAll().remove();
		var id = obj.value;
		if (id > 0) {
			$
					.post(
							"CityServlet",
							{
								method : "getCity",
								id : id

							},
							function(data) {
								if (data != null && data.length > 0) {
									var content = "<div class='col-sm-5' > <select name='CityId' class='form-control'  id='city0'> <option value='0'>-- 请选择市 --</option>";
									for ( var city in data) {
										content += "<option value='"+data[city].id+"'>"
												+ data[city].name + "</option>";
									}
									content += "</select></div>";
									$("#types").append(content);
								}
							}, "json");
		}

	}

	function check() {
		if (document.getElementById('code').value == "") {
			alert("机构代码为空！");
			return false;
		}
		if (document.getElementById('name').value == "") {
			alert("姓名为空！");
			return false;
		}
		if (document.getElementById('id_number').value == "") {
			alert("身份证为空！");
			return false;
		}
		if (document.getElementById('city0').value == "") {
			alert("请重新选择省份（选择有市级下拉框的）！");
			return false;
		}

	}

	/*-------------------------------------------------------------------------------------*/
</script>
</head>
<body onload='document.getElementById("code").focus();'>
	<div class="container-fulid">
		<div class="col-md-12">
			<h1 align="center">修改基本信息</h1>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<form name="form1" method="post"
				action="/Technology/AdminController/update/${adminBean.username }.action">
				<c:if test="${status==1}">
					<div class='alert alert-danger' role='alert'>更新失败</div>
				</c:if>
				<c:if test="${status==2}">
					<div class='alert alert-danger' role='alert'>信息有误！请重新重录！否则，无法进行下面的操作！</div>
				</c:if>
				<c:if test="${status==0}">
					<div class="alert alert-success" role="alert">更新成功</div>
				</c:if>

				<div class="col-md-1"></div>
				<div class="col-md-12">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td>用户名</td>
								<td>${adminBean.username }</td>
								<td>机构代码</td>
								<td><input class="form-control" name="code" type="text"
									id="code" value="${adminBean.code }" placeholder="机构代码" /></td>
							</tr>
							<tr>
								<td>姓名</td>
								<td><input class="form-control" name="name" type="text"
									id="name" value="${adminBean.name }" placeholder="姓名" /></td>
								<td>身份证号</td>
								<td><input class="form-control" name="id_number"
									type="text" value="${adminBean.id_number }" id="id_number"
									placeholder="身份证号" /></td>
							</tr>
							<tr>
								<td colspan="1">性别</td>
								<td colspan="1"><input type="radio" name="sex" value="男"> 男
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
									name="sex" value="女"> 女</td>
								<td>国家/省份</td>
								<td colspan="1">
									<div id="types" class="col-md-10">
										<div class="col-md-5">
											<select name="ProvinceId" class="form-control"
												onchange="chCity(this)" id="province0">
												<option value="0">-- 请选择省 --</option>
												<c:forEach items="${provinceBeans }" var="item">
													<option value="${item.id}">${item.name}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>工作单位</td>
								<td><input class="form-control" name="unit" type="text"
									id="unit" placeholder="工作单位" /></td>
								<td>专业方向</td>
								<td><input class="form-control" name="direction"
									type="text" value="${adminBean.direction }" id="direction"
									placeholder="专业方向" /></td>
							</tr>
							<tr>
								<td>所在行业</td>
								<td><input class="form-control" name="industry" type="text"
									value="${adminBean.industry }" id="industry" placeholder="所在行业" /></td>
								<td>教育程度</td>
								<td><input class="form-control" name="levels" type="text"
									id="levels" value="${adminBean.levels }" placeholder="教育程度" /></td>
							</tr>
							<tr>
								<td>职称</td>
								<td><input class="form-control" name="title" type="text"
									id="title" value="${adminBean.title }" placeholder="职称" /></td>
								<td>通讯地址</td>
								<td><input class="form-control" name="address" type="text"
									value="${adminBean.address }" id="address" placeholder="通讯地址" /></td>
							</tr>
							<tr>
								<td>邮政编码</td>
								<td><input class="form-control" name="postal" type="text"
									id="postal" value="${adminBean.postal }" placeholder="邮政编码" /></td>
								<td>手机</td>
								<td><input class="form-control" name="phone" type="tel"
									id="phone" value="${adminBean.phone }" placeholder="手机" /></td>
							</tr>
							<tr>
								<td>固定电话</td>
								<td><input class="form-control" name="telephone"
									type="text" value="${adminBean.telephone }" id="telephone"
									placeholder="固定电话" /></td>
								<td>邮箱</td>
								<td><input class="form-control" name="email" type="email"
									id="email" value="${adminBean.email }" placeholder="邮箱" /></td>
							</tr>
							<tr>
								<td>QQ</td>
								<td><input class="form-control" name="qq" type="text"
									id="qq" value="${adminBean.qq}" placeholder="QQ" /></td>
								<td>MSN</td>
								<td><input class="form-control" name="msn" type="text"
									id="msn" value="${adminBean.msn }" placeholder="MSN" /></td>
							</tr>
						</tbody>
					</table>
				</div>
				<input class="form-control btn btn-info" type="submit"
					onClick="return check()" value="确认修改">
			</form>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-12"></div>
	</div>
</body>
</html>