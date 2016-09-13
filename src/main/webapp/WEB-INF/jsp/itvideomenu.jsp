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
						<th>创建(更新)时间</th>
						<th>状态</th>
						<th class="ac">操作</th>
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
	<!-- 分页开始 -->
	<div align="center" style="margin-top: 20px">
		<c:choose>
			<c:when test="${page.totalPageCount==0}">
			</c:when>
			<c:otherwise>
				<div>
					<font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第
						${page.pageNow} 页</font> <a
						href="<%=path%>/itvmenu/allMenu?codevalue=${codevalue }&shortname=${shortName }&pageNow=1">首页</a>
					<c:choose>
						<c:when test="${page.pageNow - 1 > 0}">
							<a
								href="<%=path%>/itvmenu/allMenu?codevalue=${codevalue }&shortname=${shortName }&pageNow=${page.pageNow - 1}">上一页</a>
						</c:when>
						<c:when test="${page.pageNow - 1 <= 0}">
							<a
								href="<%=path%>/itvmenu/allMenu?codevalue=${codevalue }&shortname=${shortName }&pageNow=1">上一页</a>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.totalPageCount==0}">
							<a
								href="<%=path%>/itvmenu/allMenu?codevalue=${codevalue }&shortname=${shortName }&pageNow=${page.pageNow}">下一页</a>
						</c:when>
						<c:when test="${page.pageNow + 1 < page.totalPageCount}">
							<a
								href="<%=path%>/itvmenu/allMenu?codevalue=${codevalue }&shortname=${shortName }&pageNow=${page.pageNow + 1}">下一页</a>
						</c:when>
						<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
							<a
								href="<%=path%>/itvmenu/allMenu?codevalue=${codevalue }&shortname=${shortName }&pageNow=${page.totalPageCount}">下一页</a>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.totalPageCount==0}">
							<a
								href="<%=path%>/itvmenu/allMenu?codevalue=${codevalue }&shortname=${shortName }&pageNow=${page.pageNow}">尾页</a>
						</c:when>
						<c:otherwise>
							<a
								href="<%=path%>/itvmenu/allMenu?codevalue=${codevalue }&shortname=${shortName }&pageNow=${page.totalPageCount}">尾页</a>
						</c:otherwise>
					</c:choose>

				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<div id="edit">
		<form>
			<h2 style="font-style: oblique; margin-left: 20px; margin-top: 10px">编辑</h2>
			<div style="margin-left: 100px; margin-top: 30px">
				<label>编号：</label><input type="text" readonly="readonly" id="id"
					style="border: none; background: #f6f6f6;" /><br />
			</div>

			<div style="margin-left: 100px; margin-top: 5px">
				<label>排序 索引：</label><input type="text" id="indexs" /><br />
			</div>

			<div style="margin-left: 100px; margin-top: 5px">
				<label>视频 名称：</label><input type="text" id="titles" /><br />
			</div>
			<div style="margin-left: 100px; margin-top: 5px">
				<label>视频 链接：</label><input type="text" id="filespecs" /><br />
			</div>
			<div style="margin-left: 100px; margin-top: 5px">
				<label>视频start：</label><input type="text" id="starttime" />（选填）<br />
			</div>
			<div style="margin-left: 100px; margin-top: 5px">
				<label>视频 长度：</label><input type="text" id="slength" />（选填）<br />
			</div>
			<div style="margin-left: 100px; margin-top: 5px">
				<label>视频 状态：</label><input type="radio" name="state" id="state1" />启用<input
					type="radio" name="state" id="state2" />禁用<br />
			</div>
			<div style="margin-left: 200px; margin-top: 5px">
				<input type="button" value="提交" onclick="sumbit()" /> <input
					type="reset" value="取消" onclick="cancle()" />
			</div>
		</form>
	</div>

	<div id="add">
		<form>
			<h2 style="font-style: oblique; margin-left: 20px; margin-top: 10px">添加</h2>
			<input type="text" id="codevalue" value="${codevalue }"
				style="display: none;" />
			<div style="padding-left: 120px; margin-top: 30px">
				<label>排序 索引：</label><input type="text" id="index" />*<br />
			</div>
			<div style="margin-left: 120px; margin-top: 5px">
				<label>视频 名称：</label><input type="text" id="title" />*<br />
			</div>
			<div style="margin-left: 120px; margin-top: 5px">
				<label>视频 链接：</label><input type="text" id="filespec" />*<br />
			</div>
			<div style="margin-left: 120px; margin-top: 5px">
				<label>视频start：</label><input type="text" id="start" />（选填）<br />
			</div>
			<div style="margin-left: 120px; margin-top: 5px">
				<label>视频 长度：</label><input type="text" id="length" />（选填）<br />
			</div>
			<div style="margin-left: 120px; margin-top: 5px">
				<label>视频 状态：</label><input type="radio" name="sta" id="sta1" />启用<input
					type="radio" name="sta" id="sta0" />禁用<br />
			</div>
			<div style="margin-left: 220px; margin-top: 40px">
				<input type="button" value="提交" onclick="sumbitAdd()" tabindex="5" />
				<input type="reset" value="取消" onclick="cancleAdd()" tabindex="5" />
			</div>
		</form>
	</div>
	<script type="text/javascript">
	
		function dele(id,state){
			$.ajax({
				url:"<%=path%>/itvmenu/deletes",
				data : {"id":id,"state":state},
				ache : false,
				dataType : "text",
				async : true,
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
		function qiyong(id,state){
			$.ajax({
				url:"<%=path%>/itvmenu/deletes",
				data : {"id":id,"state":state},
				ache : false,
				dataType : "text",
				async : true,
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				error : function() {
						alert("请与管理员联系");
					},
				success : function(data) {
					alert("启用成功");
					location.reload();
				}
			});
		}
		
		//关闭编辑弹窗
		function cancle(){
			document.getElementById("edit").style.display="none";
		}
		//提交编辑后的结果
		function sumbit(){
			var id = $("#id").val();
			var index = $("#indexs").val();
			var title =	$("#titles").val();
			var filespec = 	$("#filespecs").val();
			var starttime =	$("#starttime").val();
			var length =	$("#slength").val();
			var state = 0;
		if(document.getElementById("state1").checked){
			state = 1;
		}else{
			state = 0;
		}
			$.ajax({
				url:"<%=path%>/itvmenu/update",
				data : {"id":id,"state":state,"index":index,"title":title,"filespec":filespec,"starttime":starttime,"length":length},
				ache : false,
				dataType : "text",
				async : true,
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				error : function() {
						alert("请与管理员联系");
					},
				success : function(data) {
					alert("编辑成功");
					location.reload();
				}
			}); 
		}
		//显示编辑框数据
		function edit(id,index,title,filespec,startpos,length,state) {
			
			document.getElementById("edit").style.display="block";
			$("#id").val(id);
			$("#indexs").val(index);
			$("#titles").val(title);
			$("#filespecs").val(filespec);
			$("#starttime").val(startpos);
			$("#slength").val(length);
			if(state==1){
				document.getElementById("state1").checked = true;
			}else{
				document.getElementById("state2").checked = true;
			}
		}
		//显示添加弹窗
		function add(){
			document.getElementById("add").style.display="block";
		}
		//关闭添加弹窗
		function cancleAdd(){
			document.getElementById("add").style.display="none";
		}
		//提交添加数据
		function sumbitAdd(){
			var codevalue = $("#codevalue").val();
			var index = $("#index").val();
			var title =	$("#title").val();
			var filespec = 	$("#filespec").val();
			
			if(index==""){
				document.getElementById("index").style="border:1px solid red";
			  return;	
			}else{
				document.getElementById("index").style="null";
			}
			if(title==""){
				document.getElementById("title").style="border:1px solid red";
				  return;
			}else{
				document.getElementById("title").style="null";
			}
			if(filespec==""){
				document.getElementById("filespec").style="border:1px solid red";
				  return;
			}else{
				document.getElementById("filespec").style="null";
			}
			
			var starttime =	$("#start").val();
			if(starttime==""){
				starttime = 0;
			}
			var length = $("#length").val();
			
			if(length==""){
				length = 1;
			}
	    var state = 0;
		if(document.getElementById("sta1").checked){
			state = 1;
		}else{
			state = 0;
		}
			$.ajax({
				url:"<%=path%>/itvmenu/insert",
				data : {"codevalue":codevalue,"state":state,"index":index,"title":title,"filespec":filespec,"starttime":starttime,"length":length},
				ache : false,
				dataType : "text",
				async : true,
				contentType : "application/x-www-form-urlencoded; charset=utf-8",
				error : function() {
						alert("请与管理员联系");
					},
				success : function(data) {
					alert("添加成功");
					location.reload();
				}
			}); 
		}
	</script>
</body>
</html>