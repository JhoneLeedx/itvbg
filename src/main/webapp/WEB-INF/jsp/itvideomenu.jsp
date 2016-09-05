<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=path%>/bootstrap/css/main.css" />
<link rel="stylesheet" href="<%=path%>/bootstrap/css/modify.css" />

<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery-1.9.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>

   <div>${shortName }:视频管理菜单</div>
	<div>
		<table>
			<thead>
				<tr class="tableHead">
				    <th>编号</th>
					<th>顺序</th>
					<th>视频描述</th>
					<th>视频链接</th>
					<th>开始时间</th>
					<th>视频长度</th>
					<th>创建时间</th>
				</tr>
			</thead>
			<tbody>

				<c:if test="${!empty menuList }">
					<c:forEach items="${menuList }" var="menu">
						<tr>
						    <td>${menu.mId }</td>
							<td>${menu.mIndex }</td>
							<td>${menu.mTitle }</td>
							<td>${menu.mFileSpec }</td>
							<td>${menu.mStartpos }</td>
							<td>${menu.mLength }</td>
							<td>
								 <fmt:formatDate value="${menu.mCreatetime }" pattern="YYYY-MM-dd hh:mm:ss"/> 
							</td>
						</tr>

					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>