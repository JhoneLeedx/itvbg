<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/static/h-ui.admin/css/style.css" />
<title>Insert title here</title>
<link href="<%=path%>/lib/webuploader/0.1.5/webuploader.css"
	rel="stylesheet" type="text/css" />
</head>
<c:choose>
	<c:when test="${!empty admin }">
		<body>
			<div class="page-container">
				<form class="form form-horizontal" id="form-article-add">
					<input type="text" id="codevalue" value="${codevalue }"
						style="display: none;" />
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span
							class="c-red">*</span>排序索引：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" id="index">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2">视频名称：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" id="title">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span
							class="c-red">*</span>视频链接：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" id="filespec"
								placeholder="请输入视频code值">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2">视频开始时间</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" id="start">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span
							class="c-red">*</span>视频长度：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" id="length">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span
							class="c-red">*</span>视频状态：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<div class="radio-box">
								<input name="sta" id="sta1" type="radio" checked="checked">
								<label for="sex-1">正常</label>
							</div>
							<div class="radio-box">
								<input type="radio" name="sta" id="sta0"> <label
									for="sex-2">禁用</label>
							</div>
						</div>
					</div>
					<div class="row cl">
						<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
							<button onClick="sumbitAdd();" class="btn btn-primary radius"
								type="button">
								<i class="Hui-iconfont">&#xe632;</i> 提交
							</button>
							<button onClick="layer_close();" class="btn btn-default radius"
								type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
						</div>
					</div>
				</form>
			</div>
		</body>
	</c:when>
</c:choose>
<script type="text/javascript"
	src="<%=path%>/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
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
			data : {
				"codevalue" : codevalue,
				"state" : state,
				"index" : index,
				"title" : title,
				"filespec" : filespec,
				"starttime" : starttime,
				"length" : length
			},
			ache : false,
			dataType : "text",
			async : true,
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			error : function() {
				alert("请与管理员联系");
			},
			success : function(data) {
				alert("添加成功");
				window.parent.location.reload();
			}
		});
	}
</script>
</html>