<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/static/bootstrap-3.3.5-dist/css/bootstrap.css" />
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">



<script type="text/javascript"
	src="${pageContext.request.contextPath }/static/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<style type="text/css">
<!--
.STYLE1 {
	font-size: x-large
}
-->
</style>
<script type="text/javascript">	


	function ch() {
		alert("重置完毕！");
	}
	
</script>
</head>
<body>
	<div class="container-fulid">
		<div class="col-md-12">
			<h1 align="center">用户管理</h1>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<p>&nbsp;</p>
			<c:if test="${adminBeans!=null }">
				<div class="col-md-13">
					<table class="table table-striped">
						<tr>
							<td></td>
							<td>用户名</td>
							<td>姓名</td>
							<td>身份证号</td>
							<td>角色</td>
							<td>重置密码</td>
							<td></td>
						</tr>
						<c:forEach items="${adminBeans }" var="item" varStatus="status">
							<form name="form1" method="post"
								action="/Technology/AdminController/updatePassword/${item.username }.action">
								<tr>
									<td><button id="${item.username }" name="${item.username }" class="btn btn-default btn-sm"
											data-toggle="modal" data-target="#myModal">详情 ▷</button></td>
									<td>${item.username }</td>
									<td>${item.name }</td>
									<td>${item.id_number }</td>
									<td><c:if test="${item.status==0}">管理员</c:if> <c:if
											test="${item.status==1}">网络审核员</c:if> <c:if
											test="${item.status==2}">注册用户</c:if> <c:if
											test="${item.status==3}">此用户还未通过审核</c:if></td>
									<td><input id="password" name="password" type="password"
										class="form-control" value="${item.password }"></td>
									<td><input class="btn btn-info" type="submit"
										onClick="ch()" value="确认重置"></td>
								</tr>
							</form>
						</c:forEach>
					</table>
				</div>
			</c:if>
		</div>
	</div>

	<p>&nbsp;</p>
	
	
	<!-- <div id="types"></div> -->
		<!-- 模态框（Modal） -->
											
	<%-- <c:forEach items="${adminBeans }" var="item" varStatus="status">						
		<c:if test="${item.username=='123' }">				
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">×</button>
												<h4 class="modal-title" id="myModalLabel">用户信息</h4>
											</div>
											<div class="modal-body">
												<table>
													<tr>
														<td><div align="center">
																<strong>用户名:</strong></strong>
															</div></td>
														<td><div>${item.username }</div></td>
														<td><strong>机构代码:</strong></strong></td>
														<td>${item.code }</td>
													</tr>
													<tr>
														<td><strong>姓名:</strong></td>
														<td>${item.name }</td>
														<td><strong>身份证号:</strong></td>
														<td>${item.id_number }</td>
													</tr>
													<tr>
														<td><strong>性别:</strong></td>
														<td>${item.sex }</td>
														<td><strong>国家/省份:</strong></td>
														<td>${item.provinceId },${item.cityId }</td>
													</tr>
													<tr>
														<td><strong>工作单位:</strong></td>
														<td>${item.unit }</td>
														<td><strong>专业方向:</strong></td>
														<td>${item.direction }</td>
													</tr>
													<tr>
														<td><strong>所在行业:</strong></td>
														<td>${item.industry }</td>
														<td><strong>教育程度:</strong></td>
														<td>${item.levels }</td>
													</tr>
													<tr>
														<td><strong>职称:</strong></td>
														<td>${item.title }</td>
														<td><strong>通讯地址:</strong></td>
														<td>${item.address }</td>
													<tr>
														<td><strong>邮政编码:</strong></td>
														<td>${item.postal }</td>
														<td><strong>手机:</strong></td>
														<td>${item.phone }</td>
													</tr>
													<tr>
														<td><strong>固定电话:</strong></td>
														<td>${item.telephone }</td>
														<td><strong>邮箱:</strong></td>
														<td>${item.email }</td>
													</tr>
													<tr>
														<td><strong>QQ:</strong></td>
														<td>${item.qq }</td>
														<td><strong>MSN:</strong></td>
														<td>${item.msn }</td>
													</tr>
													<tr>
														<td><strong>角色:</strong></td>
														<td><c:if test="${item.status==0}">管理员</c:if> <c:if
																test="${item.status==1}">网络审核员</c:if> <c:if
																test="${item.status==2}">注册用户</c:if> <c:if
																test="${item.status==3}">此用户还未通过审核</c:if></td>
													</tr>
												</table>


												按下 ESC 按钮退出。
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary"
													data-dismiss="modal">关闭</button>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- /.modal -->
								<script>
									$(function() {
										$('#myModal').modal({
											keyboard : true
										})
									});
								</script>
								</c:if>
</c:forEach> --%>

</body>

</html>