<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台管理</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="bootstrap/css/main.css" />
<script src="bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="top col-lg-12 col-md-12">
				<img class="logo" src="images/logo.png" /> <span class="company">家庭医生后台数据管理</span>
				<button class="btn btn-default">退出登录</button>
				<div class="admin">
					当前管理员：<span>Ultrame</span>
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
					<li>地区管理
				</ul>
			</div>
			<div class="span10 content-right">
				<iframe  src="<%=request.getContextPath() %>/address/showAddress"></iframe>
			</div>
		</div>
	</div>
</body>
</html>