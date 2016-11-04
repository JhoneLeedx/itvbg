
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
		图片管理 <span class="c-gray en">&gt;</span> 图片管理 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div id="tab-system" class="HuiTab">
		<div class="tabBar cl">
			<span>指导医院</span><span>社区卫生中心</span><span>药店</span><span>牵头医院</span>
		</div>
		<div class="tabCon">
			<div class="mt-20">
				<table
					class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th>序号</th>
							<th>名称</th>
							<th>地址</th>
							<th>图片</th>
							<th>电话</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty list1 }">
							<c:forEach items="${list1 }" var="itvpic1">
								<tr class="text-c">
									<td>${itvpic1.mId }</td>
									<td>${itvpic1.mName }</td>
									<td>${itvpic1.mAddressName }</td>
									<td><c:if test="${!empty itvpic1.mItvpic }">
											<img alt=""
												src="<%=path %>/itvpic/showImage?type=${itvpic1.mType}&itvpic=${itvpic1.mItvpic}"
												style="width: 30px">
										</c:if></td>
									<td>${itvpic1.mTelphone }</td>
									<td><a
										onclick="edit('图片编辑','<%=path%>/itvpic/editpic?id=${itvpic1.mId}')">
										<i class="Hui-iconfont">&#xe6df;</i>编辑</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
					</tbody>
				</table>
				<div align="center" style="margin-top: 20px">
					<c:choose>
						<c:when test="${page1.totalPageCount==0}">
						</c:when>
						<c:otherwise>
							<div>
								<font size="2">共 ${page1.totalPageCount} 页</font> <font size="2">第
									${page1.pageNow} 页</font> <a
									href="<%=path%>/itvpic/itvpiclist?pageNow=1">首页</a>
								<c:choose>
									<c:when test="${page1.pageNow - 1 > 0}">
										<a
											href="<%=path%>/itvpic/itvpiclist?pageNow=${page1.pageNow - 1}">上一页</a>
									</c:when>
									<c:when test="${page1.pageNow - 1 <= 0}">
										<a href="<%=path%>/itvpic/itvpiclist?pageNow=1">上一页</a>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${page1.totalPageCount==0}">
										<a href="<%=path%>/itvpic/itvpiclist?pageNow=${page1.pageNow}">下一页</a>
									</c:when>
									<c:when test="${page1.pageNow + 1 < page1.totalPageCount}">
										<a
											href="<%=path%>/itvpic/itvpiclist?pageNow=${page1.pageNow + 1}">下一页</a>
									</c:when>
									<c:when test="${page1.pageNow + 1 >= page1.totalPageCount}">
										<a
											href="<%=path%>/itvpic/itvpiclist?pageNow=${page1.totalPageCount}">下一页</a>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${page1.totalPageCount==0}">
										<a href="<%=path%>/itvpic/itvpiclist?pageNow=${page1.pageNow}">尾页</a>
									</c:when>
									<c:otherwise>
										<a
											href="<%=path%>/itvpic/itvpiclist?pageNow=${page1.totalPageCount}">尾页</a>
									</c:otherwise>
								</c:choose>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div class="tabCon">
			<div class="mt-20">
				<table
					class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th>序号</th>
							<th>名称</th>
							<th>地址</th>
							<th>图片</th>
							<th>电话</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty list2 }">
							<c:forEach items="${list2 }" var="itvpic2">
								<tr class="text-c">
									<td>${itvpic2.mId }</td>
									<td>${itvpic2.mName }</td>
									<td>${itvpic2.mAddressName }</td>
									<td><c:if test="${!empty itvpic2.mItvpic }">
											<img alt=""
												src="<%=path %>/itvpic/showImage?type=${itvpic2.mType}&itvpic=${itvpic2.mItvpic}"
												style="width: 30px">
										</c:if></td>
									<td>${itvpic2.mTelphone }</td>
									<td><a
										onclick="edit('图片编辑','<%=path%>/itvpic/editpic?id=${itvpic2.mId}')">
										<i class="Hui-iconfont">&#xe6df;</i>编辑</a></td>
								</tr>

							</c:forEach>
						</c:if>
					</tbody>
				</table>
				<div align="center" style="margin-top: 20px">
					<c:choose>
						<c:when test="${page2.totalPageCount==0}">
						</c:when>
						<c:otherwise>
							<div>
								<font size="2">共 ${page2.totalPageCount} 页</font> <font size="2">第
									${page2.pageNow} 页</font> <a
									href="<%=path%>/itvpic/itvpiclist?pageNow=1">首页</a>
								<c:choose>
									<c:when test="${page2.pageNow - 1 > 0}">
										<a
											href="<%=path%>/itvpic/itvpiclist?pageNow=${page2.pageNow - 1}">上一页</a>
									</c:when>
									<c:when test="${page2.pageNow - 1 <= 0}">
										<a href="<%=path%>/itvpic/itvpiclist?pageNow=1">上一页</a>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${page2.totalPageCount==0}">
										<a href="<%=path%>/itvpic/itvpiclist?pageNow=${page2.pageNow}">下一页</a>
									</c:when>
									<c:when test="${page2.pageNow + 1 < page2.totalPageCount}">
										<a
											href="<%=path%>/itvpic/itvpiclist?pageNow=${page2.pageNow + 1}">下一页</a>
									</c:when>
									<c:when test="${page2.pageNow + 1 >= page2.totalPageCount}">
										<a
											href="<%=path%>/itvpic/itvpiclist?pageNow=${page2.totalPageCount}">下一页</a>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${page2.totalPageCount==0}">
										<a href="<%=path%>/itvpic/itvpiclist?pageNow=${page2.pageNow}">尾页</a>
									</c:when>
									<c:otherwise>
										<a
											href="<%=path%>/itvpic/itvpiclist?pageNow=${page2.totalPageCount}">尾页</a>
									</c:otherwise>
								</c:choose>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

		</div>
		<div class="tabCon">
			<div class="mt-20">
				<table
					class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th>序号</th>
							<th>名称</th>
							<th>地址</th>
							<th>图片</th>
							<th>电话</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>


						<c:if test="${!empty list3 }">
							<c:forEach items="${list3 }" var="itvpic3">
								<tr class="text-c">
									<td>${itvpic3.mId }</td>
									<td>${itvpic3.mName }</td>
									<td>${itvpic3.mAddressName }</td>
									<td><c:if test="${!empty itvpic3.mItvpic }">
											<img alt=""
												src="<%=path %>/itvpic/showImage?type=${itvpic3.mType}&itvpic=${itvpic3.mItvpic}"
												style="width: 30px">
										</c:if></td>
									<td>${itvpic3.mTelphone }</td>
									<td><a
										onclick="edit('图片编辑','<%=path%>/itvpic/editpic?id=${itvpic3.mId}">
										<i class="Hui-iconfont">&#xe6df;</i>编辑</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				<div align="center" style="margin-top: 20px">
					<c:choose>
						<c:when test="${page3.totalPageCount==0}">
						</c:when>
						<c:otherwise>
							<div>
								<font size="2">共 ${page3.totalPageCount} 页</font> <font size="2">第
									${page3.pageNow} 页</font> <a
									href="<%=path%>/itvpic/itvpiclist?pageNow=1">首页</a>
								<c:choose>
									<c:when test="${page3.pageNow - 1 > 0}">
										<a
											href="<%=path%>/itvpic/itvpiclist?pageNow=${page3.pageNow - 1}">上一页</a>
									</c:when>
									<c:when test="${page3.pageNow - 1 <= 0}">
										<a href="<%=path%>/itvpic/itvpiclist?pageNow=1">上一页</a>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${page3.totalPageCount==0}">
										<a href="<%=path%>/itvpic/itvpiclist?pageNow=${page3.pageNow}">下一页</a>
									</c:when>
									<c:when test="${page3.pageNow + 1 < page3.totalPageCount}">
										<a
											href="<%=path%>/itvpic/itvpiclist?pageNow=${page3.pageNow + 1}">下一页</a>
									</c:when>
									<c:when test="${page3.pageNow + 1 >= page3.totalPageCount}">
										<a
											href="<%=path%>/itvpic/itvpiclist?pageNow=${page3.totalPageCount}">下一页</a>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${page3.totalPageCount==0}">
										<a href="<%=path%>/itvpic/itvpiclist?pageNow=${page3.pageNow}">尾页</a>
									</c:when>
									<c:otherwise>
										<a
											href="<%=path%>/itvpic/itvpiclist?pageNow=${page3.totalPageCount}">尾页</a>
									</c:otherwise>
								</c:choose>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

		</div>
		<div class="tabCon">
			<div class="mt-20">
				<table
					class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th>序号</th>
							<th>名称</th>
							<th>地址</th>
							<th>图片</th>
							<th>电话</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${!empty list4 }">
							<c:forEach items="${list4 }" var="itvpic4">
								<tr class="text-c">
									<td>${itvpic4.mId }</td>
									<td>${itvpic4.mName }</td>
									<td>${itvpic4.mAddressName }</td>
									<td><c:if test="${!empty itvpic4.mItvpic }">
											<img alt=""
												src="<%=path %>/itvpic/showImage?type=${itvpic4.mType}&itvpic=${itvpic4.mItvpic}"
												style="width: 30px">
										</c:if></td>
									<td>${itvpic4.mTelphone }</td>
									<td><a
										onclick="edit('图片编辑','<%=path%>/itvpic/editpic?id=${itvpic4.mId}">
										<i class="Hui-iconfont">&#xe6df;</i>编辑</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				<div align="center" style="margin-top: 20px">
					<c:choose>
						<c:when test="${page4.totalPageCount==0}">
						</c:when>
						<c:otherwise>
							<div>
								<font size="2">共 ${page4.totalPageCount} 页</font> <font size="2">第
									${page4.pageNow} 页</font> <a
									href="<%=path%>/itvpic/itvpiclist?pageNow=1">首页</a>
								<c:choose>
									<c:when test="${page4.pageNow - 1 > 0}">
										<a
											href="<%=path%>/itvpic/itvpiclist?pageNow=${page4.pageNow - 1}">上一页</a>
									</c:when>
									<c:when test="${page4.pageNow - 1 <= 0}">
										<a href="<%=path%>/itvpic/itvpiclist?pageNow=1">上一页</a>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${page4.totalPageCount==0}">
										<a href="<%=path%>/itvpic/itvpiclist?pageNow=${page4.pageNow}">下一页</a>
									</c:when>
									<c:when test="${page4.pageNow + 1 < page4.totalPageCount}">
										<a
											href="<%=path%>/itvpic/itvpiclist?pageNow=${page4.pageNow + 1}">下一页</a>
									</c:when>
									<c:when test="${page4.pageNow + 1 >= page4.totalPageCount}">
										<a
											href="<%=path%>/itvpic/itvpiclist?pageNow=${page4.totalPageCount}">下一页</a>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${page4.totalPageCount==0}">
										<a href="<%=path%>/itvpic/itvpiclist?pageNow=${page4.pageNow}">尾页</a>
									</c:when>
									<c:otherwise>
										<a
											href="<%=path%>/itvpic/itvpiclist?pageNow=${page4.totalPageCount}">尾页</a>
									</c:otherwise>
								</c:choose>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

		</div>
	</div>
</body>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="<%=path%>/lib/layer/2.1/layer.js"></script>
<script type="text/javascript"
	src="<%=path%>/lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript"
	src="<%=path%>/lib/jquery.validation/1.14.0/messages_zh.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript"
	src="<%=path%>/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	$.Huitab("#tab-system .tabBar span","#tab-system .tabCon","current","click","0");
});
</script>
<script type="text/javascript">

	function edit(title,url,w,h){
		layer_show(title,url,w,h);
	}

</script>
</html>