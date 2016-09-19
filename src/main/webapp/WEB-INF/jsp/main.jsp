
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="from"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<%=path%>/bootstrap/css/main.css" />
<link rel="stylesheet" href="<%=path%>/bootstrap/css/modify.css" />
<link rel="stylesheet" href="<%=path%>/bootstrap/css/style.css" />
<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery.form.js"></script>
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<thead>
			<tr>
				<th>地区编码</th>
				<th>地区名称</th>
				<th>地区简称</th>
				<th>地区ID</th>
				<th>微信公众号</th>
				<th>Logo标识</th>
				<th>状态(正常/禁用)</th>
				<th>创建时间</th>
				<th>信息完整</th>
				<th>区域视频菜单</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="itvaddress">
					<tr>
						<td>${itvaddress.mAreaCode }</td>
						<td>${itvaddress.mAreaName }</td>
						<td>${itvaddress.mShortName }</td>
						<td><c:choose>
								<c:when test="${itvaddress.mAddressId>0 }">
						${itvaddress.mAddressId }
						</c:when>
								<c:otherwise>
						不存在
						</c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${!empty itvaddress.mWXQrcodeImageURL }">
						<img alt="" src="${itvaddress.mWXQrcodeImageURL }" style="width: 50px">
						</c:when>
								<c:otherwise>
						不存在
						</c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${!empty itvaddress.mLogoIMageURL }">
						<img alt="" src="${itvaddress.mLogoIMageURL }" style="width: 50px">
						</c:when>
								<c:otherwise>
						不存在
						</c:otherwise>
							</c:choose></td>
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
						<td><c:if test="${itvaddress.mAddressCode!=''}">
								<a
									href="<%=path%>/itvmenu/allMenu?codevalue=${itvaddress.mAddressCode}&shortname=${itvaddress.mShortName}&pageNow=1"><button
										class="button">视频菜单管理</button></a>
							</c:if></td>
						<td><a class="ico edit"
							onclick="showModify('${itvaddress.mAreaCode}','${itvaddress.mAreaName }','${itvaddress.mShortName }',${itvaddress.mState },${itvaddress.mAddressId },'${itvaddress.mLogoIMageURL }')">编辑</a>
							<c:choose>
								<c:when test="${itvaddress.mState==1 }">
									<a class="ico del" onclick="disOropen('${itvaddress.mAreaCode}',0)">禁用</a>
								</c:when>
								<c:otherwise>
									<a class="ico del" onclick="disOropen('${itvaddress.mAreaCode}',1)">启用</a>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<!-- 分页开始 -->
	<div align="center" style="margin-top: 20px">
		<c:choose>
			<c:when test="${page.totalPageCount==0}">
			</c:when>
			<c:otherwise>
				<div>
					<font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第
						${page.pageNow} 页</font> <a
						href="<%=path%>/address/showAddress?pageNow=1">首页</a>
					<c:choose>
						<c:when test="${page.pageNow - 1 > 0}">
							<a
								href="<%=path%>/address/showAddress?pageNow=${page.pageNow - 1}">上一页</a>
						</c:when>
						<c:when test="${page.pageNow - 1 <= 0}">
							<a href="<%=path%>/address/showAddress?pageNow=1">上一页</a>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.totalPageCount==0}">
							<a href="<%=path%>/address/showAddress?pageNow=${page.pageNow}">下一页</a>
						</c:when>
						<c:when test="${page.pageNow + 1 < page.totalPageCount}">
							<a
								href="<%=path%>/address/showAddress?pageNow=${page.pageNow + 1}">下一页</a>
						</c:when>
						<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
							<a
								href="<%=path%>/address/showAddress?pageNow=${page.totalPageCount}">下一页</a>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.totalPageCount==0}">
							<a href="<%=path%>/address/showAddress?pageNow=${page.pageNow}">尾页</a>
						</c:when>
						<c:otherwise>
							<a
								href="<%=path%>/address/showAddress?pageNow=${page.totalPageCount}">尾页</a>
						</c:otherwise>
					</c:choose>

				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="div">
		<div id="modify">
			<div class="mBox">
				<form id="modifyForm" enctype="multipart/form-data">
					<div style="margin-top: 10px">
						<label style="font-size: 22px; font-style: oblique;">编辑</label>
					</div>
					<div style="margin-left: 15px; margin-top: 20px">
						地区编码: <input id="area_code" type="text" readonly="readonly"
							style="margin-left: 15px" name="areaCode" class="same noBorder"
							style="border: none" />
					</div>
					<div style="margin-left: 15px">
						地区名称: <input id="area_name" type="text" readonly="readonly"
							style="margin-left: 15px" class="same noBorder"
							style="border: none" />
					</div>
					<div style="margin-left: 15px">
						简&nbsp;&nbsp;称: <input class="same" id="short_name" type="text"
							style="margin-left: 15px" name="shortName" />
					</div>
					<div class="ssq" style="margin-left: 15px">
						<br /> 省:<select class="address same" id="province"
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
					<div class="erCode" style="margin-left: 15px">
						选择微信公众号 <select id="wxcode" onchange="chooseWxcode()"
							name="wxCode" style="margin-left: 15px">
							<option>请选择</option>
							<option
								value="http://123.56.23.62:8015/itvbg/images/upload/wx/yzg.jpg">医总管</option>
						</select> <img id="wxImg" alt="" src="" style="display: none;">
					</div>
					<div class="erCode" style="margin-left: 15px">
						选择logo图片：<input id="logo_url" name="logo" type="file"
							accept=".gif,.png,.jpg" style="margin-left: 15px" value="asda" />
						<input type="text" readonly="readonly"
							style="border: none; display: none;" class="same noBorder"
							id="logo"> <img alt="" src="" id="logourl"
							style="display: none; width: 20px; position: absolute; left: 159px; top: 325px;">
					</div>
					<div style="margin-left: 15px">
						状态值： <input name="flag" type="radio" value="1" id="flag1">正常
						<input name="flag" type="radio" value="0" id="flag0">禁用
					</div>
					<div class="mbtn">
						<input id="sub" type="button" value="提交" onclick="upload()" /> <input
							id="cancel" type="reset" value="取消" onclick="canCel()" />
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="del">
		<input type="text" id="mId" style="display: none;"> <input
			type="text" id="mState" style="display: none;">
		<h2 style="font-style: oblique; margin-left: 40px; margin-top: 20px;">
			<img alt="" src="<%=path%>/images/jg.png" style="vertical-align:middle;margin-right: 10px">是否禁用(启用)当前地区信息
		</h2>
		<div style="margin-left: 180px; margin-top: 15px">
			<input style="width: 45px" type="button" value="是"
				onclick="delAddress()" /> <input style="width: 45px" type="reset"
				value="否" onclick="fouAddress()" />
		</div>
	</div>
