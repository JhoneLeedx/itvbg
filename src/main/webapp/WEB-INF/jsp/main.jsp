
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

<title>Insert title here</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		地区管理 <span class="c-gray en">&gt;</span> 地区管理 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="mt-20">
		<table
			class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">

					<th>地区编码</th>
					<th>地区名称</th>
					<th>地区简称</th>
					<th>地区ID</th>
					<th>微信公众号</th>
					<th>Logo标识</th>
					<th>状态(正常/禁用)</th>
					<th>创建时间</th>
					<th>信息完整</th>
					<th>区域视频菜单</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="itvaddress">
						<tr class="text-c">
							<td>${itvaddress.mAreaCode }</td>
							<td>${itvaddress.mAreaName }</td>
							<td>${itvaddress.mShortName }</td>
							<td><c:choose>
									<c:when test="${itvaddress.mAddressId>0 }">
						${itvaddress.mAddressId }
						</c:when>
									<c:otherwise>
						不存在
						</c:otherwise>
								</c:choose></td>
							<td><c:choose>
									<c:when test="${!empty itvaddress.mWXQrcodeImageURL }">
										<img alt="" src="${itvaddress.mWXQrcodeImageURL }"
											style="width: 50px">
									</c:when>
									<c:otherwise>
						不存在
						</c:otherwise>
								</c:choose></td>
							<td><c:choose>
									<c:when test="${!empty itvaddress.mLogoIMageURL }">
										<img alt="" src="${itvaddress.mLogoIMageURL }"
											style="width: 50px">
									</c:when>
									<c:otherwise>
						不存在
						</c:otherwise>
								</c:choose></td>
							<td><c:choose>
									<c:when test="${itvaddress.mState==1 }">正常</c:when>
									<c:when test="${itvaddress.mState==0 }">禁用</c:when>
								</c:choose></td>
							<td><fmt:formatDate value="${itvaddress.mCreateTime }"
									pattern="YYYY-MM-dd hh:mm:ss" /></td>
							<td><c:choose>
									<c:when test="${itvaddress.mIsFull==1 }">完整</c:when>
									<c:when test="${itvaddress.mIsFull==0 }">信息不完整</c:when>
								</c:choose></td>
							<td><c:if test="${itvaddress.mAddressCode!=''}">
									<a data-title="视频菜单管理" onclick="Hui_admin_tab(this)" class="btn btn-primary radius"
										_href="<%=path%>/itvmenu/allMenu?codevalue=${itvaddress.mAddressCode}&shortname=${itvaddress.mShortName}&pageNow=1">
										视频菜单管理</a>
								</c:if></td>
							<td><a title="编辑"
								onclick="showModify('编辑','<%=path%>/address/editAddress?id=${itvaddress.mId}')"><i
									class="Hui-iconfont">&#xe6df;</i>编辑</a> <c:choose>
									<c:when test="${itvaddress.mState==1 }">
										<a onclick="disOropen('${itvaddress.mAreaCode}',0)"><i
											class="Hui-iconfont">&#xe6e2;</i>禁用</a>
									</c:when>
									<c:otherwise>
										<a onclick="disOropen('${itvaddress.mAreaCode}',1)"><i
											class="Hui-iconfont">&#xe6e2;</i>启用</a>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<!-- 分页开始 -->
	<div align="center" style="margin-top: 20px">
		<c:choose>
			<c:when test="${page.totalPageCount==0}">
			</c:when>
			<c:otherwise>
				<div>
					<font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第
						${page.pageNow} 页</font> <a
						href="<%=path%>/address/showAddress?pageNow=1">首页</a>
					<c:choose>
						<c:when test="${page.pageNow - 1 > 0}">
							<a
								href="<%=path%>/address/showAddress?pageNow=${page.pageNow - 1}">上一页</a>
						</c:when>
						<c:when test="${page.pageNow - 1 <= 0}">
							<a href="<%=path%>/address/showAddress?pageNow=1">上一页</a>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.totalPageCount==0}">
							<a href="<%=path%>/address/showAddress?pageNow=${page.pageNow}">下一页</a>
						</c:when>
						<c:when test="${page.pageNow + 1 < page.totalPageCount}">
							<a
								href="<%=path%>/address/showAddress?pageNow=${page.pageNow + 1}">下一页</a>
						</c:when>
						<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
							<a
								href="<%=path%>/address/showAddress?pageNow=${page.totalPageCount}">下一页</a>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.totalPageCount==0}">
							<a href="<%=path%>/address/showAddress?pageNow=${page.pageNow}">尾页</a>
						</c:when>
						<c:otherwise>
							<a
								href="<%=path%>/address/showAddress?pageNow=${page.totalPageCount}">尾页</a>
						</c:otherwise>
					</c:choose>

				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
<script type="text/javascript">
   
	function showModify(title,url,w,h){
		layer_show(title,url,w,h);
	}
	function disOropen(mAreaCode,state){
		if(state==0){
			layer.confirm('确认要禁用吗？',function(index){
				delAddress(mAreaCode,state);
			});
		}else{
			layer.confirm('确认要启用吗？',function(index){
				delAddress(mAreaCode,state);
			});
		}
	}
    function delAddress(areacode,state) {
		$.ajax({
			url:"<%=path%>/address/del",
			data : {
				"areacode" : areacode,
				"state" : state
			},
			ache : false,
			dataType : "text",
			async : true,
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			error : function() {
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