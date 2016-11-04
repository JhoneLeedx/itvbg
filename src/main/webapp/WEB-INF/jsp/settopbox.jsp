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
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	href="<%=path%>/lib/icheck/icheck.css" />
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
<title>Insert title here</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		机顶盒管理 <span class="c-gray en">&gt;</span>机顶盒管理 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="mt-20">
		<div>
			<form action="<%=path%>/itvstb/vague">
				<input type="text" name="search" id="" placeholder="请输入code值"
					style="width: 250px" class="input-text">
				<button name="" id="" class="btn btn-success" type="submit">
					<i class="Hui-iconfont">&#xe665;</i> 搜索
				</button>
			</form>
		</div>
		<table
			class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th>序号</th>
					<th>品牌</th>
					<th>型号</th>
					<th>类型</th>
					<th>机顶盒编码</th>
					<th>浏览器版本信息</th>
					<th>是否支持IPTV</th>
					<th>是否支持想家通话</th>
					<th>备注</th>
					<th>操作</th>
					<c:if test="${!empty list }">
						<c:forEach items="${list }" var="itvStb">
							<tr>
								<td>${itvStb.mId }</td>
								<td><c:choose>
										<c:when test="${!empty itvStb.mBrand }">
						                 ${itvStb.mBrand }
						            </c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${!empty itvStb.mModel }">
						                 ${itvStb.mModel }
						            </c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${!empty itvStb.mType }">
						                 ${itvStb.mType }
						            </c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${!empty itvStb.mSysInfoCode }">
						                 ${itvStb.mSysInfoCode }
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${!empty itvStb.mSysInfo }">
											<c:if test="${fn:length(itvStb.mSysInfo)>20}">
												${fn:substring(itvStb.mSysInfo, 0, 20)}......
										</c:if>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose></td>

								<td><c:choose>
										<c:when test="${itvStb.mIsIptv==0 }">
						                                            不支持
						            </c:when>
										<c:when test="${itvStb.mIsIptv==1 }">
						                                            支持
						            </c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${itvStb.mIsMediaCall==0 }">
						                                            不支持
						            </c:when>
										<c:when test="${itvStb.mIsMediaCall==1 }">
						                                            支持
						            </c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${!empty itvStb.mRemark}">
									     ${itvStb.mRemark}
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose></td>
								<td><a
									onclick="updateStb('编辑机顶盒','<%=path%>/itvstb/showEditstb?id=${itvStb.mId }')">
										<i class="Hui-iconfont">&#xe6df;</i>编辑
								</a> <a onclick="deleteStb(${itvStb.mId})"><i
										class="Hui-iconfont">&#xe6e2;</i>删除</a></td>
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
						${page.pageNow} 页</font> <a href="<%=path%>/itvstb/all?pageNow=1">首页</a>
					<c:choose>
						<c:when test="${page.pageNow - 1 > 0}">
							<a href="<%=path%>/itvstb/all?pageNow=${page.pageNow - 1}">上一页</a>
						</c:when>
						<c:when test="${page.pageNow - 1 <= 0}">
							<a href="<%=path%>/itvstb/all?pageNow=1">上一页</a>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.totalPageCount==0}">
							<a href="<%=path%>/itvstb/all?pageNow=${page.pageNow}">下一页</a>
						</c:when>
						<c:when test="${page.pageNow + 1 < page.totalPageCount}">
							<a href="<%=path%>/itvstb/all?pageNow=${page.pageNow + 1}">下一页</a>
						</c:when>
						<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
							<a href="<%=path%>/itvstb/all?pageNow=${page.totalPageCount}">下一页</a>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.totalPageCount==0}">
							<a href="<%=path%>/itvstb/all?pageNow=${page.pageNow}">尾页</a>
						</c:when>
						<c:otherwise>
							<a href="<%=path%>/itvstb/all?pageNow=${page.totalPageCount}">尾页</a>
						</c:otherwise>
					</c:choose>

				</div>
			</c:otherwise>
		</c:choose>
	</div>
</body>
<script type="text/javascript">
	function updateStb(title,url,w,h) {
		layer_show(title,url,w,h);
	}
	function deleteStb(id){
		layer.confirm('确认要删除吗？',function(index){
			delsumbit(id)
		});
	}
	 function delsumbit(id) {
	    	$.ajax({
	    		data:{"id":id},
	    		url:"<%=path%>/itvstb/delStb",
	    		ache:false,
	    		async:true,
	    		dataType : "text",
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