</body>
<script type="text/javascript">
   
    function disOropen(mAreaCode,state) {
		document.getElementById("del").style.display="block";
		$("#mId").val(mAreaCode);
		$("#mState").val(state);
	}
    function fouAddress() {
    	document.getElementById("del").style.display="none";
	}    
    function delAddress() {
		var areacode = $("#mId").val();
		var state = $("#mState").val();
		$.ajax({
			url:"<%=path%>/address/del",
			data : {"areacode":areacode,"state":state},
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
	        	   canCel();
	        	   location.reload();
	              }
		   });
	}
	function parentAddress(mId){
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
	
	function canCel(){
		document.getElementById("div").style.display="none";
	}
	function showModify(code,name,shorname,state,id,logurl){
		console.log(state);
		document.getElementById("div").style.display="block";
		if(id>0){
			parentAddress(id);
		}else{
			findprovince();
		}
		$("#area_code").val(code);
		$("#area_name").val(name);
		$("#short_name").val(shorname);
		if(logurl!=''){
			document.getElementById("logo").style.display= "block"; 
			document.getElementById("logourl").style.display= "block"; 
			$("#logo").val("当前logo图片地址存在");
			document.getElementById("logourl").src =logurl;
		}else{
			document.getElementById("logo").style.display= "none"; 
		}
		if(state==1){
			document.getElementById("flag1").checked =true;
		}else if(state==0){
			document.getElementById("flag0").checked =true;
		}
		
	}
	function chooseWxcode(){
		var url = document.getElementById("wxcode").value;
		console.log(url);
		if(url!="请选择"){
		 	document.getElementById("wxImg").src =url;
			document.getElementById("wxImg").style.display= "block"; 
		}else{
			document.getElementById("wxImg").src ="";
			document.getElementById("wxImg").style.display= "none"; 
		}

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
								str += "<option value='" +address.mId+ "@"+address.mCodeValue+"'>" //现在用code_value标识，后期会改成id标识
										+ address.mName + "</option>";
							}
							$("#town").append(str);
						}
					});
		}

     function showVideoMenu(mcodevalue) {
		$.ajax({
			data : {"codevalue" : mcodevalue},
			url : "<%=path%>/itvmenu/allMenu",
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
						}
					});
		}
	</script>
</html>