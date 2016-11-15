
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="from"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery-1.9.1.min.js"></script>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]-->
<script type="text/javascript" src="<%=path%>/lib/html5.js"></script>
<script type="text/javascript" src="<%=path%>/lib/respond.min.js"></script>
<!-- [endif]-->
<link rel="stylesheet" type="text/css"
	href="<%=path%>/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/static/h-ui.admin/css/style.css" />
<!--[if IE 6]-->
<script type="text/javascript"
	src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js"></script>

<script type="text/javascript" src="<%=path%>/lib/layer/2.1/layer.js"></script>
<script type="text/javascript"
	src="<%=path%>/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript"
	src="<%=path%>/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" 
	src="<%=path%>/bootstrap/js/nextpage.js"></script>
<title>Insert title here</title>
</head>
<c:choose>
	<c:when test="${!empty admin }">
		<body>
			<nav class="breadcrumb">
				<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
				管理员管理 <span class="c-gray en">&gt;</span>管理员列表 <a
					class="btn btn-success radius r"
					style="line-height: 1.6em; margin-top: 3px"
					href="javascript:location.replace(location.href);" title="刷新"><i
					class="Hui-iconfont">&#xe68f;</i></a>
			</nav>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"><a class="btn btn-primary radius"
					onclick="showAdd('添加管理员','<%=path%>/admin/showAddAdmin')"
					href="javascript:;"><i class="Hui-iconfont">&#xe600;</i>添加管理员</a></span>
			</div>
			<div class="mt-20">
				<table
					class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th>序号</th>
							<th>管理员名称</th>
							<th>管理员密码</th>
							<th>管理员级别</th>
							<th>管理员类型</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty list }">
							<c:forEach items="${list }" var="menu">
								<tr class="text-c">
									<td>${menu.mId }</td>
									<td>${menu.mAdminName }</td>
									<td>${menu.mAdminPass }</td>
									<td><c:choose>
											<c:when test="${menu.mLevel==1 }">超级管理员</c:when>
											<c:when test="${menu.mLevel!=1 }">普通管理员</c:when>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${menu.mType==1 }">协同服务</c:when>
											<c:when test="${menu.mType==2 }">Itv后台</c:when>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${admin.mId==menu.mId }">
										当前管理员不允许操作
										</c:when>
											<c:otherwise>
												<a
													onclick="editAdmin('编辑管理员','<%=path%>/admin/showEditAdmin?id=${menu.mId }')"><i
													class="Hui-iconfont">&#xe6df;</i>编辑</a>
												<a onclick="deldiv(${menu.mId})"><i class="Hui-iconfont">&#xe6e2;</i>删除</a>
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<div align="center" style="margin-top: 20px">
				<c:choose>
					<c:when test="${page.totalPageCount==0}">
					</c:when>
					<c:otherwise>
						<div id="nextPage" class="NexPage"></div>
					</c:otherwise>
				</c:choose>
			</div>
		</body>
	</c:when>
</c:choose>
<script type="text/javascript">

NexPage.init({
	Div : "nextPage",
	total : ${page.totalPageCount },
	showPage : ${page.totalPageCount},
	currentPage : ${page.pageNow}, 
	href : "<%=path%>/admin/adminlist?pageNow="
	})
	
	function showAdd(title,url,w,h) {
	layer_show(title,url,w,h);
	}
	function editAdmin(title,url,w,h) {
		layer_show(title,url,w,h);
	}
	function deldiv(id){
			layer.confirm('确认要删除吗？',function(index){
				delAdmin(id)
			});

	}
	   function delAdmin(id) {
			 $.ajax({
				data:{"id":id},
				url:"<%=path%>/admin/del",
				ache:false,
				async:true,
				dataType : "text",
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("请与管理员联系");
					},
				success : function(data) {
					alert(data);
					location.reload();
				}
			 });
		   }
</script>
</html>