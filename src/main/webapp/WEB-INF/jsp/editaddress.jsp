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
<script type="text/javascript" src="<%=path%>/lib/layer/2.1/layer.js"></script>
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
		<c:choose>
			<c:when test="${address.mAddressId>0 }">
				<c:choose>
					<c:when test="${!empty wxpublic }">
						<body onload="parentAddress(${address.mAddressId})">
					</c:when>
					<c:otherwise>
						<body onload="parentAddress(${address.mAddressId}),showWxpublic()">
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${!empty wxpublic }">
						<body onload="findprovince()">
					</c:when>
					<c:otherwise>
						<body onload="findprovince(),showWxpublic()">
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		<article class="page-container">
			<form class="form form-horizontal" enctype="multipart/form-data"
				id="modifyForm">
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span
						class="c-red">*</span>地区编码:</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" readonly="readonly" style="border: none"
							class="input-text" value="${address.mAreaCode }" placeholder=""
							name="areaCode">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span
						class="c-red">*</span>地区名称:</label>
					<div class="formControls col-xs-8 col-sm-9 skin-minimal">
						<input type="text" readonly="readonly" style="border: none"
							class="input-text" value="${address.mAreaName }" placeholder="">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span
						class="c-red">*</span>地区简称：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<input type="text" class="input-text"
							value="${address.mShortName }" placeholder="" name="shortName">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3"><span
						class="c-red">*</span>所在城市：</label>
					<div class="formControls col-xs-8 col-sm-9">
						省:<select class="address same" id="province"
							style="margin-left: 15px;; margin-right: 15px"
							onchange="findcity()">
							<option>请选择</option>
						</select> 市: <select class="address same" id="city" onchange="findtown()"
							style="margin-left: 15px; margin-right: 15px">
							<option>请选择</option>
						</select> 区: <select class="address same" id="town" name="addressCodeValue"
							style="margin-left: 15px; margin-right: 15px">
							<option>请选择</option>
						</select>
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">logo图片：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<span class="btn-upload form-group"> <label class="file"
							for="logo_url" style="margin-left: 15px"> 选择图片 </label> <img
							id="preview" style="width: 60px; margin-left: 10px" /> <input
							type="file" id="logo_url" name="logo" accept="image/*"
							style="display: none" onchange="imgPreview(this)">
						</span>
					</div>
				</div>
				<!-- 添加logo图片显示和删除功能 -->
				<div class="row cl">
					<c:if test="${address.mLogoIMageURL!='' }">
						<label class="form-label col-xs-4 col-sm-3">当前logo图片：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<img alt="" src="${address.mLogoIMageURL}"
								style="margin-left: 10px; margin-right: 20px; width: 50px" /> <a
								onclick="delLogo(${address.mId})"> <i class="Hui-iconfont">&#xe6e2;</i>删除
							</a>
						</div>
					</c:if>
				</div>

				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-3">微信公众号：</label>
					<div class="formControls col-xs-8 col-sm-9">
						<span class="select-box"> <select class="select" size="1"
							id="wxcode" name="wxCode" onchange="show()">
								<c:choose>
									<c:when test="${! empty wxpublic }">
										<option value="${wxpublic.mWxUrl }@${wxpublic.mId}">${wxpublic.mName }</option>
										<option value='请选择@0'>请选择</option>
									</c:when>
									<c:otherwise>
										<option value='请选择@0'>请选择</option>
									</c:otherwise>
								</c:choose>
						</select>
						</span>
					</div>
				</div>
				<div class="row cl">
					<c:choose>
						<c:when test="${address.mState==1 }">
							<label class="form-label col-xs-4 col-sm-3">状态值：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<div class="radio-box">
									<input name="flag" type="radio" value="1" id="flag1" checked>
									<label for="sex-1">正常</label>
								</div>
								<div class="radio-box">
									<input name="flag" type="radio" value="0" id="flag0"> <label
										for="sex-2">禁用</label>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<label class="form-label col-xs-4 col-sm-3">状态值：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<div class="radio-box">
									<input name="flag" type="radio" value="1" id="flag1"> <label
										for="sex-1">正常</label>
								</div>
								<div class="radio-box">
									<input name="flag" type="radio" value="0" id="flag0" checked>
									<label for="sex-2">禁用</label>
								</div>
							</div>
						</c:otherwise>

					</c:choose>
				</div>
				<div class="row cl">
					<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
						<input class="btn btn-primary radius" id="sub" type="button"
							value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="upload()" />
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

function delLogo(mId) {
	
	layer.confirm('确认要logo图片删除吗？',function(index){
		$.ajax({
			data : {"id":mId},
		    url:"<%=path%>/address/uplogo",
			ache : false,
			dataType : "text",
			async : true,
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			error : function() {
					alert("请与管理员联系");
				},
			success : function(data) {
					alert(data);
					window.parent.location.reload();
				}
			});
	});
}

