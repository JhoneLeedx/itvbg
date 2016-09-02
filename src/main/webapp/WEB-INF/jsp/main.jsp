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
<link rel="stylesheet" href="<%=path%>/bootstrap/css/main.css" />
<link rel="stylesheet" href="<%=path%>/bootstrap/css/modify.css" />
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

			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="itvaddress">
					<tr class="patient">
						<td>${itvaddress.mAreaCode }</td>
						<td>${itvaddress.mAreaName }</td>
						<td>${itvaddress.mShortName }</td>
						<td>${itvaddress.mAddressId }</td>
						<td><img src="${itvaddress.mWXQrcodeImageURL }" /></td>
						<td><img src="${itvaddress.mLogoIMageURL }" /></td>
						<td><c:choose>
								<c:when test="${itvaddress.mState==1 }">正常</c:when>
								<c:when test="${itvaddress.mState==0 }">禁用</c:when>
							</c:choose></td>
						<td><fmt:formatDate value="${itvaddress.mCreateTime }"
								pattern="YYYY-MM-dd hh:mm:ss" /></td>
						<td><c:choose>
								<c:when test="${itvaddress.mIsFull==1 }">完整</c:when>
								<c:when test="${itvaddress.mIsFull==0 }">信息不完整</c:when>
							</c:choose></td>
						<td><button
								onclick="showModify('${itvaddress.mAreaCode}','${itvaddress.mAreaName }','${itvaddress.mShortName }')">修改</button></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<div id="modify" style="display: none">
		<div class="mBox">
			<form id="modifyForm" method="post" action="<%=path%>/address/upload"
				enctype="multipart/form-data">
				
					地区编码:<input id="area_code" type="text" readonly="readonly"
						class="same noBorder" style="border: none" /><br />
			
					地区名称:<input id="area_name" type="text" readonly="readonly"
						class="same noBorder" style="border: none" /><br />
				
					简&nbsp;&nbsp;称:<input class="same" id="short_name" type="text" />
				<div class="ssq"><br />
					省:<select class="address same" id="province" onchange="findcity()">
						<option>请选择</option>
					</select> 市: <select class="address same" id="city" onchange="findtown()">
						<option>请选择</option>
					</select> 区: <select class="address same" id="town" name="addressId">
						<option>请选择</option>
					</select>
				</div>
				<div class="erCode">
					选择微信公众号 <select id="wxcode" onchange="chooseWxcode()">
						<option>请选择</option>
						<option value="<%=path%>/images/upload/wx/yizongguan.png">医总管</option>
					</select>
					<img id="wxImg" alt="" src="" style="display: none;">
				</div>
				<div class="erCode">
					选择logo图片：<input id="logo_url" name="logo" type="file"
						accept=".gif,.png,.jpg" />
				</div>
				<div class="mbtn">
					<input id="sub" type="submit" value="提交" /> 
					<input id="cancel" type="reset" value="取消" onclick="canCel()"/>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	function canCel(){
		document.getElementById("modify").style.display="none";
		document.getElementById("wxImg").style.display= "block"; 
	}
	function showModify(code,name,shorname){
		
		document.getElementById("modify").style.display="block";
		$("#area_code").val(code);
		$("#area_name").val(name);
		$("#short_name").val(shorname);
		findprovince();
	}
	function chooseWxcode(){
		var url = document.getElementById("wxcode").value;
		console.log(url);
	 	document.getElementById("wxImg").src =url;
		document.getElementById("wxImg").style.display= "block"; 
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