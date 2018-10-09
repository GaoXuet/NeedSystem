<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>需求征集</title>
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

		/* 其他要求的验证 */
		if (document.getElementById("ZDKJXQGS1").value.length > 500) {
			alert("技术需求概述之主要问题字数超过了500字！");
			return false;
		}
		if (document.getElementById("ZDKJXQGS2").value.length > 500) {
			alert("技术需求概述之技术关键字数超过了500字！");
			return false;
		}
		if (document.getElementById("ZDKJXQGS2").value.length > 500) {
			alert("技术需求概述之预期目标字数超过了500字！");
			return false;
		}
		if (document.getElementById("JGJJ").value.length > 500) {
			alert("机构简介字数超过了500字！");
			return false;
		}

		var phone = document.getElementById("GDDH").value;
		if (!isNum(phone)) {
			alert("需要填写数字！");
			return false;
		}

		var tel = document.getElementById("YDDH").value;
		if (!isNum(tel)) {
			alert("需要填写数字！");
			return false;
		}
		if (tel.length != 11 && tel.length != 0) {
			alert("手机号码为11位！");
			return false;
		}

		var y1 = document.getElementById("QSXQNF").value;
		var y2 = document.getElementById("JZXQNF").value;
		if (parseInt(y1) > parseInt(y2)) {
			alert("起始需求年份应 <= 终止需求年份！");
			return false;
		}
	}

	function check(t) {
		if (document.getElementById("ZDKJXQGS1").value.length > 500) {
			document.getElementById("dBsummary1").style.display = "";
			document.getElementById("dBsummary1").innerHTML = "字数超过了500字！";

			return false;
		} else {
			document.getElementById("dBsummary1").style.display = "none";
		}
		if (document.getElementById("ZDKJXQGS2").value.length > 500) {
			document.getElementById("dBsummary2").style.display = "";
			document.getElementById("dBsummary2").innerHTML = "字数超过了500字！";

			return false;
		} else {
			document.getElementById("dBsummary2").style.display = "none";
		}
		if (document.getElementById("ZDKJXQGS3").value.length > 500) {
			document.getElementById("dBsummary3").style.display = "";
			document.getElementById("dBsummary3").innerHTML = "字数超过了500字！";

			return false;
		} else {
			document.getElementById("dBsummary3").style.display = "none";
		}
	}

	function check2(t) {
		if (document.getElementById("JGJJ").value.length > 500) {
			document.getElementById("dBintroduction").style.display = "";
			document.getElementById("dBintroduction").innerHTML = "机构简介字数超过了500字！";

			return false;
		} else {
			document.getElementById("dBintroduction").style.display = "none";
		}
	}

	function tishi() {
		// 		alert(t.id);
		// 		alert(text);
		document.getElementById("dBname").style.display = "";
		document.getElementById("dBname").innerHTML = "输入单位全称！";
	}
	function allblur(t) {
		// 		alert(t.id);
		var id = t.id;
		var text = document.getElementById(id).value;
		document.getElementById("dBname").style.display = "none";
		// 		alert(text);
		if (CheckCode(text)) {
			document.getElementById("dBname").style.display = "";
			document.getElementById("dBname").innerHTML = "存在特殊字符！";
			//t.focus();
			return false;
		} else {
			document.getElementById("dBname").style.display = "none";
		}
	}

	function aCheck1() {
		document.getElementById("tr1").style.display = "";
		document.getElementById("tr2").style.display = "none";
		document.getElementById("tr3").style.display = "none";
	}

	function bCheck2() {
		document.getElementById("tr1").style.display = "none";
		document.getElementById("tr2").style.display = "";
		document.getElementById("tr3").style.display = "";
	}

	function showOther() {
		if (document.getElementById("other").checked == true) {//被选中
			document.getElementById("o").style.display = "";
		} else {
			document.getElementById("o").style.display = "none";
		}
	}

	function CheckCode(s) //有特殊字符为true   	
	{
		var containSpecial = RegExp(/[(\ )(\~)(\!)(\#)(\$)(\%)(\^)(\&)(\*)(\()(\))(\-)(\_)(\+)(\=)(\[)(\])(\{)(\})(\|)(\\)(\;)(\:)(\')(\")(\,)(\.)(\/)(\<)(\>)(\?)(\)]+/);
		return (containSpecial.test(s));
	}
	function isNum(str) {
		for (ilen = 0; ilen < str.length; ilen++) {
			if (str.charAt(ilen) < '0' || str.charAt(ilen) > '9') {
				return false;
			}
		}
		return true;
	}

	function checkPHone(t) {
		var phone = document.getElementById("GDDH").value;
		if (!isNum(phone)) {
			document.getElementById("dBphone").style.display = "";
			document.getElementById("dBphone").innerHTML = "需要填写数字！";
			return false;
		} else {
			document.getElementById("dBphone").style.display = "none";
		}
	}

	function checkTELphone(t) {
		var tel = document.getElementById("YDDH").value;
		if (!isNum(tel)) {
			document.getElementById("dBtel").style.display = "";
			document.getElementById("dBtel").innerHTML = "需要填写数字！";
			return false;
		} else {
			document.getElementById("dBtel").style.display = "none";
			if (tel.length != 11 && tel.length != 0) {
				document.getElementById("dBtel").style.display = "";
				document.getElementById("dBtel").innerHTML = "手机号码为11位！";
				return false;
			} else {
				document.getElementById("dBtel").style.display = "none";
			}
		}
	}

	//验证金额
	function clearNoNum(obj) {
		obj.value = obj.value.replace(/[^\d.]/g, ""); //清除“数字”和“.”以外的字符  
		obj.value = obj.value.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的  
		obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace(
				"$#$", ".");
		obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3');//只能输入两个小数  
		if (obj.value.indexOf(".") < 0 && obj.value != "") {//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额 
			obj.value = parseFloat(obj.value);
		}
	}

	//验证年份
	function isY() {
		var y1 = document.getElementById("QSXQNF").value;
		var y2 = document.getElementById("JZXQNF").value;
		if (parseInt(y1) > parseInt(y2)) {
			document.getElementById("dByear").style.display = "";
			document.getElementById("dByear").innerHTML = "起始需求年份应 <= 终止需求年份！";
			return false;
		} else {
			document.getElementById("dByear").style.display = "none";
		}

	}

	//验证关键字，至少填一个
	function checkIS() {

		if (document.getElementById("GJZ1").value.length != 0
				|| document.getElementById("GJZ2").value.length != 0
				|| document.getElementById("GJZ3").value.length != 0
				|| document.getElementById("GJZ4").value.length != 0
				|| document.getElementById("GJZ5").value.length != 0) {
			document.getElementById("dBgjz").style.display = "none";
		} else {
			document.getElementById("dBgjz").style.display = "";
			document.getElementById("dBgjz").innerHTML = "至少填一个！";
			return false;
		}
	}

	//基础研究和其他研究的联动，机制
	function aCheck1() {
		document.getElementById("tr1").style.display = "";
		document.getElementById("tr2").style.display = "none";
		document.getElementById("tr3").style.display = "none";
	}
	function bCheck2() {
		document.getElementById("tr1").style.display = "none";
		document.getElementById("tr2").style.display = "";
		document.getElementById("tr3").style.display = "";
	}

	/* 二级学科分类 */
	function chSecondX(obj) {
		$(obj).parent().nextAll().remove();
		var id = obj.value;
		if (id > 0) {
			$
					.post(
							"/Technology/XQController/getSecondX.action",
							{
								id : id

							},
							function(data) {
								if (data != null && data.length > 0) {
									var content = "<div class='col-md-4'> <select name='SecondXId' class='form-control' onchange='chThirdX(this)' id='second0'> <option value='0'>-- 请选择二级学科分类 --</option>";
									for ( var city in data) {
										content += "<option value='"+data[city].name+"'>"
												+ data[city].name + "</option>";
									}
									content += "</select></div>";
									$("#xueke").append(content);
								}
							}, "json");
		}

	}

	/* 三级级学科分类 */
	function chThirdX(obj) {
		$(obj).parent().nextAll().remove();
		var id = obj.value;
		if (id > 0) {
			$
					.post(
							"/Technology/XQController/getThirdX.action",
							{
								id : id

							},
							function(data) {
								if (data != null && data.length > 0) {
									var content = "<div class='col-md-4'> <select name='ThirdXId' class='form-control' id='third0'> <option value='0'>-- 请选择三级级学科分类 --</option>";
									for ( var city in data) {
										content += "<option value='"+data[city].name+"'>"
												+ data[city].name + "</option>";
									}
									content += "</select></div>";
									$("#xueke").append(content);
								}
							}, "json");
		}

	}

	/* 二级国民经济行业分类 */
	function chSecondH(obj) {
		$(obj).parent().nextAll().remove();
		var id = obj.value;
		if (id > 0) {
			$
					.post(
							"/Technology/XQController/getSecondH.action",
							{
								id : id

							},
							function(data) {
								if (data != null && data.length > 0) {
									var content = "<div class='col-md-4'> <select name='SecondHId' class='form-control' onchange='chThirdH(this)' id='second0'> <option value='0'>-- 请选择二级国民经济行业分类 --</option>";
									for ( var city in data) {
										content += "<option value='"+data[city].name+"'>"
												+ data[city].name + "</option>";
									}
									content += "</select></div>";
									$("#guomin").append(content);
								}
							}, "json");
		}

	}

	/* 三级国民经济国民分类 */
	function chThirdH(obj) {
		$(obj).parent().nextAll().remove();
		var id = obj.value;
		if (id > 0) {
			$
					.post(
							"/Technology/XQController/GETThirdH.action",
							{
								id : id

							},
							function(data) {
								if (data != null && data.length > 0) {
									var content = "<div class='col-md-4'> <select name='ThirdHId' class='form-control' id='third0'> <option value='0'>-- 请选择三级国民经济行业分类 --</option>";
									for ( var city in data) {
										content += "<option value='"+data[city].name+"'>"
												+ data[city].name + "</option>";
									}
									content += "</select></div>";
									$("#guomin").append(content);
								}
							}, "json");
		}

	}

	function focusNextInput(thisInput) {
		var inputs = document.getElementsByTagName("input");
		for (var i = 0; i < inputs.length; i++) {
			// 如果是最后一个，则焦点回到第一个
			if (i == (inputs.length - 1)) {
				inputs[0].focus();
				break;
			} else if (thisInput == inputs[i]) {
				inputs[i + 1].focus();
				break;
			}
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
<body onload='document.getElementById("JGMC").focus();'>
	<div class="container-fulid">
		<div class="col-md-12">
			<h1 align="center">河北省重大需求征集</h1>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<form name="form1" method="post"
				action="/Technology/DemandController/addInfo/${admin.username }.action"
				onSubmit="return tiJiao()">
				<c:if test="${status==0}">
					<div class='alert alert-success' role='alert'>添加成功</div>
				</c:if>
				<c:if test="${status==2}">
					<div class="alert alert-danger" role="alert">信息有误！请重新重录！否则，无法进行下面的操作！</div>
				</c:if>
				<c:if test="${status==1}">
					<div class="alert alert-danger" role="alert">添加失败</div>
				</c:if>


				带<span class="STYLE1">*</span>的为必填项
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td colspan="1">调查问卷编号</td>
							<td colspan="3"><input type="text" class="form-control"
								name="WJID" id="WJID" value="${demandBean.WJID }" maxlength="20"
								onkeypress="if(event.keyCode==13) focusNextInput(this);"
								readonly></td>
						</tr>
						<tr>
							<td><span class="STYLE1">*</span>机构全称</td>
							<td><div>
									<input type="text" class="form-control" name="JGMC"
										onFocus="tishi()" onBlur="return allblur(this)" maxlength="50"
										onChange="JZ.value=JGMC.value" id="JGMC"
										value="${demandBean.JGMC }" placeholder="机构名称"
										onkeypress="if(event.keyCode==13) focusNextInput(this);"
										required>
								</div>
								<div id="dBname" class="STYLE1" style="display: none"></div></td>

							<td>归口管理部门</td>
							<td><select name="GLBM" id="GLBM" class="form-control">
									<option value="0" selected>--请选择部门名称--</option>
									<option value="办公室">办公室</option>
									<option value="人事处">人事处</option>
									<option value="机关党委">机关党委</option>
									<option value="政策法规处">政策法规处</option>
									<option value="计划财务处">计划财务处</option>
									<option value="平台与基础处">平台与基础处</option>
									<option value="国际合作处">国际合作处</option>
									<option value="高新技术处">高新技术处</option>
									<option value="农村科技处">农村科技处</option>
									<option value="社会发展处">社会发展处</option>
									<option value="成果与市场处">成果与市场处</option>
									<option value="监察室">监察室</option>
									<option value="离退休干部处">离退休干部处</option>
									<option value="知识产权局">知识产权局</option>
									<option value="半干旱中心">半干旱中心</option>
									<option value="山办">山办</option>
									<option value="机关服务中心">机关服务中心</option>
									<option value="科技研发中心">科技研发中心</option>
									<option value="科技情报研究院">科技情报研究院</option>
									<option value="器材公司">器材公司</option>
									<option value="基金办">基金办</option>
									<option value="档案馆">档案馆</option>
									<option value="科技管理信息中心">科技管理信息中心</option>
									<option value="科技投资中心">科技投资中心</option>
									<option value="成果转换中心">成果转换中心</option>
									<option value="中小企业创新资金管理中心">中小企业创新资金管理中心</option>
									<option value="对外交流中心">对外交流中心</option>

							</select></td>
						</tr>
						<tr>
							<td><span class="STYLE1">*</span>通讯地址</td>
							<td><input type="text" class="form-control" name="TXDZ"
								id="TXDZ" value="${demandBean.TXDZ }" placeholder="通讯地址"
								maxlength="20"
								onkeypress="if(event.keyCode==13) focusNextInput(this);"
								required></td>
							<td><span class="STYLE1">*</span>所在地域</td>
							<td><select name="SZDY" id="SZDY" class="form-control">
									<option value="0" selected>--请选择所在地域--</option>
									<option value="秦皇岛">秦皇岛</option>
									<option value="石家庄">石家庄</option>
									<option value="邯郸">邯郸</option>
									<option value="唐山">唐山</option>
							</select></td>
						</tr>
						<tr>
							<td>网址</td>
							<td><input type="text" class="form-control" name="DWWZ"
								id="DWWZ" placeholder="单位网址" maxlength="30"
								onkeypress="if(event.keyCode==13) focusNextInput(this);"></td>
							<td><span class="STYLE1">*</span>电子邮箱</td>
							<td><input type="text" class="form-control" name="DZYX"
								id="DZYX" placeholder="电子邮箱" maxlength="30"
								onkeypress="if(event.keyCode==13) focusNextInput(this);"
								required></td>
						</tr>
						<tr>
							<td><span class="STYLE1">*</span>法人代表</td>
							<td><input type="text" class="form-control" name="FRDB"
								id="FRDB" placeholder="法人代表"
								onkeypress="if(event.keyCode==13) focusNextInput(this);"
								required></td>
							<td>邮政编码</td>
							<td><input type="text" class="form-control" name="YZBM"
								id="YZBM" value="${demandBean.YZBM }" placeholder="邮政编码"
								onkeypress="if(event.keyCode==13) focusNextInput(this);"
								maxlength="30"></td>
						</tr>
						<tr>
							<td>固定电话</td>
							<td><input type="text" class="form-control" name="GDDH"
								id="GDDH" placeholder="固定电话" onBlur="return checkPHone(this)"
								onkeypress="if(event.keyCode==13) focusNextInput(this);"
								maxlength="20">
								<div id="dBphone" class="STYLE1" style="display: none"></div></td>
							<td><span class="STYLE1">*</span>移动电话</td>
							<td><input type="text" class="form-control" name="YDDH"
								id="YDDH" placeholder="移动电话" onBlur="return checkTELphone(this)"
								onkeypress="if(event.keyCode==13) focusNextInput(this);"
								maxlength="20" required>
								<div id="dBtel" class="STYLE1" style="display: none"></div></td>
						</tr>
						<tr>
							<td><span class="STYLE1">*</span>联系人</td>
							<td><input type="text" class="form-control" name="LXR"
								onkeypress="if(event.keyCode==13) focusNextInput(this);"
								id="LXR" placeholder="联系人" maxlength="10" required></td>
							<td>传真</td>
							<td><input type="text" class="form-control" name="CZ"
								onkeypress="if(event.keyCode==13) focusNextInput(this);" id="CZ"
								placeholder="传真" maxlength="10"></td>
						</tr>


						<tr>
							<td colspan="1"><span class="STYLE1">*</span>机构属性</td>
							<td colspan="3"><label class="radio-inline"> <input
									type="radio" id="JGSX" name="JGSX" value="企业"
									onkeypress="if(event.keyCode==13) focusNextInput(this);"
									checked> 企业
							</label> <label class="radio-inline"> <input type="radio"
									onkeypress="if(event.keyCode==13) focusNextInput(this);"
									id="JGSX" name="JGSX" value="高等院校"> 高等院校
							</label> <label class="radio-inline"> <input type="radio"
									onkeypress="if(event.keyCode==13) focusNextInput(this);"
									id="JGSX" name="JGSX" value="研究机构"> 研究机构
							</label> <label class="radio-inline"> <input type="radio"
									onkeypress="if(event.keyCode==13) focusNextInput(this);"
									id="JGSX" name="JGSX" value="其它"> 其它
							</label></td>
						</tr>
						<tr>
							<td colspan="4"><span class="STYLE1">*</span>机构简介（主要包括基本情况、现有研究基础等，<span
								class="STYLE1">限500字以内</span>）</td>
						</tr>
						<tr>
							<td colspan="4"><textarea name="JGJJ" id="JGJJ"
									class="form-control" rows="8" onBlur="return check2(this)"
									onkeypress="if(event.keyCode==13) focusNextInput(this);"></textarea>
								<div id="dBintroduction" class="STYLE1" style="display: none"></div>
							</td>
						</tr>
						<tr>
							<td colspan="1"><span class="STYLE1">*</span>技术需求名称</td>
							<td colspan="3"><input type="text" class="form-control"
								name="JSXQMC" maxlength="20" id="JSXQMC" placeholder="技术需求名称"
								onkeypress="if(event.keyCode==13) focusNextInput(this);"
								required></td>
						</tr>
						<tr>
							<td colspan="1"><span class="STYLE1">*</span>需求年限</td>
							<td colspan="3">
								<div class="col-md-12">
									<div class="col-md-3">
										<select name="QSXQNF" id="QSXQNF" class="form-control"
											onChange="return isY()">
											<option value="0" selected>--请选择--</option>
											<c:forEach var="year1" begin="2014" step="1" end="2023">
												<option>${year1 }</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-2">年至</div>
									<div class="col-md-3">
										<select name="JZXQNF" id="JZXQNF" class="form-control"
											onChange="return isY()">
											<option value="0" selected>--请选择--</option>
											<c:forEach var="year2" begin="2014" step="1" end="2023">
												<option>${year2 }</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-2">年</div>
								</div>
								<div id="dByear" class="STYLE1" style="display: none"></div>
							</td>
						</tr>
						<tr>
							<td colspan="4"><p>
									<span class="STYLE1">*</span>技术需求概述
								</p></td>
						</tr>
						<tr>
							<td colspan="4">&nbsp;1、主要问题（需要解决的重大技术问题，<span
								class="STYLE1">限500字以内</span>）</td>
						</tr>
						<tr>
							<td colspan="4"><textarea name="ZDKJXQGS1" id="ZDKJXQGS1"
									class="form-control" rows="8" onBlur="return check(this)"
									onkeypress="if(event.keyCode==13) focusNextInput(this);"></textarea>
								<div id="dBsummary1" class="STYLE1" style="display: none"></div>
							</td>
						</tr>
						<tr>
							<td colspan="4">2、技术关键（所需的关键技术、主要指标，<span class="STYLE1">限500字以内</span>）</td>
						</tr>
						<tr>
							<td colspan="4"><textarea name="ZDKJXQGS2" id="ZDKJXQGS2"
									class="form-control" rows="8" onBlur="return check(this)"
									onkeypress="if(event.keyCode==13) focusNextInput(this);"></textarea>
								<div id="dBsummary2" class="STYLE1" style="display: none"></div>
							</td>
						</tr>
						<tr>
							<td colspan="4">3、预期目标（技术创新型、经济社会效益，<span class="STYLE1">限500字以内</span>）</td>
						</tr>
						<tr>
							<td colspan="4"><textarea name="ZDKJXQGS3" id="ZDKJXQGS3"
									class="form-control" rows="8" onBlur="return check(this)"
									onkeypress="if(event.keyCode==13) focusNextInput(this);"></textarea>
								<div id="dBsummary3" class="STYLE1" style="display: none"></div>
							</td>
						</tr>
						<tr>
						  <td colspan="1"><span class="STYLE1">*</span>关键字<em>(至少填写一个关键字，逐个输入)</em></td>
							<td colspan="3"><div>
									<div class="col-md-2">
										<input type="text" name="GJZ1" id="GJZ1"
											onkeypress="if(event.keyCode==13) focusNextInput(this);"
											onBlur="return checkIS()">
									</div>
									<div class="col-md-2">
										<input type="text" id="GJZ2" name="GJZ2"
											onkeypress="if(event.keyCode==13) focusNextInput(this);">
									</div>
									<div class="col-md-2">
										<input type="text" id="GJZ3" name="GJZ3"
											onkeypress="if(event.keyCode==13) focusNextInput(this);">
									</div>
									<div class="col-md-2">
										<input type="text" id="GJZ4" name="GJZ4"
											onkeypress="if(event.keyCode==13) focusNextInput(this);">
									</div>
									<div class="col-md-2">
										<input type="text" id="GJZ5" name="GJZ5"
											onkeypress="if(event.keyCode==13) focusNextInput(this);">
									</div>
								</div></td>
						</tr>
						<tr>
							<td><span class="STYLE1">*</span>拟投入资金总额(万元)</td>
							<td colspan="3"><input type="text" class="form-control"
								onKeyUp="clearNoNum(this)" name="NTR" id="NTR"
								onkeypress="if(event.keyCode==13) focusNextInput(this);"
								placeholder="拟投入资金总额" required></td>
						</tr>
						<tr>
						  <td rowspan="2"><span class="STYLE1">*</span>技术需求解决方式</td>

							<td colspan="3"><label class="checkbox-inline">&nbsp;&nbsp;&nbsp;<input
									type="radio" id="JSXQHZMS" name="JSXQHZMS" value="独立研发"
									onkeypress="if(event.keyCode==13) focusNextInput(this);">
									独立研发
							</label> <label class="checkbox-inline">&nbsp;&nbsp;&nbsp; <input
									type="radio" id="JSXQHZMS" name="JSXQHZMS" value="委托研发"
									onkeypress="if(event.keyCode==13) focusNextInput(this);">
									委托研发
							</label> <label class="checkbox-inline">&nbsp;&nbsp;&nbsp; <input
									type="radio" id="JSXQHZMS" name="JSXQHZMS" value="合作研发"
									onkeypress="if(event.keyCode==13) focusNextInput(this);">
									合作研发&nbsp;&nbsp;&nbsp;
							</label> <label class="checkbox-inline"></label> <label
								class="checkbox-inline"> <input type="radio"
									id="JSXQHZMS" name="JSXQHZMS" value="其他"
									onkeypress="if(event.keyCode==13) focusNextInput(this);">
									其他
							</label></td>
						</tr>
						<tr>
							<td colspan="3"><input type="text" class="form-control"
								name="HZYXDW" id="HZYXDW" placeholder="合作意向单位（选填）"
								onkeypress="if(event.keyCode==13) focusNextInput(this);"></td>
						</tr>
						<tr>
							<td><span class="STYLE1">*</span>科技活动类型</td>
							<td colspan="3"><label class="radio-inline"> <input
									type="radio" id="jichu" name="YJLX" value="基础研究"
									onkeypress="if(event.keyCode==13) focusNextInput(this);"
									onClick="aCheck1()"> 基础研究
							</label><label class="radio-inline"> <input type="radio"
									id="YJLX"
									onkeypress="if(event.keyCode==13) focusNextInput(this);"
									name="YJLX" value="应用研究" onClick="bCheck2()">应用研究
							</label> <label class="radio-inline"> <input type="radio"
									id="YJLX"
									onkeypress="if(event.keyCode==13) focusNextInput(this);"
									name="YJLX" value="试验发展" onClick="bCheck2()">试验发展
							</label> <label class="radio-inline"> <input type="radio"
									id="YJLX"
									onkeypress="if(event.keyCode==13) focusNextInput(this);"
									name="YJLX" value="研究与试验发展成果应用" onClick="bCheck2()">
									研究与试验发展成果应用
							</label> <label class="radio-inline"> <input type="radio"
									id="技YJLX"
									onkeypress="if(event.keyCode==13) focusNextInput(this);"
									name="YJLX" value="技术推广与科技服务" onClick="bCheck2()">
									技术推广与科技服务
							</label> <label class="radio-inline"> <input type="radio"
									id="YJLX"
									onkeypress="if(event.keyCode==13) focusNextInput(this);"
									name="YJLX" value="生产性活动" onClick="bCheck2()"> 生产性活动
							</label></td>
						</tr>
						<tr id="tr1" style="display: none">
							<td><span class="STYLE1">*</span>学科分类<em>（限基础研究填写）</em></td>
							<td colspan="3">
								<!-- （参见学科分类）三级下拉文本框 -->
								<div id="xueke" class="col-md-12">
									<div class="col-md-4">
										<select name="FirstXId" class="form-control"
											onchange="chSecondX(this)" id="first0">
											<option value="0">-- 请选择一级学科分类 --</option>
											<c:forEach items="${firstXBeans }" var="item">
												<option value="${item.name }">${item.name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</td>
						</tr>
						<tr id="tr2" style="display: none">
							<td><span class="STYLE1">*</span>需求技术所属领域<em>（非基础研究填写）</em></td>
							<td colspan="3"><p>
									&nbsp; &nbsp; <input type="checkbox" name="XQJSSSLY"
										id="XQJSSSLY" value="电子信息技术"> 电子信息技术 &nbsp;&nbsp; <input
										type="checkbox" name="XQJSSSLY" id="XQJSSSLY" value="光机电一体化">
									光机电一体化 &nbsp;&nbsp; <input type="checkbox" name="XQJSSSLY"
										id="XQJSSSLY" value="软件"> 软件&nbsp;&nbsp; <input
										type="checkbox" name="XQJSSSLY" id="XQJSSSLY" value="生物制药技术 ">
									生物制药技术
								</p>
								<p>
									&nbsp; &nbsp; <input type="checkbox" name="XQJSSSLY"
										onkeypress="if(event.keyCode==13) focusNextInput(this);"
										id="XQJSSSLY" value="新材料及应用技术"> 新材料及应用技术&nbsp;&nbsp; <input
										type="checkbox" name="XQJSSSLY" id="XQJSSSLY"
										onkeypress="if(event.keyCode==13) focusNextInput(this);"
										value="先进制造技术 "> 先进制造技术 &nbsp;&nbsp; <input
										onkeypress="if(event.keyCode==13) focusNextInput(this);"
										type="checkbox" name="XQJSSSLY" id="XQJSSSLY" value="现代农业技术">
									现代农业技术 &nbsp;&nbsp; <input type="checkbox" name="XQJSSSLY"
										onkeypress="if(event.keyCode==13) focusNextInput(this);"
										id="XQJSSSLY" value="新能源与高校节能技术">
									新能源与高校节能技术&nbsp;&nbsp;&nbsp;
								</p>
								<p>
									&nbsp; &nbsp; <input type="checkbox" name="XQJSSSLY"
										onkeypress="if(event.keyCode==13) focusNextInput(this);"
										id="XQJSSSLY" value="资源与环境保护新技术">
									资源与环境保护新技术&nbsp;&nbsp;&nbsp; <input type="checkbox"
										onkeypress="if(event.keyCode==13) focusNextInput(this);"
										name="XQJSSSLY" id="other" value="其他技术" onClick="showOther()">
									其他技术（注明） <span id="o" style="display: none"> <input
										name="QTJSMS" id="QTJSMS"
										onkeypress="if(event.keyCode==13) focusNextInput(this);"
										type="text" size="20" style="width: 87px; height: 30px"
										maxlength="10">
									</span>
								</p></td>
						</tr>
						<tr id="tr3" style="display: none">
							<td><span class="STYLE1">*</span>需求技术应用行业X</td>
							<td colspan="3">
								<!-- （参见国民经济行业分类）三级下拉文本框 -->
								<div id="guomin" class="col-md-12">
									<div class="col-md-4">
										<select name="FirstHId" class="form-control"
											onchange="chSecondH(this)" id="first0">
											<option value="0">-- 请选择一级国民经济行业 --</option>
											<c:forEach items="${firstHBeans }" var="item">
												<option value="${item.name }">${item.name }</option>
											</c:forEach>
										</select>
									</div>
								</div>


							</td>
						</tr>
					</tbody>
				</table>
				<div class="col-md-1"></div>
				<div class="col-md-12"></div>
				<input class="form-control btn btn-info" type="submit" value="保存并提交">
			</form>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-12"></div>
	</div>
</body>
</html>