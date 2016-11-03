
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
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery-1.9.1.min.js"></script>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]-->
<script type="text/javascript" src="<%=path%>/lib/html5.js"></script>
<script type="text/javascript" src="<%=path%>/lib/respond.min.js"></script>
<!-- [endif]-->
<link rel="stylesheet" type="text/css"
	href="<%=path%>/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/static/h-ui.admin/css/style.css" />
<!--[if IE 6]-->
<script type="text/javascript"
	src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js"></script>

<script type="text/javascript" src="<%=path%>/lib/layer/2.1/layer.js"></script>
<script type="text/javascript"
	src="<%=path%>/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript"
	src="<%=path%>/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery-1.9.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		管理员管理 <span class="c-gray en">&gt;</span>管理员列表 <a
			class="btn btn-success radius r"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l"><a class="btn btn-primary radius"
			onclick="showAdd('添加管理员','<%=path%>/admin/showAddAdmin')"
			href="javascript:;"><i class="Hui-iconfont">&#xe600;</i>添加管理员</a></span>
	</div>
	<div class="mt-20">
		<table
			class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
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
						<tr class="text-c">
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
											onclick="editAdmin('编辑管理员','<%=path%>/admin/showEditAdmin?id=${menu.mId }')"><i
											class="Hui-iconfont">&#xe6df;</i>编辑</a>
										<a onclick="deldiv(${menu.mId})"><i class="Hui-iconfont">&#xe6e2;</i>删除</a>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
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
	<%-- 
	<c:choose>
		<c:when test="${!empty admin }">
			<!-- Box -->
			<div class="box">
				<!-- Box Head -->
				<div class="box-head">
					<button style="margin-top: 7px; width: 80px" class="button"
						onclick="addAdmin()">添加</button>
				</div>
				<!-- End Box Head -->

				<!-- Table -->
				<div class="table">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
				<!-- Table -->
			</div>
			<!-- End Box -->
			<!-- 分页开始 -->
			
			<div id="div">
				<div id="edit">
					<form>
						<h2
							style="font-style: oblique; margin-left: 20px; margin-top: 10px">编辑</h2>
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
							<label>管理员级别：</label> <input type="radio" name="level"
								id="level1">普通管理员 <br />
						</div>
						<div style="margin-left: 100px; margin-top: 15px"></div>
						<div style="margin-left: 100px; margin-top: 15px">
							<label>管理员类别：</label><input type="radio" name="type" id="type0" />IPTV协同服务<input
								type="radio" name="type" id="type1" />IPTV后台管理<br />
						</div>
<!--  						<div  id="addressDiv" style="margin-left: 100px;">
							<br /> 省:<select  id="province1"
								style="margin-left: 15px;; margin-right: 15px"
								onchange="findcity1()">
								<option>请选择</option>
							</select> 市: <select  id="city1" onchange="findtown1()"
								style="margin-left: 15px; margin-right: 15px">
								<option>请选择</option>
							</select> 区: <select  id="town1"
								name="addressCodeValue"
								style="margin-left: 15px; margin-right: 15px">
								<option>请选择</option>
							</select>
						</div>  -->
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
				<h2
					style="font-style: oblique; margin-left: 50px; margin-top: 20px;">
					<img alt="" src="<%=path%>/images/jg.png"
						style="vertical-align: middle; margin-right: 10px">是否删除管理员
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
						<h2
							style="font-style: oblique; margin-left: 20px; margin-top: 10px">添加新的管理员</h2>

						<div style="margin-left: 100px; margin-top: 45px">
							<label>管理员名称：</label><input type="text" id="Adminname" /><br />
						</div>
						<div style="margin-left: 100px; margin-top: 15px">
							<label>管理员密码：</label><input type="text" id="Adminpass" /><br />
						</div>
						<div style="margin-left: 100px; margin-top: 15px">
							<label>管理员级别：</label> <input type="radio" name="alevel"
								id="alevel1">普通管理员 <br />
						</div>
						<div style="margin-left: 100px; margin-top: 15px"></div>
						<div style="margin-left: 100px; margin-top: 15px">
							<label>管理员类别：</label><input type="radio" name="atype" id="atype0" />IPTV协同服务<input
								type="radio" name="atype" id="atype1" />IPTV后台管理<br />
						</div>

						<div id="address"  style="margin-left: 100px;">
							<br /> 省:<select  id="province"
								style="margin-left: 15px;; margin-right: 15px"
								onchange="findcity()">
								<option>请选择</option>
							</select> 市: <select  id="city" onchange="findtown()"
								style="margin-left: 15px; margin-right: 15px">
								<option>请选择</option>
							</select> 区: <select  id="town"
								name="addressCodeValue"
								style="margin-left: 15px; margin-right: 15px">
								<option>请选择</option>
							</select>
						</div>
						<div style="margin-left: 200px; margin-top: 50px">
							<input style="width: 50px" type="button" value="提交"
								onclick="aadd()" /> <input style="width: 50px" type="reset"
								value="取消" onclick="aqx()" />
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
	</c:choose> --%>
