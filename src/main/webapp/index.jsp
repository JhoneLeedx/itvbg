<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<!--[endif]-->
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]-->
<script type="text/javascript"
	src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js"></script>
<script>DD_belatedPNG.fix('*');</script>
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon" />
<title>家庭医生数据管理后台</title>
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
			<header class="navbar-wrapper">
				<div class="navbar navbar-fixed-top">
					<div class="container-fluid cl">
						<a class="logo navbar-logo f-l mr-10 hidden-xs"
							href="/aboutHui.shtml">家庭医生后台管理系统</a> <a
							class="logo navbar-logo-m f-l mr-10 visible-xs"
							href="/aboutHui.shtml"></a> <span
							class="logo navbar-slogan f-l mr-10 hidden-xs">v1.0</span> <a
							aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
							href="javascript:;">&#xe667;</a>
						<nav id="Hui-userbar"
							class="nav navbar-nav navbar-userbar hidden-xs">
							<ul class="cl">
								<c:choose>
									<c:when test="${admin.mLevel==1 }">
										<li>超级管理员</li>
									</c:when>
									<c:otherwise>
										<li>普通管理员</li>
									</c:otherwise>
								</c:choose>

								<li class="dropDown dropDown_hover"><a href="#"
									class="dropDown_A">${admin.mAdminName }<i
										class="Hui-iconfont">&#xe6d5;</i></a>
									<ul class="dropDown-menu menu radius box-shadow">
										<li><a onclick="logout()">退出</a></li>
									</ul></li>
								<li id="Hui-msg"><a href="#" title="消息"><span
										class="badge badge-danger">1</span><i class="Hui-iconfont"
										style="font-size: 18px">&#xe68a;</i></a></li>
								<li id="Hui-skin" class="dropDown right dropDown_hover"><a
									href="javascript:;" class="dropDown_A" title="换肤"><i
										class="Hui-iconfont" style="font-size: 18px">&#xe62a;</i></a>
									<ul class="dropDown-menu menu radius box-shadow">
										<li><a href="javascript:;" data-val="default"
											title="默认（黑色）">默认（黑色）</a></li>
										<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
										<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
										<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
										<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
										<li><a href="javascript:;" data-val="orange" title="绿色">橙色</a></li>
									</ul></li>
							</ul>
						</nav>
					</div>
				</div>
			</header>
			<aside class="Hui-aside">
				<div class="menu_dropdown bk_2">
					<dl id="menu-article">
						<dt>
							<i class="Hui-iconfont">&#xe616;</i> 地区管理<i
								class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
						</dt>
						<dd>
							<ul>
								<li><a _href="<%=path%>/address/showAddress"
									data-title="地区管理" href="javascript:void(0)">地区管理</a></li>
							</ul>
						</dd>
					</dl>
					<dl id="menu-picture">
						<dt>
							<i class="Hui-iconfont">&#xe613;</i> 图片管理<i
								class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
						</dt>
						<dd>
							<ul>
								<li><a _href="<%=path%>/itvpic/itvpiclist"
									data-title="图片管理" href="javascript:void(0)">图片管理</a></li>
							</ul>
						</dd>
					</dl>
					<dl id="menu-product">
						<dt>
							<i class="Hui-iconfont">&#xe620;</i> 机顶盒管理<i
								class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
						</dt>
						<dd>
							<ul>
								<li><a _href="<%=path%>/itvstb/all" data-title="机顶盒管理"
									href="javascript:void(0)">机顶盒管理</a></li>
								<!-- 	<li><a href="product-category.html" data-title="分类管理" href="javascript:void(0)">分类管理</a></li>
					<li><a href="product-list.html" data-title="产品管理" href="javascript:void(0)">产品管理</a></li> -->
							</ul>
						</dd>
					</dl>
					<dl id="menu-comments">
						<dt>
							<i class="Hui-iconfont">&#xe622;</i> 公众号管理<i
								class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
						</dt>
						<dd>
							<ul>
								<li><a _href="<%=path%>/itvwx/all" data-title="公众号管理"
									href="javascript:;">公众号管理</a></li>
								<!-- <li><a href="feedback-list.html" data-title="意见反馈" href="javascript:void(0)">意见反馈</a></li> -->
							</ul>
						</dd>
					</dl>
					<c:if test="${admin.mLevel==1 }">
						<dl id="menu-admin">
							<dt>
								<i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i
									class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
							</dt>
							<dd>
								<ul>
									<li><a _href="<%=path%>/admin/adminlist"
										data-title="管理员列表" href="javascript:void(0)">管理员列表</a></li>
								</ul>
							</dd>
						</dl>
					</c:if>
				</div>
			</aside>
			<section class="Hui-article-box">
				<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
					<div class="Hui-tabNav-wp">
						<ul id="min_title_list" class="acrossTab cl">
							<li class="active"><span title="我的桌面"
								data-href="<%=request.getContextPath()%>/address/home">我的桌面</span><em></em></li>
						</ul>
					</div>
					<div class="Hui-tabNav-more btn-group">
						<a id="js-tabNav-prev" class="btn radius btn-default size-S"
							href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a
							id="js-tabNav-next" class="btn radius btn-default size-S"
							href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a>
					</div>
				</div>
				<div id="iframe_box" class="Hui-article">
					<div class="show_iframe">
						<div style="display: none" class="loading"></div>
						<iframe scrolling="yes" frameborder="0"
							src="<%=request.getContextPath()%>/address/home"></iframe>
					</div>
				</div>
			</section>

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
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
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