
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
	src="<%=path%>/bootstrap/js/jquery.form.js"></script>
<title>Insert title here</title>
</head>
<c:choose>
	<c:when test="${!empty admin }">
		<body>
			<nav class="breadcrumb">
				<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
				公众号管理 <span class="c-gray en">&gt;</span>公众号管理 <a
					class="btn btn-success radius r"
					style="line-height: 1.6em; margin-top: 3px"
					href="javascript:location.replace(location.href);" title="刷新"><i
					class="Hui-iconfont">&#xe68f;</i></a>
			</nav>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"><a class="btn btn-primary radius"
					onclick="showAdd('添加公众号信息','<%=path%>/itvwx/addwx')"
					href="javascript:;"><i class="Hui-iconfont">&#xe600;</i>添加公众号信息</a></span>
			</div>
			<div class="mt-20">
				<table
					class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th>序号</th>
							<th>微信公众号名称</th>
							<th>微信公众号图片</th>
							<th>状态</th>
							<th>创建（更新）时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty list }">
							<c:forEach items="${list }" var="wx">
								<tr class="text-c">
									<td>${wx.mId }</td>
									<td>${wx.mName }</td>
									<td><img alt="" src="${wx.mWxUrl }" style="width: 25px"></td>
									<td><c:choose>
											<c:when test="${wx.mState==1 }">正常</c:when>
											<c:when test="${wx.mState==0 }">禁用</c:when>
										</c:choose></td>
									<td><fmt:formatDate value="${wx.mCreateTime}"
											pattern="yyyy-MM-dd" /></td>
									<td><a
										onclick="editWx('添加公众号信息','<%=path%>/itvwx/editwx?id=${wx.mId }')">
											<i class="Hui-iconfont">&#xe6df;</i>编辑
									</a> <c:choose>
											<c:when test="${wx.mState==1 }">
												<a onclick="deldiv(${wx.mId},0)"><i class="Hui-iconfont">&#xe6e2;</i>禁用</a>
											</c:when>
											<c:when test="${wx.mState==0 }">
												<a onclick="deldiv(${wx.mId},1)"><i class="Hui-iconfont">&#xe6e2;</i>启用</a>
											</c:when>
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
						<div>
							<font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第
								${page.pageNow} 页</font> <a href="<%=path%>/itvwx/all?pageNow=1">首页</a>
							<c:choose>
								<c:when test="${page.pageNow - 1 > 0}">
									<a href="<%=path%>/itvwx/all?pageNow=${page.pageNow - 1}">上一页</a>
								</c:when>
								<c:when test="${page.pageNow - 1 <= 0}">
									<a href="<%=path%>/itvwx/all?pageNow=1">上一页</a>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${page.totalPageCount==0}">
									<a href="<%=path%>/itvwx/all?pageNow=${page.pageNow}">下一页</a>
								</c:when>
								<c:when test="${page.pageNow + 1 < page.totalPageCount}">
									<a href="<%=path%>/itvwx/all?pageNow=${page.pageNow + 1}">下一页</a>
								</c:when>
								<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
									<a href="<%=path%>/itvwx/all?pageNow=${page.totalPageCount}">下一页</a>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${page.totalPageCount==0}">
									<a href="<%=path%>/itvwx/all?pageNow=${page.pageNow}">尾页</a>
								</c:when>
								<c:otherwise>
									<a href="<%=path%>/itvwx/all?pageNow=${page.totalPageCount}">尾页</a>
								</c:otherwise>
							</c:choose>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</body>
	</c:when>
</c:choose>
<script type="text/javascript">

	function showAdd(title,url,w,h) {
		layer_show(title,url,w,h);
	}
	function editWx(title,url,w,h) {
		layer_show(title,url,w,h);
	}
	function deldiv(id,state){
		if(state==0){
			layer.confirm('确认要禁用吗？',function(index){
				delWx(id,state)
			});
		}else{
			layer.confirm('确认要启用吗？',function(index){
				delWx(id,state)
			});
		}
	}
	function delWx(id,state) {
		$.ajax({
			data:{"id":id,"state":state},
			url:"<%=path%>/itvwx/del",
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