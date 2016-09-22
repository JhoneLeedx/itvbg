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
		<h2>后台登录</h2>
		<form>
			<fieldset>

				<p>
					<input type="text" id="user" placeholder="请输入用户名"/>
				</p>
				<p>
					<input type="password" id="password" placeholder="请输入密码"/>
				</p>
				<p>
					<input type="text" id="code" placeholder="请输入验证码" 
						onblur="checkCode()" style="width: 250px;" />
					<img
						style="vertical-align: middle; width: 120px"
						id="captchaImage" src="<%=basePath%>/admin/captcha" />
				</p>
				<p>
					<input type="button"  id="sbtn"  disabled="disabled" value="登录" onclick="submits()" />
				</p>
			</fieldset>
		</form>
	</div>
	<!-- end login -->
</body>
<script type="text/javascript">


   function checkCode() {
	   var user = $("#user").val();
	   var password = $("#password").val();
	   var c = $("#code").val();
	 $.ajax({
		 data:{"code":c},
		 url:"<%=path%>/admin/checkCode",
		 ache : false,
			dataType : "text",
			async : true,
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			error : function() {
				alert("请与管理员联系");
			},
			success : function(data) {
				if(data=="right"){
					 if(user==""||password==""){
						 document.getElementById("sbtn").disabled=true;
						 document.getElementById("sbtn").style.background="#D4D4D3";
				   }else{
					     document.getElementById("sbtn").disabled=false;
						 document.getElementById("sbtn").style.background="#80c1d4";
				   }
				}else if(data=="wrong"){
					 document.getElementById("sbtn").disabled=true;
					 document.getElementById("sbtn").style.background="#D4D4D3";
				}
			}
	 });
}
// 更换验证码
$('#captchaImage').click(function() 
{
    $('#captchaImage').attr("src", "<%=basePath%>/admin/captcha?timestamp=" + (new Date()).valueOf());
    c = $("#code").val("");
    document.getElementById("code").focus();
}); 

    document.onkeydown=function(e){
	  	var keycode=document.all?event.keyCode:e.which;
	  	 	if(keycode==13){
	  			 submits();
	  			}
	  		}

		function submits() {
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
	}
</script>
</html>