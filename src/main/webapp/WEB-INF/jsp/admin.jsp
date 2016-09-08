<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/bootstrap/css/style.css" />
</head>
<body>
<!-- Box -->
	<div class="box">
		<!-- Box Head -->
		<div class="box-head">
			<button class="button" onclick="add()">添加</button>
		</div>
		<!-- End Box Head -->

		<!-- Table -->
		<div class="table">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th>ID</th>
						<th>用户名</th>
						<th>用户密码</th>
						<th>用户级别</th>
						<th>用户类型</th>
						<th>状态</th> 
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
								<td><fmt:formatDate value="${menu.mCreatetime }"
										pattern="YYYY-MM-dd hh:mm:ss" /></td>
								<td><c:choose>
										<c:when test="${menu.mState==1 }">
										正常
										</c:when>
										<c:otherwise>
										禁用
										</c:otherwise>
									</c:choose></td>
								<td ><c:choose>
										<c:when test="${menu.mState==1 }">
											<a onclick="dele(${menu.mId},0)" class="ico del">禁用</a>
										</c:when>
										<c:otherwise>
											<a onclick="qiyong(${menu.mId},1)" class="ico del">启用</a>
										</c:otherwise>
									</c:choose> <a
									onclick="edit(${menu.mId },${menu.mIndex },'${menu.mTitle }','${menu.mFileSpec }',${menu.mStartpos },${menu.mLength },${menu.mState })"
									class="ico edit">编辑</a></td>
							</tr>

						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<!-- Table -->
	</div>
	<!-- End Box -->
</body>
</html>