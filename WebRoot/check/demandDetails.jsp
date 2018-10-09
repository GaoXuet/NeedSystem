<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>详细信息</title>
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
	font-size: x-large
}

.STYLE2 {
	color: #FF0000
}
-->
</style>
<script language="JavaScript">
	function sele() {
		document.getElementById("tr").style.display = "none";
		document.getElementById("tr2").style.display = "none";
	}
	function sele2() {
		document.getElementById("tr").style.display = "";
		document.getElementById("tr2").style.display = "";
	}
</script>
</head>
<body>
	<div class="container-fulid">
		<div class="col-md-12">
			<h1 align="center">详细内容</h1>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-10">
	<form id="form1" name="form1" method="post"
		action="/Technology/DemandController/check/${demandBean.WJID }.action">
		<c:if test="${status==1}">
			<div class='alert alert-success' role='alert'>审核完成</div>
		</c:if>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td colspan="1">调查问卷编号</td>
					<td colspan="3">${demandBean.WJID }</td>
				</tr>
				<tr>
					<td><span class="STYLE2">*</span>机构全称</td>
					<td>${demandBean.JGMC }</td>
					<td>归口管理部门</td>
					<td>${demandBean.GLBM }</td>
				</tr>
				<tr>
					<td><span class="STYLE2">*</span>通讯地址</td>
					<td>${demandBean.TXDZ }</td>
					<td><span class="STYLE2">*</span>所在地域</td>
					<td>${demandBean.SZDY }</td>
				</tr>
				<tr>
					<td>网址</td>
					<td>${demandBean.DWWZ }</td>
					<td><span class="STYLE2">*</span>电子邮箱</td>
					<td>${demandBean.DZYX }</td>
				</tr>
				<tr>
					<td><span class="STYLE2">*</span>法人代表</td>
					<td>${demandBean.FRDB }</td>
					<td>邮政编码</td>
					<td>${demandBean.YZBM }</td>
				</tr>
				<tr>
					<td>固定电话</td>
					<td>${demandBean.GDDH }
						<div id="dBphone" class="STYLE2" style="display: none"></div>
					</td>
					<td><span class="STYLE2">*</span>移动电话</td>
					<td>${demandBean.YDDH }
						<div id="dBtel" class="STYLE2" style="display: none"></div>
					</td>
				</tr>
				<tr>
					<td><span class="STYLE2">*</span>联系</td>
					<td>${demandBean.LXR }</td>
					<td>传真</td>
					<td>${demandBean.CZ }</td>
				</tr>
				<tr>
					<td colspan="1"><span class="STYLE2">*</span>机构属性</td>
					<td colspan="3"><label class="radio-inline">
							${demandBean.JGSX }</label> <label class="radio-inline"></label></td>
				</tr>
				<tr>
					<td colspan="4"><span class="STYLE2">*</span>机构简介（主要包括基本情况、现有研究基础等）</td>
				</tr>
				<tr>
					<td colspan="4">${demandBean.JGJJ }
						<div id="dBintroduction" class="STYLE2" style="display: none"></div>
					</td>
				</tr>
				<tr>
					<td colspan="1"><span class="STYLE2">*</span>技术需求名称</td>
					<td colspan="3">${demandBean.JSXQMC }</td>
				</tr>
				<tr>
					<td colspan="1"><span class="STYLE2">*</span>需求年限</td>
					<td colspan="3">${demandBean.QSXQNF }年至${demandBean.JZXQNF } 年
						<div id="dByear" class="STYLE2" style="display: none"></div>
					</td>
				</tr>
				<tr>
					<td colspan="4"><p>
							<span class="STYLE2">*</span>技术需求概述
						</p></td>
				</tr>
				<tr>
					<td colspan="4">&nbsp;1、主要问题（需要解决的重大技术问题)2、技术关键（所需的关键技术、主要指标)3、预期目标（技术创新型、经济社会效益）</td>
				</tr>
				<tr>
					<td colspan="4"><div id="dBsummary1" class="STYLE2"
							style="display: none"></div></td>
				</tr>
				<tr>
					<td colspan="4">${demandBean.ZDKJXQGS }</td>
				</tr>
				<tr>
					<td colspan="4"><div id="dBsummary2" class="STYLE2"
							style="display: none"></div></td>
				</tr>
				<tr>
					<td colspan="4"><div id="dBsummary3" class="STYLE2"
							style="display: none"></div></td>
				</tr>
				<tr>
					<td colspan="1"><span class="STYLE2">*</span>关键字<em>(至少填写一个关键字，逐个输入)</em></td>
					<td colspan="3">${demandBean.GJZ }</td>
				</tr>
				<tr>
					<td><span class="STYLE2">*</span>拟投入资金总额(万元)</td>
					<td colspan="3">${demandBean.NTR }</td>
				</tr>
				<tr>
					<td rowspan="2"><span class="STYLE2">*</span>技术需求解决方式</td>
					<td colspan="3">${demandBean.JSXQHZMS }</td>
				</tr>
				<tr>
					<td colspan="3">合作意向单位：${demandBean.HZYXDW }</td>
				</tr>
				<tr>
					<td><span class="STYLE2">*</span>科技活动类型</td>
					<td colspan="3"><label class="radio-inline"></label> <label
						class="radio-inline">${demandBean.YJLX }</label></td>
				</tr>
				<tr>
					<td><span class="STYLE2">*</span>学科分类<em>（限基础研究）</em></td>
					<td colspan="3">${demandBean.XKFL1 },${demandBean.XKFL2 },${demandBean.XKFL3 }</td>
				</tr>
				<tr>
					<td><span class="STYLE2">*</span>需求技术所属领域<em>（非基础研究填写）</em></td>
					<td colspan="3"><p>&nbsp; &nbsp;${demandBean.XQJSSSLY }</p></td>
				</tr>
				<tr>
					<td><span class="STYLE2">*</span>需求技术应用行业</td>
					<td colspan="3">${demandBean.XQJSYYHY1 },${demandBean.XQJSYYHY2 },${demandBean.XQJSYYHY3 }</td>
				</tr>
				<tr>
					<td colspan="4"><p align="center">&nbsp;</p>
						<p align="center">
							<input type="radio" id="SFSH1" name="SFSH" value="1"
								onClick="sele()"> 同意 <input type="radio" id="SFSH2"
								name="SFSH" value="2" onClick="sele2()"> 不同意


						</p>
						<p align="center">&nbsp;</p></td>
				</tr>
				<tr id="tr" style="display: none">
					<td colspan="4"><p align="left">
							<span class="STYLE2">*</span>审核意见
						</p></td>
				</tr>
				<tr id="tr2" style="display: none">
					<td colspan="4"><textarea name="V" id="V" class="form-control"
							rows="8"></textarea></td>
				</tr>
			</tbody>
		</table>
		<p>&nbsp;</p>
		<input class="form-control btn btn-info" type="submit" value="确认审核">
	</form>
	</div>
		<div class="col-md-1"></div>
		<div class="col-md-12"></div>
	</div>
</body>

</html>