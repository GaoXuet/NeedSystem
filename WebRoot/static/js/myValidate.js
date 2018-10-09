$().ready(function() {

	// 自定义验证规则
	$.validator.addMethod("email", function(value, element) {
		var emailReg = /.*@.*\.?.*?\.(com|cn)$/;
		return this.optional(element) || (emailReg.test(value));
	}, "请正确填写您的邮箱");

	$.validator.addMethod("notblank", function(value, element) {
		var pwdblank = /^\S*$/;
		return this.optional(element) || (pwdblank.test(value));
	}, "不可包含空格");

	$.validator.addMethod("phone", function(value, element) {
		var numberReg = /^[1][3458][0-9]{9}$/;
		return this.optional(element) || (numberReg.test(value));
	}, "请正确填写您的手机号码");
	$.validator.addMethod("iden", function(value, element) {
		var idenReg = /(^\d{15}$)|(^\d{17}([0-9]|X)$)/; // 验证身份证号的
		return this.optional(element) || (idenReg.test(value));
	}, "请正确填写您的身份证号");
	$.validator.addMethod("youbian", function(value, element) {
		var emailReg = /^[0-9][0-9]{5}$/;
		return this.optional(element) || (emailReg.test(value));
	}, "请正确填写您的邮政编码");
	$.validator.addMethod("usernp", function(value, element) {
		var usernameReg = /^[0-9_][0-9_]{5,20}$/;
		return this.optional(element) || (usernameReg.test(value));
	}, "请正确填写您的用户名");
	$.validator.addMethod("passnp", function(value, element) {
		var usernameReg = /^[a-zA-Z0-9_][a-zA-Z0-9_]{5,25}$/;
		return this.optional(element) || (usernameReg.test(value));
	}, "请正确填写您密码");
	$.validator.addMethod("namenp", function(value, element) {
		var nameReg =/^[a-zA-Z\u4e00-\u9fa5]+$/;
		return this.optional(element) || (nameReg.test(value));
	}, "请正确填写您的真实姓名");
	// 规则（把XXX改为相应的表单id）
	$("#checkForm").validate({
		errorElement : 'span',
		errorClass : 'help-block',
		focusInvalid : false,
		rules : {
			username : {
				required : true,
				usernp : true
			},
			password : {
				required : true,
				passnp : true
			},
			password2:{
				required : true,
				equalTo:"#inputPassword"
			},
			code : {
				required : true
			},
			codeCheck:{
				required : true,
				equalTo : "#checkCode"
			},
			quancheng : {
				required : true
			},
			address : {
				required : true
			},
			stress : {
				required : true
			},
			phone : {
				required : true,
				phone : true
			},
			id_number : {
				required : true,
				iden : true
			},
			unit : {
				required : true
			},
			direction : {
				required : true
			},
			industry : {
				required : true
			},
			checknull : {
				required : true
			},
			email : {
				email : true
			},
			daibiao : {
				required : true
			},
			postal : {
				youbian : true
			},
			name : {
				requried : true,
				namenp:true
			}
		},
		messages : {
			username : {
				required : "用户名为空",
				usernp : "用户名格式不正确，6-20位数字"
			},
			codeCheck:{
				required : "验证码为空",
				equalTo :"验证码输入错误"
			},
			password : {
				required : "密码为空",
				passnp : "密码格式不正确，长度大于或等于6位数字/字母/下划线"
			},
			password2 : {
				required : "确认密码为空",
				equalTo : "两次输入不一致"
			},
			code : {
				required : "机构代码为空"
			},
			name : {
				required : "姓名为空",
				namenp:"姓名格式不正确，为汉字"
			},
			phone : {
				required : "手机号为空",
				phone : "请输入正确的手机号"
			},
			id_number : {
				required : "身份证号为空",
				number : "请输入正确的身份证号"
			},
			unit : {
				required : "工作单位为空"
			},
			direction : {
				required : "专业方向为空"
			},
			industry : {
				required : "所在行业为空"
			},
			email : {
				email : "请输入正确的邮箱"
			}
		},
		highlight : function(element) {
			$(element).closest('.form-group').addClass('has-error');
		},
		success : function(label) {
			label.closest('.form-group').removeClass('has-error');
			label.remove();
		},
		errorPlacement : function(error, element) {
			element.parent('div').append(error);
		}
	});
});