</body>
<script type="text/javascript">

	function showAdd(title,url,w,h) {
	layer_show(title,url,w,h);
	}
	function editAdmin(title,url,w,h) {
		layer_show(title,url,w,h);
	}
	function deldiv(id){
			layer.confirm('确认要删除吗？',function(index){
				delAdmin(id)
			});

	}
	   function delAdmin(id) {
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
	
  <%--   function addAdmin() {
		document.getElementById("divadd").style.display="block";
		document.getElementById("atype1").checked= true;
		findprovince();
		return true;
	}
    function aqx() {
    	document.getElementById("divadd").style.display="none";
	}
    function aadd() {
    	var name = $("#Adminname").val();
    	var pass = $("#Adminpass").val();
    	var town = $("#town").val();
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
    	if(name==""){
    		alert("没有填写名字");
    		return;
    	}
     	if(pass==""){
     		alert("没有填写密码");
    		return;
    	}
     	if(town=="请选择"){
     		alert("没有选择地区");
    		return;
    	}
     	
    	$.ajax({
    		data:{"name":name,"pass":pass,"level":level,"type":type,"town":town},
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
	if(name==""){
		alert("没有填写名字");
		return;
	}
 	if(pass==""){
 		alert("没有填写密码");
		return;
	}
	   $.ajax({
			data:{"id":id,"name":name,"pass":pass,"level":level,"type":type,"town":town},
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

   function fouAdmin() {
	   document.getElementById("del").style.display="none";
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
		} --%>
   
<%-- 	
	   function findprovince1() {
		   
			var country = $("#country1").val();
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
						$("#province1").html("");
						for (var i=0;i<obj.length;i++) {
							var address = obj[i];
							str += "<option value='" +address.mCodeValue+ "'>"+address.mName+"</option>";
						}
						$("#province1").append(str);
						$("#city1").html("");
						$("#city1").append("<option>请选择</option>");
						$("#town1").html("");
						$("#town1").append("<option>请选择</option>");
					}
				});
			}
		function findcity1() {
			var province = $("#province1").val();
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
						$("#city1").html("");
						for (var i=0;i<obj.length;i++) {
							var address = obj[i];
							str += "<option value='" +address.mCodeValue+ "'>"+address.mName+"</option>";
						}
						$("#city1").append(str);
						$("#town1").html("");
						$("#town1").append("<option>请选择</option>");
					}
				});
			}
		function findtown1() {
			var city = $("#city1").val();
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
								$("#town1").html("");
								for (var i = 0; i < obj.length; i++) {
									var address = obj[i];
									str += "<option value='"+address.mCodeValue+"'>" //现在用code_value标识，后期会改成id标识
											+ address.mName + "</option>";
								}
								$("#town1").append(str);
							}
						});
			} --%>
</script>
</html>