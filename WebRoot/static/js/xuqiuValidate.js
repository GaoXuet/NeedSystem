$().ready(function() {
	
// 自定义验证规则
$.validator.addMethod("email", function(value, element) {   
			var emailReg = /.*@.*\.?.*?\.(com|cn)$/;
			return this.optional(element) || (emailReg.test(value));
		}, "请正确填写您的邮箱");

$.validator.addMethod("notblank", function(value, element) {
    var pwdblank = /^\S*$/;
    return this.optional(element) ||(pwdblank.test(value));
}, "不可包含空格");

$.validator.addMethod("number", function(value, element) {   
	var numberReg = /^[1][3458][0-9]{9}$/;
	return this.optional(element) || (numberReg.test(value));
}, "请正确填写您的手机号码");
$.validator.addMethod("youbian", function(value, element) {   
	var emailReg = /^[0-9][0-9]{5}$/;
	return this.optional(element) || (emailReg.test(value));
}, "请正确填写您的邮编");
$.validator.addMethod("usernp", function(value, element) {   
	var usernameReg = /^[a-zA-Z0-9_][a-zA-Z0-9_]{3,9}$/;
	return this.optional(element) || (usernameReg.test(value));
}, "请正确填写您的用户名/密码");
//规则（把XXX改为相应的表单id）
  $("#checkForm").validate({
	  errorElement : 'span',  
      errorClass : 'help-block',  
      focusInvalid : false,   
	  rules: {
		  username:{
			  	required : true,
				usernp:true
			},
			password:{
				required : true,
				usernp:true
			},
			password2:{
				required : true,
				equalTo:"#password"
			},
			yanzheng:{
				required : true,
				equalTo : "#checkCode"
			},
			quancheng:{
				required : true
			},
			address:{
				required : true
			},
			stress:{
				required : true
			},
			phone: {
				required : true,
				number: true
			},
		   checknull:{
			  required : true
		   },
		   Email:{
			   required : true,
			   email:true
		   },
		  daibiao:{
				  required : true
			   },
		   youbian:{
			   youbian:true
		   },
		   name:{
			   requried:true
		   }
	    },
	    messages: {
	    	username:{
				required : "用户名为空",
				usernp:"用户名格式不正确，4-10位数字/字母/下划线"
			},
			yangzheng:{
				required : "验证码为空",
				equalTo : "验证码输入错误"
			},
			password:{
				required : "密码为空",
				usernp:"密码格式不正确，4-10位数字/字母/下划线"
			},
			password2:{
				required : "确认密码为空",
				equalTo:"两次输入不一致"
			},
			phone:{
				required : "手机号为空",
				number: "请输入正确的手机号"
			},
			checknull:{
				  required : "必填"
			},
			 Email:{
				 required :"邮箱为空",
				   email:"请输入正确的邮箱"
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