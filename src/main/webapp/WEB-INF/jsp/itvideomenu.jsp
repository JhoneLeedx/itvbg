<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set value="<%=path%>" var="path"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=path%>/bootstrap/css/style.css" />
<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery-1.9.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<!-- Box -->
	<div class="box">
		<!-- Box Head -->
		<div class="box-head">
			<button class="button" onclick="add()">添加</button>
			<button class="button" onclick="mod()">编辑</button>
			<button class="button" onclick="del()">禁用</button>
			<div class="right">
				<label>搜索</label> <input type="text" class="field small-field" /> <input
					type="submit" class="button" value="搜索" />
			</div>
		</div>
		<!-- End Box Head -->

		<!-- Table -->
		<div class="table">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th>编号</th>
						<th>顺序</th>
						<th>视频描述</th>
						<th>视频链接</th>
						<th>开始时间</th>
						<th>视频长度</th>
						<th>创建时间</th>
						<th>状态</th>
						<th class="ac" id="operation">操作</th>
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
								<td class="last-td"><c:choose>
										<c:when test="${menu.mState==1 }">
											<a onclick="dele(${menu.mId},0)"
												class="ico del">禁用</a>
										</c:when>
										<c:otherwise>
											<a onclick="qiyong(${menu.mId},1)"
												class="ico del">启用</a>
										</c:otherwise>
									</c:choose> <a href="#" class="ico edit">编辑</a></td>
							</tr>

						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<!-- Table -->
	</div>
	<!-- End Box -->
	<div
		style="display: none; width: 100%; height: 100%; position: fixed; top: 0; left: 0;">
		<div class="pop"
			style="width: 500px; height: 360px; overflow: hidden; border-radius: 8px; box-shadow: 0 0 4px 4px #116A9A; background: #f6f6f6; position: fixed; left: 50%; margin: -180px 0 0 -250px; top: 50%;">
			<div class="bg"
				style="height: 36px; background: linear-gradient(#116a9a, skyblue); margin-bottom: 20px;"></div>
			<form:form commandName="menu" action="${path }/itvmenu/insert">
				<fieldset>
					<legend>添加视频菜单文件</legend>
					<form:hidden path="mAreaCode" id="areacode" value="510115" />
					<br />
					<div
						style="width: 360px; margin: 0 auto 45px; border-bottom: 2px solid #e1e1e1;">
						排序的索引
						<form:input path="mIndex" id="index" />
					</div>
					<div
						style="width: 360px; margin: 0 auto 0; border-bottom: 2px solid #e1e1e1;">
						视频的名称
						<form:input path="mTitle" id="title" />
					</div>
					<label>视频的url地址 </label>
					<form:input path="mFileSpec" id="filespec" />
					<br /> <label>视频的开始时间(选填)</label>
					<form:input path="mStartpos" id="startpos" />
					<br /> <label>视频的长度(选填)</label>
					<form:input path="mLength" id="length" />
					<br />
					<div id="buttons">
						<input type="reset" id="reset" value="重置"
							style="border: 1px solid black; background: white; border-radius: 8px; width: 76px; height: 30px; margin: 0 auto; display: block;">
						<input
							style="border: 1px solid black; background: white; border-radius: 8px; width: 76px; height: 30px; margin: 0 auto; display: block;"
							type="submit" id="submit" value="提交">
					</div>
				</fieldset>
			</form:form>
		</div>
	</div>
	<script type="text/javascript">
		$("#operation").hide();
		$(".last-td").hide();
		function mod() {
			$("#operation").show().animate({
				"width" : "100"
			}, 1000);
			$(".last-td").show();
			$(".edit").show();
			$(".del").hide();
			var tr = document.getElementsByTagName("tr");
		}
		function del() {
			$("#operation").show().animate({
				"width" : "100"
			}, 1000);
			$(".last-td").show();
			$(".edit").hide();
			$(".del").show();
			var tr = document.getElementsByTagName("tr");

		}
		
		function dele(id,state){
			
		}
	</script>
</body>
</html>