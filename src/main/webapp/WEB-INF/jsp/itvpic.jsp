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
				<c:if test="${!empty list1 }">
					<c:forEach items="${list1 }" var="itvpic1">
							<tr>
								<td>${itvpic1.mId }</td>
								<td>${itvpic1.mName }</td>
								<td>${itvpic1.mAddressName }</td>
								<td><c:if test="${!empty itvpic1.mItvpic }">
										<img alt="" src="<%=path %>/itvpic/showImage?type=${itvpic1.mType}&itvpic=${itvpic1.mItvpic}" style="width: 30px">
									</c:if></td>
								<td>${itvpic1.mTelphone }</td>
								<td><a
									onclick="edit(${itvpic1.mId },'${itvpic1.mName }',${itvpic1.mType })"
									class="ico edit">编辑</a></td>
							</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
					<div align="center" style="margin-top: 20px">
				<c:choose>
					<c:when test="${page1.totalPageCount==0}">
					</c:when>
					<c:otherwise>
						<div>
							<font size="2">共 ${page1.totalPageCount} 页</font> <font size="2">第
								${page1.pageNow} 页</font> <a href="<%=path%>/itvpic/itvpiclist?pageNow=1">首页</a>
							<c:choose>
								<c:when test="${page1.pageNow - 1 > 0}">
									<a href="<%=path%>/itvpic/itvpiclist?pageNow=${page1.pageNow - 1}">上一页</a>
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
									<a href="<%=path%>/itvpic/itvpiclist?pageNow=${page1.pageNow + 1}">下一页</a>
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
				<c:if test="${!empty list2 }">
					<c:forEach items="${list2 }" var="itvpic2">
							<tr>
								<td>${itvpic2.mId }</td>
								<td>${itvpic2.mName }</td>
								<td>${itvpic2.mAddressName }</td>
								<td><c:if test="${!empty itvpic2.mItvpic }">
										<img alt="" src="<%=path %>/itvpic/showImage?type=${itvpic2.mType}&itvpic=${itvpic2.mItvpic}" style="width: 30px">
									</c:if></td>
								<td>${itvpic2.mTelphone }</td>
								<td><a
									onclick="edit(${itvpic2.mId },'${itvpic2.mName }',${itvpic2.mType })"
									class="ico edit">编辑</a></td>
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
								${page2.pageNow} 页</font> <a href="<%=path%>/itvpic/itvpiclist?pageNow=1">首页</a>
							<c:choose>
								<c:when test="${page2.pageNow - 1 > 0}">
									<a href="<%=path%>/itvpic/itvpiclist?pageNow=${page2.pageNow - 1}">上一页</a>
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
									<a href="<%=path%>/itvpic/itvpiclist?pageNow=${page2.pageNow + 1}">下一页</a>
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
				<c:if test="${!empty list3 }">
					<c:forEach items="${list3 }" var="itvpic3">
								<tr>
									<td>${itvpic3.mId }</td>
									<td>${itvpic3.mName }</td>
									<td>${itvpic3.mAddressName }</td>
									<td><c:if test="${!empty itvpic3.mItvpic }">
											<img alt="" src="<%=path %>/itvpic/showImage?type=${itvpic3.mType}&itvpic=${itvpic3.mItvpic}" style="width: 30px">
										</c:if></td>
									<td>${itvpic3.mTelphone }</td>
									<td><a
										onclick="edit(${itvpic3.mId },'${itvpic3.mName }',${itvpic3.mType })"
										class="ico edit">编辑</a></td>
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
								${page3.pageNow} 页</font> <a href="<%=path%>/itvpic/itvpiclist?pageNow=1">首页</a>
							<c:choose>
								<c:when test="${page3.pageNow - 1 > 0}">
									<a href="<%=path%>/itvpic/itvpiclist?pageNow=${page3.pageNow - 1}">上一页</a>
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
									<a href="<%=path%>/itvpic/itvpiclist?pageNow=${page3.pageNow + 1}">下一页</a>
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
				<c:if test="${!empty list4 }">
					<c:forEach items="${list4 }" var="itvpic4">
							<tr>
								<td>${itvpic4.mId }</td>
								<td>${itvpic4.mName }</td>
								<td>${itvpic4.mAddressName }</td>
								<td><c:if test="${!empty itvpic4.mItvpic }">
										<img alt="" src="<%=path %>/itvpic/showImage?type=${itvpic4.mType}&itvpic=${itvpic4.mItvpic}" style="width: 30px">
									</c:if></td>
								<td>${itvpic4.mTelphone }</td>
								<td><a
									onclick="edit(${itvpic4.mId },'${itvpic4.mName }',${itvpic4.mType })"
									class="ico edit">编辑</a></td>
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
								${page4.pageNow} 页</font> <a href="<%=path%>/itvpic/itvpiclist?pageNow=1">首页</a>
							<c:choose>
								<c:when test="${page4.pageNow - 1 > 0}">
									<a href="<%=path%>/itvpic/itvpiclist?pageNow=${page4.pageNow - 1}">上一页</a>
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
									<a href="<%=path%>/itvpic/itvpiclist?pageNow=${page4.pageNow + 1}">下一页</a>
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