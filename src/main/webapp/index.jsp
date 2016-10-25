<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>家庭医生数据管理后台</title>
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon" />
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
						<button class="btn btn-default" onclick="logout()">退出登录</button>
						<div class="admin">
							当前管理员：<span>${admin.mAdminName }</span>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="height: 40px"></div>
			
				<div class="container-fluid content">
					<div class="row-fluid">
						<div class="span2 content-left">
							<div class="accordion">
								<div class="accordion-group">
									<div class="accordion-heading">
										<h4
											style="background-color: #2B89BC; padding: 10px; color: white;">
											家庭医生数据管理列表</h4>
									</div>
								<ul>
									<li><a target="right" href="<%=path%>/address/showAddress">地区管理</a></li>
									<li><a target="right" href="<%=path%>/itvstb/all">机顶盒管理</a></li>
									<li><a target="right" href="<%=path%>/itvwx/all">公众号管理</a></li>
									<c:if test="${admin.mLevel==1 }">
										<li><a target="right" href="<%=path%>/admin/adminlist">登录管理</a></li>
									</c:if>
									<li><a target="right" href="<%=path%>/itvpic/itvpiclist">图片管理</a></li>
								</ul>
								</div>
							</div>
						</div>
						<div class="span10 content-right" style="overflow: hidden;">
							<iframe name="right" src="<%=request.getContextPath()%>/address/home"
								class="iframe"></iframe>
						</div>
					</div>
				</div>
		<%-- 	<div class="container-fluid content">
				<div class="row-fluid">
					<div class="span2 content-left">
						<div class="accordion">
							<div class="accordion-group">
								<div class="accordion-heading">
									<div style="background-color: #97C1D7; padding: 5px">
										<h4>
											<img src="images/list.png">数据管理列表
										</h4>
									</div>
								</div>
								<ul>
									<li><a target="right" href="<%=path%>/address/showAddress">地区管理</a></li>
									<li><a target="right" href="<%=path%>/itvstb/all">机顶盒管理</a></li>
									<li><a target="right" href="<%=path%>/itvwx/all">公众号管理</a></li>
									<c:if test="${admin.mLevel==1 }">
										<li><a target="right" href="<%=path%>/admin/adminlist">登录管理</a></li>
									</c:if>
									<li><a target="right" href="<%=path%>/itvpic/itvpiclist">图片管理</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="span10 content-right" style="overflow: hidden;">
						<iframe name="right"
							src="<%=request.getContextPath()%>/address/home" class="iframe"></iframe>
					</div>
				</div>
			</div> --%>
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
			dataType : "text",
			error : function() {
				alert("联系管理员");
			},
			success : function(data) {
				location.href = "login.jsp"
			}
		});
	}
</script>
</html>