function upload(){
	   $("#modifyForm").ajaxSubmit({
		   url:"<%=path%>/address/upload",
		   type: 'post',
		   dataType : "text",
		   contentType: "application/x-www-form-urlencoded; charset=utf-8",  
			error : function() {
				alert("请与管理员联系");
			},
           success: function(data) {  
        	   alert(data);
        	   window.parent.location.reload();
              }
	   });
}
function parentAddress(mId){
	//showWxpublic();
	$.ajax({
		data : {"id":mId},
	    url:"<%=path%>/addresstll/parentAddress",
		ache : false,
		dataType : "json",
		async : true,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		error : function() {
				alert("请与管理员联系");
			},
		success : function(data) {
				var json = JSON.stringify(data);
				var obj = jQuery.parseJSON(json);
				var str = "";
				$("#province").html("");
				var provinceAddress = obj[0];
				var cityAddress = obj[1];
				var townAddress = obj[2];
				str="<option>请选择</option>";
					str = str+"<option selected='selected' value='" +provinceAddress.mCodeValue+ "'>"+provinceAddress.mName+"</option>";
					
				$("#province").append(str);
				str="";
				str = "<option value='" +cityAddress.mCodeValue+ "'>"+cityAddress.mName+"</option>";
				$("#city").html("");
				$("#city").append(str);
				str="";
				str = "<option value='"+townAddress.mId+ "@"+townAddress.mCodeValue+"'>"+townAddress.mName+"</option>";
				$("#town").html("");
				$("#town").append(str);
			}
		});
}

function findprovince() {
	//showWxpublic();
	var country = $("#country").val();
	$.ajax({
		data : {"codevalue":country},
	    url:"<%=path%>/addresstll/alist",
		ache : false,
		dataType : "json",
		async : true,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		error : function() {
				alert("请与管理员联系");
			},
		success : function(data) {
				var json = JSON.stringify(data);
				var obj = jQuery.parseJSON(json);
				var str = "<option>请选择</option>";
				$("#province").html("");
				for (var i=0;i<obj.length;i++) {
					var address = obj[i];
					str += "<option value='" +address.mCodeValue+ "'>"+address.mName+"</option>";
				}
				$("#province").append(str);
				$("#city").html("");
				$("#city").append("<option>请选择</option>");
				$("#town").html("");
				$("#town").append("<option>请选择</option>");
			}
		});
	}
function findcity() {
	var province = $("#province").val();
	$.ajax({
		data : {"codevalue":province},
	    url:"<%=path%>/addresstll/alist",
		ache : false,
		dataType : "json",
		async : true,
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		error : function() {
				alert("请与管理员联系");
			},
		success : function(data) {
				var json = JSON.stringify(data);
				var obj = jQuery.parseJSON(json);
				var str = "<option>请选择</option>";
				$("#city").html("");
				for (var i=0;i<obj.length;i++) {
					var address = obj[i];
					str += "<option value='" +address.mCodeValue+ "'>"+address.mName+"</option>";
				}
				$("#city").append(str);
				$("#town").html("");
				$("#town").append("<option>请选择</option>");
			}
		});
	}
function findtown() {
	var city = $("#city").val();
	$.ajax({
		data : {"codevalue":city},
	    url:"<%=path%>/addresstll/alist",
					ache : false,
					dataType : "json",
					async : true,
					contentType : "application/x-www-form-urlencoded; charset=utf-8",
					error : function() {
						alert("请与管理员联系");
					},
					success : function(data) {
						var json = JSON.stringify(data);
						var obj = jQuery.parseJSON(json);
						var str = "<option>请选择</option>";
						$("#town").html("");
						for (var i = 0; i < obj.length; i++) {
							var address = obj[i];
							str += "<option value='" +address.mId+ "@"+address.mCodeValue+"'>" //现在用code_value标识，后期会改成id标识
									+ address.mName + "</option>";
						}
						$("#town").append(str);
					}
				});
	}
 function showWxpublic() {
		$.ajax({
		url : "<%=path%>/itvwx/alllist",
					ache : false,
					dataType : "json",
					async : true,
					contentType : "application/x-www-form-urlencoded; charset=utf-8",
					error : function() {
						alert("请与管理员联系");
					},
					success : function(data) {
						var json = JSON.stringify(data);
						var obj = jQuery.parseJSON(json);
						var	str = "<option value='请选择@0'>请选择</option>";
						$("#wxcode").html("");
						for (var i=0;i<obj.length;i++) {
							var wx = obj[i];
							str += "<option value='" +wx.mWxUrl+"@"+wx.mId+"'>"+wx.mName+"</option>";
						}
						$("#wxcode").append(str);
					}
				});
}
 
 function show(){
	 var va = $("#wxcode").val();
	 if(va=="请选择@0"){
		 showWxpublic();
	 }
 }
</script>
</html>