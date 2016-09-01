<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=path%>/bootstrap/css/main.css" />
<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery-1.9.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr class="tableHead">
				<th>地区编码</th>
				<th>地区名称</th>
				<th>地区简称</th>
				<th>地区ID</th>
				<th>微信公众号图片</th>
				<th>Logo图片</th>
				<th>状态(正常/禁用)</th>
				<th>创建时间</th>
				<th>信息完整</th>
				<th>修改信息</th>
			</tr>
		</thead>
		<tbody>
			<tr class="patient">
				<td>10012</td>
				<td>成都市武侯区</td>
				<td>武侯</td>
				<td>123</td>
				<td>存在</td>
				<td>存在</td>
				<td>正常</td>
				<td>2016-08-10 16:05:36</td>
				<td>完整</td>
				<td><button>修改</button></td>
			</tr>
		</tbody>
	</table>
	<div>
		<div>
			<form id="modifyForm">
				<p>
					地区编码<input id="area_code" type="text" readonly="readonly"
						style="border: none" />
				<p>
					地区名称<input id="area_name" type="text" readonly="readonly"
						style="border: none" />
				<p>
					简称<input id="short_name" type="text" />
				<div>
					<select id="country" onchange="findprovince()">
						<option>请选择</option>
						<option value="156">中国</option>
					</select> <select id="province" onchange="findcity()">
						<option>请选择</option>
					</select> <select id="city" onchange="findtown()">
						<option>请选择</option>
					</select> <select id="town">
						<option>请选择</option>
					</select>
				</div>
			</form>
		</div>
		<p>
			选择微信二维码图片<input type="file" id="wxqcode_url">
		<p>
			选择logo图片<input type="file" id="logo_url">
	</div>
<script type="text/javascript">
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
						str += "<option value='" +address.mId+ "'>"
							+ address.mName + "</option>";
						}
					    $("#town").append(str);
					}
				});
	}
</script>
</body>
</html>