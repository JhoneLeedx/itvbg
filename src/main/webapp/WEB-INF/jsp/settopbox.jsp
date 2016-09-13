<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/bootstrap/css/style.css" />
<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery-1.9.1.min.js"></script>
</head>
<body>

	<div class="table">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<th>序号</th>
					<th>品牌</th>
					<th>型号</th>
					<th>系统信息</th>
					<th>是否支持IPTV</th>
					<th>是否支持想家通话</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="itvStb">
						<tr>
							<td>${itvStb.mId }</td>
							<td>
							    <c:choose>
									<c:when test="${!empty itvStb.mBrand }">
						                 ${itvStb.mBrand }
						            </c:when>
									<c:otherwise>
									    未填写
						           </c:otherwise>
								</c:choose>
						    </td>
						    <td>
							    <c:choose>
									<c:when test="${!empty itvStb.mModel }">
						                 ${itvStb.mModel }
						            </c:when>
									<c:otherwise>
									    未填写
						           </c:otherwise>
								</c:choose>
						    </td>
						    <td>
							    <c:choose>
									<c:when test="${!empty itvStb.mSysInfo }">
						                 ${itvStb.mSysInfo }
						            </c:when>
									<c:otherwise>
									    未填写
						           </c:otherwise>
								</c:choose>
						    </td>
						    
						    <td>
							    <c:choose>
									<c:when test="${itvStb.mIsIptv==0 }">
						                                            不支持
						            </c:when>
						            <c:when test="${itvStb.mIsIptv==1 }">
						                                            支持
						            </c:when>
									<c:otherwise>
									    未填写
						           </c:otherwise>
								</c:choose>
						    </td>
						    <td>
							    <c:choose>
									<c:when test="${itvStb.mIsMediaCall==0 }">
						                                            不支持
						            </c:when>
						            <c:when test="${itvStb.mIsMediaCall==1 }">
						                                            支持
						            </c:when>
									<c:otherwise>
									    未填写
						           </c:otherwise>
								</c:choose>
						    </td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>

</body>
</html>