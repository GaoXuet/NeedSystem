<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>用户注册</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap.css" />

<style type="text/css">

.code {
	background-image: url(code.jpg);
	font-family: Arial;
	font-style: italic;
	color: Red;
	border: 0;
	padding: 2px 3px;
	letter-spacing: 3px;
	font-weight: bolder;
}

.unchanged {
	border: 0;
}

.STYLE1 {
	color: #FF0000
}
</style>
<script type="text/javascript">
	var code; //在全局 定义验证码   
	function createCode() {
		code = "";
		var codeLength = 6;//验证码的长度   
		var checkCode = document.getElementById("checkCode");
		var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C',
				'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
				'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//所有候选组成验证码的字符，当然也可以用中文的   

		for (var i = 0; i < codeLength; i++) {

			var charIndex = Math.floor(Math.random() * 36); //随机生成1-36的数字并且向下取整，比如取到5.99999那么则为5
			code += selectChar[charIndex]; //code = "" + 你所随机到的位置，这里charIndex就是数组的角标， 取值为字母或者数字

		}
		//  alert(code);   
		if (checkCode) {
			checkCode.className = "code";
			checkCode.value = code;
		}

	}

	//三级菜单
	/*-------------------------------------------------------------------------------------*/
	function chCity(obj) {
		$(obj).parent().nextAll().remove();
		var id = obj.value;
		if (id > 0) {
			$
					.post(
							"/Technology/CityController/getCity.action",
							{
								id : id

							},
							function(data) {
								if (data != null && data.length > 0) {
									var content = "<div class='col-sm-3' > <select name='CityId' class='form-control'  id='city0'> <option value='0'>-- 请选择市 --</option>";
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
	
	
	
	function check(){
		if (document.getElementById('username').value == "") {
			alert("用户名为空！");
			return false;
		}
		if (document.getElementById('passowrd2').value == "") {
			alert("再次输入的密码为空！");
			return false;
		}
		if (document.getElementById('passowrd').value != document.getElementById('passowrd2').value) {
			alert("两次输入的密码为空！");
			return false;
		}
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
	
	function focusNextInput(thisInput){
        var inputs = document.getElementsByTagName("input");
        for(var i = 0;i<inputs.length;i++){
          // 如果是最后一个，则焦点回到第一个
          if(i==(inputs.length-1)){
            inputs[0].focus();
            break;
          }else if(thisInput == inputs[i]){
            inputs[i+1].focus();
            break;
          }
        }
    }  

	/*-------------------------------------------------------------------------------------*/
</script>
</head>
<body onLoad="createCode()">
	<div class="row-fluid">
		<div class="col-md-3"></div>
		<p>&nbsp;</p>
		<div class="col-md-6">
			<form role="form" method="post" class="form-horizontal"
				action="/Technology/register.action"
				id="checkForm">
				<!-- param表示从表单中获取status-状态值 -->
				<c:if test="${status==0}">
					<div class='alert alert-success' role='alert'>注册成功</div>
				</c:if>
				<c:if test="${status==1}">
					<div class="alert alert-danger" role="alert">注册失败</div>
				</c:if>

				<div class="form-group">
					<label class="col-md-3 control-label" for="username"><span
						class="STYLE1">*</span>用户名</label>
					<div class="col-md-9">
						<input class="form-control" name="username" type="text"
							id="username" placeholder="用户名" onkeypress="if(event.keyCode==13) focusNextInput(this);" autofocus />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="password"><span
						class="STYLE1">*</span>用户密码</label>
					<div class="col-md-9">
						<input type="password" name="password" class="form-control"
							id="inputPassword" onkeypress="if(event.keyCode==13) focusNextInput(this);" placeholder="用户密码" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="password2"><span
						class="STYLE1">*</span>确认用户密码</label>
					<div class="col-md-9">
						<input type="password" name="password2" class="form-control"
							id="password2" onkeypress="if(event.keyCode==13) focusNextInput(this);" placeholder="确认用户密码" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="code"><span
						class="STYLE1">*</span>机构代码</label>
					<div class="col-md-9">
							<select name="code" id="code" class="form-control">
									<c:forEach items="${codeBeans }" var="item">
								<option value="${item.code_num }">${item.code_name }</option>
							</c:forEach>
							</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="name"><span
						class="STYLE1">*</span>姓名</label>
					<div class="col-md-9">
						<input class="form-control" name="name" type="text" id="name"
							placeholder="姓名" onkeypress="if(event.keyCode==13) focusNextInput(this);"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="id_number"><span
						class="STYLE1">*</span>身份证号</label>
					<div class="col-md-9">
						<input class="form-control" name="id_number" type="text"
							id="id_number" placeholder="身份证号" onkeypress="if(event.keyCode==13) focusNextInput(this);"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="sex">性别</label>
					<div class="col-md-9">
						<input type="radio" name="sex" value="男" onkeypress="if(event.keyCode==13) focusNextInput(this);"> 男
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
							name="sex" value="女" onkeypress="if(event.keyCode==13) focusNextInput(this);"> 女
					</div>
				</div>
				<div class="form-group" id="types">
					<label class="col-md-3 control-label" for="city">国家/省份</label>
					<div class="col-sm-3">
						<select name="ProvinceId" class="form-control"
							onchange="chCity(this)" id="province0">
							<option value="0">-- 请选择省 --</option>
							<c:forEach items="${provinceBeans }" var="item">
								<option value="${item.id }">${item.name }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="unit">工作单位</label>
					<div class="col-md-9">
						<input class="form-control" name="unit" type="text" id="unit"
							placeholder="工作单位" onkeypress="if(event.keyCode==13) focusNextInput(this);"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="direction">专业方向</label>
					<div class="col-md-9">
						<input class="form-control" name="direction" type="text"
							id="direction" placeholder="专业方向" onkeypress="if(event.keyCode==13) focusNextInput(this);"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="industry">所在行业</label>
					<div class="col-md-9">
						<input class="form-control" name="industry" type="text"
							id="industry" placeholder="所在行业" onkeypress="if(event.keyCode==13) focusNextInput(this);"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="levels">教育程度</label>
					<div class="col-md-9">
						<input class="form-control" name="levels" type="text" id="levels"
							placeholder="教育程度" onkeypress="if(event.keyCode==13) focusNextInput(this);"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="title">职称</label>
					<div class="col-md-9">
						<input class="form-control" name="title" type="text" id="title"
							placeholder="职称" onkeypress="if(event.keyCode==13) focusNextInput(this);"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="address">通讯地址</label>
					<div class="col-md-9">
						<input class="form-control" name="address" type="text"
							id="address" placeholder="通讯地址" onkeypress="if(event.keyCode==13) focusNextInput(this);"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="postal">邮政编码</label>
					<div class="col-md-9">
						<input class="form-control" name="postal" type="text" id="postal"
							placeholder="邮政编码" onkeypress="if(event.keyCode==13) focusNextInput(this);"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="phone">手机</label>
					<div class="col-md-9">
						<input class="form-control" name="phone" type="tel" id="phone"
							placeholder="手机" onkeypress="if(event.keyCode==13) focusNextInput(this);"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="telephone">固定电话</label>
					<div class="col-md-9">
						<input class="form-control" name="telephone" type="text"
							id="telephone" placeholder="固定电话" onkeypress="if(event.keyCode==13) focusNextInput(this);"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="email">邮箱</label>
					<div class="col-md-9">
						<input class="form-control" name="email" type="email" id="email"
							placeholder="邮箱" onkeypress="if(event.keyCode==13) focusNextInput(this);"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="qq">QQ</label>
					<div class="col-md-9">
						<input class="form-control" name="qq" type="text" id="qq"
							placeholder="QQ" onkeypress="if(event.keyCode==13) focusNextInput(this);"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="msn">MSN</label>
					<div class="col-md-9">
						<input class="form-control" name="msn" type="text" id="msn"
							placeholder="MSN" onkeypress="if(event.keyCode==13) focusNextInput(this);"/>
					</div>
				</div>
				<div class="form-group">
					<!-- lable中的for相当于id -->
					<label class="col-md-3 control-label" for="checkCode">验证码</label>
					<div class="col-md-4">
						<input type="text" name="codeCheck" class="form-control"
							id="codeCheck" placeholder="Code" onkeypress="if(event.keyCode==13) focusNextInput(this);">
					</div>
					<div class="col-md-4">
						<input type="text" onClick="createCode()" readOnly="true"
							id="checkCode" class="unchanged" style="width: 80px" />
					</div>
					<div class="col-md-1"></div>

				</div>
				<div class="form-group"></div>
				<div class="form-group">
					<div class="col-md-offset-3 col-md-9">
						<button type="submit" class="btn btn-primary btn-block"
							onClick="return check()">确认注册</button>
					</div>
				</div>


			</form>
		</div>
		<div class="col-md-3"></div>
	</div>

	<script
		src="${pageContext.request.contextPath}/static/js/jquery-1.12.1.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/js/bootstrap.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/jquery.validate.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/static/js/myValidate.js"
		type="text/javascript"></script>


</body>