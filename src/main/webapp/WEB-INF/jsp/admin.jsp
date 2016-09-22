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
	
</head>
<body>

   <c:choose>
<c:when test="${!empty admin }">
	<!-- Box -->
	<div class="box">
		<!-- Box Head -->
		<div class="box-head">
			<button style="margin-top: 7px;width: 80px" class="button" onclick="addAdmin()">添加</button>
		</div>
		<!-- End Box Head -->

		<!-- Table -->
		<div class="table">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th>序号</th>
						<th>管理员名称</th>
						<th>管理员密码</th>
						<th>管理员级别</th>
						<th>管理员类型</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty list }">
						<c:forEach items="${list }" var="menu">
							<tr>
								<td>${menu.mId }</td>
								<td>${menu.mAdminName }</td>
								<td>${menu.mAdminPass }</td>
								<td><c:choose>
										<c:when test="${menu.mLevel==1 }">超级管理员</c:when>
										<c:when test="${menu.mLevel!=1 }">普通管理员</c:when>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${menu.mType==1 }">协同服务</c:when>
										<c:when test="${menu.mType==2 }">Itv后台</c:when>
									</c:choose></td>
								<td><c:choose>
										<c:when test="${admin.mId==menu.mId }">
										当前管理员不允许操作
										</c:when>
										<c:otherwise>
											<a
												onclick="editAdmin(${menu.mId},'${menu.mAdminName }','${menu.mAdminPass }',${menu.mLevel },${menu.mType })"
												class="ico edit">编辑</a>
											<a onclick="deldiv(${menu.mId})" class="ico del">删除</a>
										</c:otherwise>
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
						${page.pageNow} 页</font> <a href="<%=path%>/admin/adminlist?pageNow=1">首页</a>
					<c:choose>
						<c:when test="${page.pageNow - 1 > 0}">
							<a href="<%=path%>/admin/adminlist?pageNow=${page.pageNow - 1}">上一页</a>
						</c:when>
						<c:when test="${page.pageNow - 1 <= 0}">
							<a href="<%=path%>/admin/adminlist?pageNow=1">上一页</a>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.totalPageCount==0}">
							<a href="<%=path%>/admin/adminlist?pageNow=${page.pageNow}">下一页</a>
						</c:when>
						<c:when test="${page.pageNow + 1 < page.totalPageCount}">
							<a href="<%=path%>/admin/adminlist?pageNow=${page.pageNow + 1}">下一页</a>
						</c:when>
						<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
							<a
								href="<%=path%>/admin/adminlist?pageNow=${page.totalPageCount}">下一页</a>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.totalPageCount==0}">
							<a href="<%=path%>/admin/adminlist?pageNow=${page.pageNow}">尾页</a>
						</c:when>
						<c:otherwise>
							<a
								href="<%=path%>/admin/adminlist?pageNow=${page.totalPageCount}">尾页</a>
						</c:otherwise>
					</c:choose>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="div">
		<div id="edit">
			<form>
				<h2 style="font-style: oblique; margin-left: 20px; margin-top: 10px">编辑</h2>
				<div style="margin-left: 100px; margin-top: 30px">
					<label>序号：</label><input type="text" readonly="readonly" id="id"
						style="border: none; background: #f6f6f6;" /><br />
				</div>

				<div style="margin-left: 100px; margin-top: 15px">
					<label>管理员名称：</label><input type="text" id="name" /><br />
				</div>
				<div style="margin-left: 100px; margin-top: 15px">
					<label>管理员密码：</label><input type="text" id="pass" /><br />
				</div>
				<div style="margin-left: 100px; margin-top: 15px">
					<label>管理员级别：</label> 
					<input type="radio" name="level" id="level1">普通管理员 <br />
				</div>
				<div style="margin-left: 100px; margin-top: 15px"></div>
				<div style="margin-left: 100px; margin-top: 15px">
					<label>管理员类别：</label><input type="radio" name="type" id="type0" />IPTV协同服务<input
						type="radio" name="type" id="type1" />IPTV后台管理<br />
				</div>
				<div style="margin-left: 200px; margin-top: 50px">
					<input style="width: 50px" type="button" value="提交"
						onclick="editAdd()" /> <input style="width: 50px" type="reset"
						value="取消" onclick="editqx()" />
				</div>
			</form>
		</div>
	</div>
	<div id="del">
		<input type="text" id="mId" style="display: none;">
		<h2 style="font-style: oblique; margin-left: 50px; margin-top: 20px;">
			<img alt="" src="<%=path%>/images/jg.png" style="vertical-align:middle;margin-right: 10px">是否删除管理员
		</h2>
		<div style="margin-left: 180px; margin-top: 15px">
			<input style="width: 45px" type="button" value="是"
				onclick="delAdmin()" /> <input style="width: 45px" type="reset"
				value="否" onclick="fouAdmin()" />
		</div>
	</div>

   <div id="divadd">
	<div id="add">
		<form>
			<h2 style="font-style: oblique; margin-left: 20px; margin-top: 10px">添加新的管理员</h2>

			<div style="margin-left: 100px; margin-top: 45px">
				<label>管理员名称：</label><input type="text" id="Adminname" /><br />
			</div>
			<div style="margin-left: 100px; margin-top: 15px">
				<label>管理员密码：</label><input type="text" id="Adminpass" /><br />
			</div>
			<div style="margin-left: 100px; margin-top: 15px">
				<label>管理员级别：</label>
				<input type="radio" name="alevel" id="alevel1">普通管理员 <br />
			</div>
			<div style="margin-left: 100px; margin-top: 15px"></div>
			<div style="margin-left: 100px; margin-top: 15px">
				<label>管理员类别：</label><input type="radio" name="atype" id="atype0" />IPTV协同服务<input
					type="radio" name="atype" id="atype1" />IPTV后台管理<br />
			</div>
			<div style="margin-left: 200px; margin-top: 50px">
				<input style="width: 50px" type="button" value="提交" onclick="aadd()" />
				<input style="width: 50px" type="reset" value="取消" onclick="aqx()" />
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

    function addAdmin() {
		document.getElementById("divadd").style.display="block";
	}
    function aqx() {
    	document.getElementById("divadd").style.display="none";
	}
    function aadd() {
    	var name = $("#Adminname").val();
    	var pass = $("#Adminpass").val();
    	var level,type;
    	if(document.getElementById("alevel1").checked){
    		level=2;
    	}else{
    		level=2;
    	}
    	if( document.getElementById("atype0").checked){
    		type=1;
    	}else{
    		type=2;
    	}
    	$.ajax({
    		data:{"name":name,"pass":pass,"level":level,"type":type},
    		url:"<%=path%>/admin/addAdmin",
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


   function editAdd() {
	var id = $("#id").val();
	var name = $("#name").val();
	var pass = $("#pass").val();
	var level,type;
	if(document.getElementById("level1").checked){
		level=2;
	}else{
		level=2;
	}
	if( document.getElementById("type0").checked){
		type=1;
	}else{
		type=2;
	}
	   $.ajax({
			data:{"id":id,"name":name,"pass":pass,"level":level,"type":type},
			url:"<%=path%>/admin/updateAdmin",
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
   function editAdmin(id,name,pass,level,type) {
	   document.getElementById("div").style.display="block";
	   $("#id").val(id);
	   $("#name").val(name);
	   $("#pass").val(pass);
	   if(level==1){
		   document.getElementById("level0").checked= true;
	   }else{
		   document.getElementById("level1").checked=true;
	   }
		 if(type==1){  
			 document.getElementById("type0").checked= true;
		 }else{
			 document.getElementById("type1").checked= true;
		 }
	
	   
   }
   function editqx() {
	   document.getElementById("div").style.display="none";
   }
   function deldiv(id) {
	   document.getElementById("del").style.display="block";
	   $("#mId").val(id);
   }
   function delAdmin() {
	 var id = $("#mId").val();
	 $.ajax({
		data:{"id":id},
		url:"<%=path%>/admin/del",
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
   function fouAdmin() {
	   document.getElementById("del").style.display="none";
   }
</script>
</html>