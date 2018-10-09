<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>河北省重大需求征集图表显示</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/jquery-css3-vote-bar-150326231418/css/style.css" media="screen"
	type="text/css" />
<script src="${pageContext.request.contextPath}/jquery-css3-vote-bar-150326231418/js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/jquery-css3-vote-bar-150326231418/js/index.js" type="text/javascript" charset="utf-8"></script>

</head>
<body>
	<h1>河北省重大需求征集图表显示</h1>
	<hr>
	<br>
	
	<br>
	<div class="skillbar clearfix " data-percent="${tongjibean.weishenhe1 }">
		<div class="skillbar-title" style="background: #d35400;">
			<span>未审核</span>
		</div>
		<div class="skillbar-bar" style="background: #e67e22;"></div>
		<div class="skill-bar-percent">${tongjibean.weishenhe1 }</div>
	</div>
	
	<!-- End Skill Bar -->
	<div class="skillbar clearfix " data-percent="${tongjibean.shenhe1 }">
		<div class="skillbar-title" style="background: #2980b9;">
			<span>已审核</span>
		</div>

		<div class="skillbar-bar" style="background: #3498db;"></div>

		<div class="skill-bar-percent">${tongjibean.shenhe1 }</div>

	</div>
	
	<!-- End Skill Bar -->
	<div class="skillbar clearfix " data-percent="${tongjibean.tongguo1 }">
		<div class="skillbar-title" style="background: #2c3e50;">
			<span>审核通过</span>
		</div>
		<div class="skillbar-bar" style="background: #2c3e50;"></div>
		<div class="skill-bar-percent">${tongjibean.tongguo1 }</div>
	</div>
	
	<!-- End Skill Bar -->
	<div class="skillbar clearfix " data-percent="${tongjibean.tuihui1 }">
		<div class="skillbar-title" style="background: #46465e;">
			<span>退回</span>
		</div>
		<div class="skillbar-bar" style="background: #5a68a5;"></div>
		<div class="skill-bar-percent">${tongjibean.tuihui1 }%</div>
	</div>
	
	
	<!-- End Skill Bar -->
	
	<div style="text-align: center; clear: both;"></div>
	

</body>

</html>