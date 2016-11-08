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
		<body onload="findprovince()">
			<div class="page-container">
				<form class="form form-horizontal" id="form-article-add">
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span
							class="c-red">*</span>序号：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" value="${stb.mId }"
								readonly="readonly" id="id" style="border: none">
						</div>
					</div>

					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span
							class="c-red">*</span>机顶盒品牌:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" id="brand"
								value="${stb.mBrand }">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span
							class="c-red">*</span>机顶盒型号:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" id="model"
								value="${stb.mModel }">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span
							class="c-red">*</span>机顶盒类型:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" id="type"
								value="${stb.mType }">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span
							class="c-red">*</span>iptv的 账号:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" id="iptvId"
								value="${stb.mIptvId }">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span
							class="c-red">*</span>iptv想家账号</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text" id="iptvToken"
								value="${stb.mIptvToken }">
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span
							class="c-red">*</span>机顶盒备注:</label>
						<div class="formControls col-xs-8 col-sm-9">
							<textarea class="input-text" id="remark"
								placeholder="备注（是不是公司内部机顶盒？）"
								style="height: 60px; vertical-align: top; resize: none;">${stb.mRemark }</textarea>
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span
							class="c-red">*</span>IPTV：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<c:choose>
								<c:when test="${stb.mIsIptv==1 }">
									<div class="radio-box">
										<input type="radio" name="iptv" id="isIptv0" checked="checked">
										<label for="sex-1">支持</label>
									</div>
									<div class="radio-box">
										<input type="radio" name="iptv" id="isIptv1"> <label
											for="sex-2">不支持</label>
									</div>
								</c:when>
								<c:otherwise>
									<div class="radio-box">
										<input type="radio" name="iptv" id="isIptv0"> <label
											for="sex-1">支持</label>
									</div>
									<div class="radio-box">
										<input type="radio" name="iptv" id="isIptv1" checked="checked">
										<label for="sex-2">不支持</label>
									</div>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-2"><span
							class="c-red">*</span>想家通话：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<c:choose>
								<c:when test="${stb.mIsMediaCall==1 }">
									<div class="radio-box">
										<input type="radio" type="radio" name="iscall" id="iscall0"
											checked="checked"> <label for="sex-1">支持</label>
									</div>
									<div class="radio-box">
										<input type="radio" name="iscall" id="iscall1"> <label
											for="sex-2">不支持</label>
									</div>
								</c:when>
								<c:otherwise>
									<div class="radio-box">
										<input type="radio" type="radio" name="iscall" id="iscall0">
										<label for="sex-1">支持</label>
									</div>
									<div class="radio-box">
										<input type="radio" name="iscall" id="iscall1"
											checked="checked"> <label for="sex-2">不支持</label>
									</div>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
					<div class="row cl">
						<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
							<button onClick=" editsumbit()" class="btn btn-primary radius"
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
function editsumbit() {
	
	var id = $("#id").val();
	var brand = $("#brand").val();
	var model = $("#model").val();
	var type=$("#type").val();
	var iptvid = $("#iptvId").val();
	var iptvtoken = $("#iptvToken").val();
	var remark = $("#remark").val();
    var isIptv;
    if(document.getElementById("isIptv0").checked){
    	isIptv = 1;
    }else{
    	isIptv = 0;
    }
    var iscall;
    if(document.getElementById("iscall0").checked){
    	iscall = 1;
    }else{
    	iscall = 0;
    }
	 $.ajax({
		data:{"id":id,"brand":brand,"model":model,"type":type,"isIptv":isIptv,"iscall":iscall,"iptvid":iptvid,"iptvtoken":iptvtoken,"remark":remark},
		url:"<%=path%>/itvstb/updateStb",
			ache : false,
			async : true,
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