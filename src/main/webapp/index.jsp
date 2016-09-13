<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台管理</title>
<script type="text/javascript" src="bootstrap/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="bootstrap/css/main.css" />
<script type="text/javascript">

		var secs = 3; //倒计时的秒数
		var URL;
		function Load(url) {
			URL = url;
			for (var i = secs; i >= 0; i--) {
				window.setTimeout('doUpdate(' + i + ')', (secs - i) * 1000);
			}
		}
		function doUpdate(num) {
			if (num == 0) {
				window.location = URL;
			}
		}
</script>

</head>
<body>
<c:choose>
<c:when test="${!empty admin }">

	<div class="container">
		<div class="row">
			<div class="top col-lg-12 col-md-12">
				<img class="logo" src="images/logo.png" /> <span class="company">家庭医生后台数据管理</span>
				<button class="btn btn-default"
						onclick="logout()">退出登录</button>
				<div class="admin">
					当前管理员：<span>${admin }</span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="nav col-lg-12 col-md-12"></div>
		</div>
		<div class="row-fluid">
			<div class="span2 content-left">
				<ul class="doctor">
					<li><img src="images/list.png">数据管理列表</li>
				</ul>
				<ul class="doctorList">
					<li><a target="right"
						href="<%=path%>/address/showAddress">地区管理</a></li>
						<li><a target="right" href="<%=path%>/itvstb/all">机顶盒管理</a></li>
					<li><a target="right" href="#">公众号管理</a></li>
					<li><a target="right" href="<%=path%>/admin/adminlist">登录管理</a></li>
				</ul>
			</div>
			<div class="span10 content-right">
				<iframe name="right"
					src="<%=request.getContextPath()%>/address/home"></iframe>
			</div>
		</div>
	</div>
	</c:when>
<c:otherwise>
<div style="margin: 20px;">
					<a href="login.jsp">自动跳转未成功？请手动点击跳转</a>
				</div>
				<script type="text/javascript">Load("login.jsp");
				</script>
</c:otherwise>
</c:choose>
</body>
<script type="text/javascript">
     function logout() {
    	 $.ajax({
    		 url:"<%=path%>/admin/logout",
             dataType:"text",
             error: function(){
            	 alert("联系管理员");
			},
			success : function(data) {
				location.href = "login.jsp"
			}
		});

	}
</script>
</html>