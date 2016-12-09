<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String name = "";
	String psw = "";
	String checked = "";
	Cookie[] cookies = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		//遍历Cookie  
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];
			//此处类似与Map有name和value两个字段,name相等才赋值,并处理编码问题   
			if ("name".equals(cookie.getName())) {
				name = cookie.getValue();
				//将"记住我"设置为勾选   
				checked = "checked";
			}
			if ("psw".equals(cookie.getName())) {
				psw = cookie.getValue();
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]-->
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<!--  [endif]-->
<link href="static/h-ui/css/H-ui.min.css" rel="stylesheet"
	type="text/css" />
<link href="static/h-ui.admin/css/H-ui.login.css" rel="stylesheet"
	type="text/css" />
<link href="static/h-ui.admin/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet"
	type="text/css" />
<!--  [endif]-->
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon" />
<title>四川易迅通健康医疗技术发展有限公司</title>
</head>
<body>
	<div class="header">
		<h3 style="color: white; font-style: oblique; margin-left: 30px">家庭医生后台管理系统</h3>
	</div>
	<div class="loginWraper">
		<div id="loginform" class="loginBox">
			<form class="form form-horizontal">
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
					<div class="formControls col-xs-8">
						<input id="user" name="user" type="text" placeholder="请输入用户名"
							class="input-text size-L" value="<%=name %>">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
					<div class="formControls col-xs-8">
						<input id="password" name="password" type="password"
							placeholder="密码" class="input-text size-L" value="<%=psw %>">
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input id="code" class="input-text size-L" type="text"
							placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}"
							onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:"
							style="width: 150px;"> <img id="captchaImage"
							src="<%=basePath%>/admin/captcha"> <a id="kanbuq"
							onclick="check()">看不清，换一张</a>
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input type="checkbox" /><label style="margin-left: 10px">记住密码</label>
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input onclick="submits()" type="button"
							class="btn btn-success radius size-L"
							value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;"> <input
							name="" type="reset" class="btn btn-default radius size-L"
							value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">


   function checkCode() {
	   var user = $("#user").val();
	   var password = $("#password").val();
	   var c = $("#code").val();
	   var flag = false;
	 $.ajax({
		 data:{"code":c},
		 url:"<%=path%>/admin/checkCode",
		 ache : false,
			dataType : "text",
			async : false,
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			error : function() {
				alert("请与管理员联系");
			},
			success : function(data) {
				if(data=="right"){
					 if(user==""||password==""){
						 flag =  true;
				   }else{
						 flag =  false;
				   }
					 flag = true;
				}else if(data=="wrong"){
					 $("#code").val("");
					 flag =  false;
				}
			}
	 });
	 return flag;
}
// 更换验证码
function check() {
	 $('#captchaImage').attr("src", "<%=basePath%>admin/captcha?timestamp=" + (new Date()).valueOf());
	  c = $("#code").val("");
	  document.getElementById("code").focus();
}

		function submits() {
			
			if(checkCode()){
				console.log("submit");
				var admin = $("#user").val();
				var pass = $("#password").val();
				if(admin==""){
					alert("管理员账号不能为空");
					return;
				}
				if(pass==""){
					alert("管理员密码不能为空");
					return;
				}
				$.ajax({
				    data:{"admin":admin,"pass":pass},
					url:"<%=path%>/admin/login",
						ache : false,
						dataType : "text",
						async : true,
						contentType : "application/x-www-form-urlencoded; charset=utf-8",
						error : function() {
							alert("请与管理员联系");
						},
						success : function(data) {
							if (data == "当前管理员不属于家庭医生后台管理，请重新输入") {
								alert(data);
							} else if (data == "不存在当前用户,可能原因账号或密码错误") {
								alert(data);
							} else {
								location.href = "index.jsp"
							}
						}
					});
		} else {
			alert("验证码错误");
		}

	}
	window.document.onkeydown = function(event) {
		if (event.keyCode == 13) {
			submits();
		}
	}
</script>
<div class="footer">四川易迅通健康医疗技术发展有限公司</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
</html>