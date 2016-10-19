<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/bootstrap/css/style.css" />
<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery.form.js"></script>
</head>
<script type="text/javascript">

		var secs = 3; //倒计时的秒数
		var URL;
		function Load(url) {
			URL = url;
			for (var i = secs; i >= 0; i--) {
				window.setTimeout('doUpdate(' + i + ')', (secs - i) * 1000);
			}
		}
		function doUpdate(num) {
			if (num == 0) {
				window.parent.location = URL;
			}
		}
</script>
<body>
	<c:choose>
		<c:when test="${!empty admin }">
			<!-- Box -->
			<div class="box">
				<!-- Box Head -->
				<div class="box-head">
					<button style="margin-top: 7px; width: 80px" class="button"
						onclick="additvwx()">添加</button>
				</div>
				<!-- End Box Head -->

				<!-- Table -->
				<div class="table">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr>
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
									<tr>
										<td>${wx.mId }</td>
										<td>${wx.mName }</td>
										<td><img alt="" src="${wx.mWxUrl }" style="width: 50px"></td>
										<td><c:choose>
												<c:when test="${wx.mState==1 }">正常</c:when>
												<c:when test="${wx.mState==0 }">禁用</c:when>
											</c:choose></td>
										<td><fmt:formatDate value="${wx.mCreateTime}"
												pattern="yyyy-MM-dd" /></td>
										<td><a
											onclick="editWx(${wx.mId},'${wx.mName }','${wx.mWxUrl }',${wx.mState })"
											class="ico edit">编辑</a> <c:choose>
												<c:when test="${wx.mState==1 }">
													<a onclick="deldiv(${wx.mId},0)" class="ico del">禁用</a>
												</c:when>
												<c:when test="${wx.mState==0 }">
													<a onclick="deldiv(${wx.mId},1)" class="ico del">启用</a>
												</c:when>
											</c:choose></td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<!-- Table -->
			</div>
			<!-- End Box -->
			<!-- 分页开始 -->
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
			<div id="div">
				<div id="edit">
					<form id="edititvwx" enctype="multipart/form-data">
						<h2
							style="font-style: oblique; margin-left: 20px; margin-top: 10px">编辑</h2>
						<div style="margin-left: 100px; margin-top: 30px">
							<label>序号：</label><input type="text" readonly="readonly" id="id"
								name="eid" style="border: none; background: #f6f6f6;" /><br />
						</div>

						<div style="margin-left: 100px; margin-top: 20px">
							<label>微信公众号名称：</label><input type="text" id="ename" name="ename" /><br />
						</div>
						<div style="margin-left: 100px; margin-top: 20px;">
							<label>微信公众号图片：</label><input type="file" id="ewxurl"
								name="ewxurl" /><br /> <img alt="" src=""
								style="display: none; width: 60px; height: 40px; margin-left: 200px; margin-top: 5px"
								id="iwx">
						</div>
						<div style="margin-left: 100px; margin-top: 20px">
							<label>微信公众号状态：</label> <input type="radio" name="estate"
								value="1" id="estate1">正常 <input type="radio"
								name="estate" value="0" id="estate0">禁用 <br />
						</div>
						<div style="margin-left: 200px; margin-top: 50px">
							<input style="width: 50px" type="button" value="提交"
								onclick="editWxp()" /> <input style="width: 50px" type="reset"
								value="取消" onclick="editqx()" />
						</div>
					</form>
				</div>
			</div>
			<div id="del">
				<input type="text" id="dmId" style="display: none;"> <input
					type="text" id="dmState" style="display: none;">
				<h2
					style="font-style: oblique; margin-left: 50px; margin-top: 20px;">
					<img alt="" src="<%=path%>/images/jg.png"
						style="vertical-align: middle; margin-right: 10px">是否禁用(启用)此微信公众号
				</h2>
				<div style="margin-left: 180px; margin-top: 15px">
					<input style="width: 45px" type="button" value="是"
						onclick="delWx()" /> <input style="width: 45px" type="reset"
						value="否" onclick="fouwx()" />
				</div>
			</div>

			<div id="divadd">
				<div id="add">
					<form id="additvwx" enctype="multipart/form-data">
						<h2
							style="font-style: oblique; margin-left: 20px; margin-top: 10px">添加新的微信公众号</h2>

						<div style="margin-left: 100px; margin-top: 45px">
							<label>微信公众号名称：</label><input type="text" id="name" name="mName" /><br />
						</div>
						<div style="margin-left: 100px; margin-top: 15px">
							<label>微信公众号图片：</label><input type="file" id="file" name="wxurl" /><br />
						</div>
						<div style="margin-left: 100px; margin-top: 15px">
							<label>微信公众号状态：</label> <input type="radio" name="state"
								value="1">正常<input type="radio" name="state" value="0">禁用
							<br />
						</div>
						<div style="margin-left: 100px; margin-top: 15px"></div>
						<div style="margin-left: 200px; margin-top: 50px">
							<input style="width: 50px" type="button" value="提交"
								onclick="wxadd()" /> <input style="width: 50px" type="reset"
								value="取消" onclick="wxqx()" />
						</div>
					</form>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div style="margin: 20px;">
				<a href="login.jsp">自动跳转未成功？请手动点击跳转</a>
			</div>
			<script type="text/javascript">Load("login.jsp");
				</script>
		</c:otherwise>
	</c:choose>
</body>
<script type="text/javascript">

	function wxadd() {
		   $("#additvwx").ajaxSubmit({
			   url:"<%=path%>/itvwx/add",
			   type: 'post',
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
	function additvwx() {
		$("#divadd").show();
	}
	function wxqx() {
		$("#divadd").hide();
	}
	
	function fouwx() {
		$("#del").hide();
	}
	function delWx() {
		var id = $("#dmId").val();
		var state = $("#dmState").val();
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
	function editqx() {
		$("#div").hide();
	}
	function editWxp() {
		 $("#edititvwx").ajaxSubmit({
			   url:"<%=path%>/itvwx/update",
			   type: 'post',
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
	function editWx(id,name,wxurl,state) {
		$("#div").show();
		$("#id").val(id);
		$("#ename").val(name);
		if(wxurl!=""){
			$("#iwx").show();
			$("#iwx").attr("src",wxurl);
		}else{
			$("#iwx").hide();
			$("#iwx").attr("src","");
		}
		if(state==1){
			document.getElementById("estate1").checked = true;
		}else if(state==0){
			document.getElementById("estate0").checked = true;
		}
	}
	function deldiv(id,state) {
		$("#del").show();
		$("#dmId").val(id);
		$("#dmState").val(state);
	}

</script>
</html>