<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>后台登录界面</title>
<script type="text/javascript" src="bootstrap/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/login.css" />
<script>

  function keyLogin(event){
	  var e = event||window.event; 
	  var currentKey = e.keyCode; 
  if (currentKey==13){
	  
	  if(checkCode()){
		  submits(); //调用登录按钮的登录事件
	  }else{
		  console.log(""+checkCode()+"");
	  }
  }//回车键的键值为13
}
</script>
</head>
<body onkeydown="keyLogin(event)">
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
					<input type="text" id="code" placeholder="请输入验证码" size="6" 
						 style="width: 250px;" />
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
					 document.getElementById("code").style="width: 250px;";
					 if(user==""||password==""){
						 document.getElementById("sbtn").disabled=true;
						 document.getElementById("sbtn").style.background="#D4D4D3";
						 flag =  true;
				   }else{
					     document.getElementById("sbtn").disabled=false;
						 document.getElementById("sbtn").style.background="#80c1d4";
						 flag =  false;
				   }
					 flag = true;
				}else if(data=="wrong"){
					 $("#code").val("");
					 document.getElementById("code").style="border:1px solid red;width: 250px;";
					 document.getElementById("sbtn").disabled=true;
					 document.getElementById("sbtn").style.background="#D4D4D3";
					 flag =  false;
				}
			}
	 });
	 return flag;
}
// 更换验证码
$('#captchaImage').click(function() 
{
    $('#captchaImage').attr("src", "<%=basePath%>admin/captcha?timestamp=" + (new Date()).valueOf());
    c = $("#code").val("");
    document.getElementById("code").focus();
}); 
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