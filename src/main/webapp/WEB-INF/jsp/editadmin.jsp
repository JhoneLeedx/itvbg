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
	<c:when test="${! empty admins.mPid }">
		<body onload="parentAddress(${admins.mPid})">
	</c:when>
	<c:otherwise>
		<body onload="findprovince()">
	</c:otherwise>
</c:choose>
<div class="page-container">
	<form class="form form-horizontal" id="form-article-add">

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>序号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="id" value="${admins.mId }"
					style="border: none" readonly="readonly">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>管理员名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="name"
					value="${admins.mAdminName }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>管理员密码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="pass"
					value="${admins.mAdminPass }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span
				class="c-red">*</span>管理员类别：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<c:choose>
					<c:when test="${admins.mType==1 }">
						<div class="radio-box">
							<input name="atype" id=type0 type="radio" checked="checked">
							<label for="sex-1">IPTV协同服务</label>
						</div>
						<div class="radio-box">
							<input type="radio" name="atype" id="type1"> <label
								for="sex-2">IPTV后台管理</label>
						</div>
					</c:when>
					<c:otherwise>
						<div class="radio-box">
							<input name="atype" id=type0 type="radio"> <label
								for="sex-1">IPTV协同服务</label>
						</div>
						<div class="radio-box">
							<input type="radio" name="atype" id="type1" checked="checked">
							<label for="sex-2">IPTV后台管理</label>
						</div>
					</c:otherwise>
				</c:choose>

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
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="editAdd()" class="btn btn-primary radius"
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
<script type="text/javascript"
	src="<%=path%>/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">

function editAdd() {
	var id = $("#id").val();
	var name = $("#name").val();
	var pass = $("#pass").val();
	var town = $("#town").val();
	var type;
	if( document.getElementById("type0").checked){	
		type=1;
	}else{
		type=2;
	}
	if(name==""){
		alert("没有填写名字");
		return;
	}
 	if(pass==""){
 		alert("没有填写密码");
		return;
	}
	   $.ajax({
			data:{"id":id,"name":name,"pass":pass,"type":type,"town":town},
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
				window.parent.location.reload();
			}
		 });  
   }
	  function findprovince() {
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
						str += "<option value='"+address.mCodeValue+"'>" //现在用code_value标识，后期会改成id标识
								+ address.mName + "</option>";
					}
					$("#town").append(str);
				}
			});
		}
		function parentAddress(codevalue){
			$.ajax({
				data : {"codevalue":codevalue},
			    url:"<%=path%>/addresstll/parentsAddress",
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
</script>
</html>