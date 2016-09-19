<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>后台登录界面</title>
<script type="text/javascript" src="bootstrap/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/login.css" />
</head>
<body>
	<div id="login">
		<h2>
			<span class="fontawesome-lock"></span>后台登录
		</h2>
		<form>
			<fieldset>
				<p>
					<label for="user">用户名</label>
				</p>
				<p>
					<input type="text" id="user" value="请输入用户名"
						onBlur="if(this.value=='')this.value='请输入用户名'"
						onFocus="if(this.value=='请输入用户名')this.value=''" />
				</p>
				<p>
					<label for="password">密码</label>
				</p>
				<p>
					<input type="password" id="password" value="password"
						onBlur="if(this.value=='')this.value='password'"
						onFocus="if(this.value=='password')this.value=''" />
				</p>
				<p>
					<input type="button" value="登录" onclick="submits()" />
				</p>
			</fieldset>
		</form>

	</div>
	<!-- end login -->
</body>
<script type="text/javascript">
		function submits() {
			console.log("submit");
			var admin = $("#user").val();
			var pass = $("#password").val();
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
		}
</script>
</html>