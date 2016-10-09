<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/bootstrap/css/itvpic.css" />
<link rel="stylesheet" href="<%=path%>/bootstrap/css/style.css" />
<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery.form.js"></script>
</head>
<body>
	<div id="head">
		<ul>
			<li><a onclick="checkTab(1)">指导医院</a></li>
			<li><a onclick="checkTab(2)">社区卫生中心</a></li>
			<li><a onclick="checkTab(3)">药店</a></li>
			<li><a onclick="checkTab(4)">牵头医院</a></li>
		</ul>
	</div>
	<div class="table" id="id1">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<th>序号</th>
					<th>名称</th>
					<th>地址</th>
					<th>图片</th>
					<th>电话</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="itvpic">
						<c:if test="${itvpic.mType==1 }">
							<tr>
								<td>${itvpic.mId }</td>
								<td>${itvpic.mName }</td>
								<td>${itvpic.mAddressName }</td>
								<td><c:if test="${!empty itvpic.mItvpic }">
										<img alt="" src="<%=path %>/itvpic/showImage?type=${itvpic.mType}&itvpic=${itvpic.mItvpic}" style="width: 30px">
									</c:if></td>
								<td>${itvpic.mTelphone }</td>
								<td><a
									onclick="edit(${itvpic.mId },'${itvpic.mName }',${itvpic.mType })"
									class="ico edit">编辑</a></td>
							</tr>
						</c:if>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<div class="table" id="id2" style="display: none">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<th>序号</th>
					<th>名称</th>
					<th>地址</th>
					<th>图片</th>
					<th>电话</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="itvpic">
						<c:if test="${itvpic.mType==2 }">
							<tr>
								<td>${itvpic.mId }</td>
								<td>${itvpic.mName }</td>
								<td>${itvpic.mAddressName }</td>
								<td><c:if test="${!empty itvpic.mItvpic }">
										<img alt="" src="<%=path %>/itvpic/showImage?type=${itvpic.mType}&itvpic=${itvpic.mItvpic}" style="width: 30px">
									</c:if></td>
								<td>${itvpic.mTelphone }</td>
								<td><a
									onclick="edit(${itvpic.mId },'${itvpic.mName }',${itvpic.mType })"
									class="ico edit">编辑</a></td>
							</tr>
						</c:if>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<div class="table" id="id3" style="display: none">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<th>序号</th>
					<th>名称</th>
					<th>地址</th>
					<th>图片</th>
					<th>电话</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="itvpic">
						<c:choose>
							<c:when test="${itvpic.mType==3 }">
								<tr>
									<td>${itvpic.mId }</td>
									<td>${itvpic.mName }</td>
									<td>${itvpic.mAddressName }</td>
									<td><c:if test="${!empty itvpic.mItvpic }">
											<img alt="" src="<%=path %>/itvpic/showImage?type=${itvpic.mType}&itvpic=${itvpic.mItvpic}" style="width: 30px">
										</c:if></td>
									<td>${itvpic.mTelphone }</td>
									<td><a
										onclick="edit(${itvpic.mId },'${itvpic.mName }',${itvpic.mType })"
										class="ico edit">编辑</a></td>
								</tr>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<div class="table" id="id4" style="display: none">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<th>序号</th>
					<th>名称</th>
					<th>地址</th>
					<th>图片</th>
					<th>电话</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="itvpic">
						<c:if test="${itvpic.mType==10000 }">
							<tr>
								<td>${itvpic.mId }</td>
								<td>${itvpic.mName }</td>
								<td>${itvpic.mAddressName }</td>
								<td><c:if test="${!empty itvpic.mItvpic }">
										<img alt="" src="<%=path %>/itvpic/showImage?type=${itvpic.mType}&itvpic=${itvpic.mItvpic}" style="width: 30px">
									</c:if></td>
								<td>${itvpic.mTelphone }</td>
								<td><a
									onclick="edit(${itvpic.mId },'${itvpic.mName }',${itvpic.mType })"
									class="ico edit">编辑</a></td>
							</tr>
						</c:if>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<div id="div">
		<div id="edit">
			<form id="itvpicUpload" enctype="multipart/form-data">
				<h2 style="font-style: oblique; margin-left: 20px; margin-top: 10px">编辑</h2>
				<input style="display: none" type="text" name="type" id="type">
				<div style="margin-left: 130px; margin-top: 30px">
					<label>序号</label><input type="text" id="mid" name="id"
						style="border: none; background: #f6f6f6; margin-left: 20px"
						readonly="readonly" /><br />
				</div>
				<div style="margin-left: 130px; margin-top: 30px">
					<label>名称</label><input type="text" value="医院名称为：" id="name"
						style="border: none; background: #f6f6f6; margin-left: 20px"
						readonly="readonly" class="same noBorder" /> <br />
				</div>
				<div style="margin-left: 130px; margin-top: 30px">
					<input type="file" name="itvpic" /><br />
				</div>
				<div style="margin-left: 180px; margin-top: 50px">
					<input type="button" style="width: 70px" value="上传"
						onclick="itvPicUpload()" /> <input type="reset"
						style="width: 70px" value="取消" onclick="cancle()" />
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	function checkTab(num) {
		var i = 0;
		for (i = 1; i <= 4; i++) {
			if (i == num)
				document.getElementById("id" + i).style.display = "block";
			else
				document.getElementById("id" + i).style.display = "none";
		}
	}
	function edit(id,name,type) {
		document.getElementById("div").style.display = "block";
		$("#mid").val(id);
		$("#name").val(name);
		$("#type").val(type);
	}
	function itvPicUpload() {
          $("#itvpicUpload").ajaxSubmit({
			   url:"<%=path%>/itvpic/itvpicUpload",
			   type:"post",
			   dataType : "text",
			   contentType: "application/x-www-form-urlencoded; charset=utf-8",  
				error : function() {
					alert("请与管理员联系");
				},
	           success: function(data) {  
	        	   alert(data);
	        	   location.reload();
	              }
          });
	}
	function cancle() {
		document.getElementById("div").style.display = "none";
	}
</script>
</html>