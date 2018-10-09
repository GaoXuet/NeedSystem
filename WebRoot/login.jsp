 
 <%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<script
	src="${pageContext.request.contextPath }/static/js/jquery-1.12.1.js"
	type="text/javascript"></script>
<style type="text/css">
.code {
	background-image: url();
	font-family: Arial;
	font-style: italic;
	color: Red;
	border: 0;
	padding: 2px 3px;
	letter-apacing: 3px;
	font-weight: bolder;
}

.unchanged {
	border: 0;
}

.STYLE2 {
	color: #FF0000
}
</style>
<script type="text/javascript">
<!--
	function MM_swapImgRestore() { //v3.0
		var i, x, a = document.MM_sr;
		for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
			x.src = x.oSrc;
	}
	function MM_preloadImages() { //v3.0
		var d = document;
		if (d.images) {
			if (!d.MM_p)
				d.MM_p = new Array();
			var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
			for (i = 0; i < a.length; i++)
				if (a[i].indexOf("#") != 0) {
					d.MM_p[j] = new Image;
					d.MM_p[j++].src = a[i];
				}
		}
	}

	function MM_findObj(n, d) { //v4.01
		var p, i, x;
		if (!d)
			d = document;
		if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
			d = parent.frames[n.substring(p + 1)].document;
			n = n.substring(0, p);
		}
		if (!(x = d[n]) && d.all)
			x = d.all[n];
		for (i = 0; !x && i < d.forms.length; i++)
			x = d.forms[i][n];
		for (i = 0; !x && d.layers && i < d.layers.length; i++)
			x = MM_findObj(n, d.layers[i].document);
		if (!x && d.getElementById)
			x = d.getElementById(n);
		return x;
	}

	function MM_swapImage() { //v3.0
		var i, j = 0, x, a = MM_swapImage.arguments;
		document.MM_sr = new Array;
		for (i = 0; i < (a.length - 2); i += 3)
			if ((x = MM_findObj(a[i])) != null) {
				document.MM_sr[j++] = x;
				if (!x.oSrc)
					x.oSrc = x.src;
				x.src = a[i + 2];
			}
	}
	//-->

	var code; //在全局 定义验证码   
	function createCode() {
		//code = "";
		code="1111";//测试的验证码
		var codeLength = 6;//验证码的长度   
		var checkCode = document.getElementById("checkCode");
		var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C',
				'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
				'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//所有候选组成验证码的字符，当然也可以用中文的   

				/*
		for (var i = 0; i < codeLength; i++) {

			var charIndex = Math.floor(Math.random() * 36); //随机生成1-36的数字并且向下取整，比如取到5.99999那么则为5
			code += selectChar[charIndex]; //code = "" + 你所随机到的位置，这里charIndex就是数组的角标， 取值为字母或者数字

		}
				*/
		//  alert(code);   
		if (checkCode) {
			checkCode.className = "code";
			checkCode.value = code;
		}

	}

	function check() {
		var codeCheck = $("#codeCheck").val();
		var checkCode = $("#checkCode").val();
		if (codeCheck != checkCode) {
			document.getElementById("yanzheng").style.display = "";
			document.getElementById("yanzheng").innerHTML = "验证码错误！";
			return false;
		} else {
			document.getElementById("yanzheng").style.display = "none";
		}
	}

	function tiJiao() {
		if (document.getElementById('username').value == "") {
			alert("用户名为空！");
			return false;
		}
		if (document.getElementById('password').value == "") {
			alert("密码为空！");
			return false;
		}
		if (document.getElementById('codeCheck').value == "") {
			alert("验证码为空！");
			return false;
		}
		if (document.getElementById('codeCheck').value != document
				.getElementById('checkCode').value) {
			return false;
		}

		return true;

	}
	
	
</script>

</head>
<body onload="createCode()" bgcolor="#FFFFFF"
	onLoad="MM_preloadImages('images/login000_06.jpg','images/loging000_07.jpg')">
	<form
		action="/Technology/AdminController/login.action"
		method="post" onSubmit="return tiJiao()">
		<table width="795" height="475" border="0" align="center"
			cellpadding="0" cellspacing="0" id="__01">
			<tr>
				<td colspan="5"><img src="images/login_01.jpg" width="795"
					height="159" alt=""></td>
			</tr>
			<tr>
				<td rowspan="2"><img src="images/login_02.jpg" width="269"
					height="174" alt=""></td>
				<td bgcolor="#CFE5F2"><img src="images/login_03.jpg" width="66"
					height="115" alt=""></td>
				<td colspan="2" bgcolor="#D0E6F3"><table width="100%"
						height="116" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td colspan="2" align="left" valign="bottom" class="lfield"><input
								name="username" id="username" type="text" class="STYLE1"
								style="width: 180px; height: 17px; border: #336699 1px solid"
								tabindex="1" maxlength="26" autofocus></td>
						</tr>
						<tr>
							<td height="32" colspan="2" align="left" valign="bottom"
								class="lfield"><input name="password" id="password"
								type="password" class="STYLE1"
								style="width: 180px; height: 17px; border: #336699 1px solid"
								tabindex="1" maxlength="26"></td>
						</tr>
						<tr>
							<td width="50%" height="29" align="left" valign="bottom"
								class="lfield"><input id="codeCheck" name="codeCheck"
								type="text" class="STYLE1"
								style="width: 100px; height: 17px; border: #336699 1px solid"
								tabindex="1" maxlength="26" onBlur="check()"></td>
							<td><div class='col-md-4'>
									<input type='text' onClick='createCode()' name="checkCode"
										readonly id='checkCode' class='unchanged' style='width: 80px'>
								</div></td>
							<td width="50%" align="left" valign="bottom"></td>
						</tr>
						<tr>
							<td height="30" colspan="1" align="left" valign="bottom"><span
								class="STYLE2" id="yanzheng" style="display: none"></span></td>
						</tr>
					</table></td>
				<td rowspan="2"><img src="images/login_05.jpg" width="262"
					height="174" alt=""></td>
			</tr>
			<tr>
				<td colspan="2"><a onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image12','','images/loging000_06.jpg',1)">
						<input onsubmit="return tiJiao()" type="image"
						src="images/login_06.jpg" name="Image12" width="135" height="59"
						border="0">
				</a></td>
				<td><a
					href="/Technology/AdminController/ProvinceView.action"
					onMouseOut="MM_swapImgRestore()"
					onMouseOver="MM_swapImage('Image13','','images/loging000_07.jpg',1)"><img
						src="images/login_07.jpg" name="Image13" width="129" height="59"
						border="0"></a></td>
			</tr>
			<tr>
				<td colspan="5"><img src="images/login_08.jpg" width="795"
					height="141" alt=""> <c:if test="${status==1}">
						<div class="alert alert-danger" role="alert">用户名不存在,请重新输入！</div>
					</c:if> <c:if test="${status==2}">
						<div class="alert alert-danger" role="alert">密码错误!</div>
					</c:if>
				</td>
			</tr>
			<tr>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="269"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="66"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="69"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="129"
					height="1" alt=""></td>
				<td><img src="images/&#x5206;&#x9694;&#x7b26;.gif" width="262"
					height="1" alt=""></td>
			</tr>
		</table>

	</form>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/static/js/jquery-1.12.1.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/static/js/jquery.validate.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/static/js/myvalidate.js"></script>
</body>
</html>