<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
body {
	margin: 0;
	padding: 0;
	font-size: 12px;
	font-family: "Microsoft Yahei", Verdana, Arial, Helvetica, sans-serif
	
}

.leftMenu {
	min-width: 220px;
	width: 268px;
	margin: 40px auto 0 auto;
}

.menu {
	border: #bdd7f2 1px solid;
	border-top: #0080c4 4px solid;
	border-bottom: #0080c4 4px solid;
	background: #f4f9ff repeat-y right;
	margin-left: 10px;
}

.menu .ListTitle {
	border-bottom: 1px #98c9ee solid;
	display: block;
	text-align: center;
	/*position: relative;*/
	height: 38px;
	line-height: 38px;
	cursor: pointer;
	/*+min-width:220px;*/ +
	width: 100%;
}

.ListTitlePanel {
	position: relative;
}

.leftbgbt {
	position: absolute;
	background: no-repeat;
	width: 11px;
	height: 52px;
	left: -11px;
	top: -4px;
}
/*.leftbgbt {
	float:left;
	background: no-repeat;
	width: 11px;
	height: 52px;
	left: 0px;
	top: 0px;
	zoom:1;
	z-index:200px;
}
*/
.leftbgbt2 {
	position: absolute;
	background: no-repeat;
	width: 11px;
	height: 48px;
	left: -11px;
	top: -1px;
}

.menuList {
	display: block;
	height: auto;
}

.menuList div {
	height: 28px;
	line-height: 24px;
	border-bottom: 1px #98c9ee dotted;
}

.menuList div a {
	display: block;
	background: #fff;
	line-height: 28px;
	height: 28px;
	text-align: center;
	color: #185697;
	text-decoration: none;
}

.menuList div a:hover {
	color: #f30;
	background: #0080c4;
	color: #fff;
}
</style>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/static/js/jquery-1.12.1.js"></script>

<!-- jQuery展开收缩折叠导航菜单代码。 -->
<script type="text/javascript">
	$(document).ready(
			function() {
				var menuParent = $('.menu > .ListTitlePanel > div');//获取menu下的父层的DIV
				var menuList = $('.menuList'); //？？？？具体怎么用，这个是获取到哪里的值
				$('.menu > .menuParent > .ListTitlePanel > .ListTitle').each(
						function(i) {//获取列表的大标题并遍历
							$(this).click(function() {
								if ($(menuList[i]).css('display') == 'none') {
									$(menuList[i]).slideDown(300); //slideDown() 方法以滑动方式显示被选元素。
								} else {
									$(menuList[i]).slideUp(300); //slideUp() 方法以滑动方式隐藏被选元素。
								}
							});
						});
			});
</script>

</head>
<body style="margin-top: -30px;">

	<div class="leftMenu">
		<div class="menu">

			<div class="menuParent">
				<div class="ListTitlePanel">
					<div class="ListTitle">
						<strong>需求管理</strong>
						<div class="leftbgbt"></div>
					</div>
				</div>
				<div class="menuList">
					<!-- <a>标签的mainAction表示规定在何处打开链接文档。 -->
					<div>
						<a target="mainAction"
							href="/Technology/DemandController/info/${admin.username}.action">需求征集</a>
					</div>
					<div>
						<a target="mainAction"
							href="/Technology/DemandController/myList/${admin.username }.action">管理需求</a>
					</div>
					<div>
						<a target="mainAction"
							href="/Technology/DemandController/list.action">需求浏览</a>
					</div>
					<div>
						<a target="mainAction"
							href="/Technology/DemandController/demandList.action">网络审核</a>
					</div>
					
					<!-- 还未更改 -->
					<div>
						<a target="_blank"
							href="${pageContext.request.contextPath }/type/index.jsp">分类浏览</a>
					</div>
					<div>
						<a target="mainAction"
							href="${pageContext.request.contextPath }/first/Type.jsp">综合检索</a>
					</div>
					<div>
						<a target="mainAction"
							href="/Technology/DemandController/tongji.action">图表统计</a>
					</div>
					
				</div>
			</div>
			<div class="menuParent">
				<div class="ListTitlePanel">
					<div class="ListTitle">
						<strong>用户设置</strong>
						<div class="leftbgbt2"></div>
					</div>
				</div>
				<div class="menuList">
					<div>
						<a target="mainAction"
							href="/Technology/AdminController/fenpeiBefore.action">权限管理</a>
					</div>
					<div>
						<a target="mainAction"
							href="/Technology/AdminController/userList.action">用户管理</a>
					</div>
					<div>
						<a target="mainAction"
							href="/Technology/AdminController/ProvinceView.action">用户注册</a>
					</div>
				</div>
			</div>
			<div class="menuParent">
				<div class="ListTitlePanel">
					<div class="ListTitle">
						<strong>个人中心</strong>
						<div class="leftbgbt2"></div>
					</div>
				</div>
				<div class="menuList">
					<div>
						<a target="mainAction"
							href="${pageContext.request.contextPath }/my/myPass.jsp">修改密码</a>
					</div>
					<div>
						<a target="mainAction"
							href="/Technology/AdminController/updateBefore/${admin.username }.action">个人信息</a>
					</div>
					<div>
						<a target="mainAction"
							href="${pageContext.request.contextPath }/help.jsp">帮助文件</a>
					</div>
					<div>
						<a target="_parent"
							href="/Technology/AdminController/end.action">退出登录</a>
					</div>
				</div>
			</div>



		</div>
	</div>
	<div style="text-align: center;"></div>
</body>
</html>