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
<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery.form.js"></script>

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
<link rel="stylesheet" type="text/css"
	href="<%=path%>/bootstrap/css/file.css" />
<title>Insert title here</title>
</head>
<c:choose>
	<c:when test="${!empty admin }">
		<body>
			<article class="page-container">
				<form class="form form-horizontal" enctype="multipart/form-data"
					id="itvpicUpload">
					<input style="display: none" type="text" name="type"
						value="${itvpic.mType }" id="type">
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"><span
							class="c-red">*</span>序号</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" readonly="readonly" style="border: none"
								class="input-text" value="${itvpic.mId }" placeholder=""
								id="mid" name="id">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3"><span
							class="c-red">*</span>医院名称:</label>
						<div class="formControls col-xs-8 col-sm-9 skin-minimal">
							<input type="text" readonly="readonly" style="border: none"
								class="input-text" value="${itvpic.mName }" placeholder=""
								id="name">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">医院图片：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<span class="btn-upload form-group"> <label class="file"
								for="itvpic" style="margin-left: 15px"> 选择图片 </label>  <input
								type="file" id="itvpic" name="itvpic" accept="image/*"
								style="display: none" onchange="imgPreview(this)">
							</span>
							
						</div>
					</div class="row cl">
					<img
								id="preview" style="width: 60px;height 40px; margin-left: 220px;margin-top: 20px" />
					<div>
					</div>
					<div class="row cl">
						<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
							<input class="btn btn-primary radius" id="sub" type="button"
								value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="itvPicUpload()" />
							<button onClick="layer_close();" class="btn btn-default radius"
								type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
						</div>
					</div>
				</form>
			</article>
		</body>
	</c:when>
</c:choose>
<script type="text/javascript"
	src="<%=path%>/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="<%=path%>/bootstrap/js/showimage.js"></script>
<script type="text/javascript">

function itvPicUpload() {
    $("#itvpicUpload").ajaxSubmit({
		   url:"<%=path%>/itvpic/itvpicUpload",
			type : "post",
			dataType : "text",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			error : function() {
				alert("请与管理员联系");
			},
			success : function(data) {
				alert(data);
				window.parent.location.reload();
			}
		});
	}
</script>
</html>