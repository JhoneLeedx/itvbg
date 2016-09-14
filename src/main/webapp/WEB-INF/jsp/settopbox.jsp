<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=path%>/bootstrap/css/style.css" />
<script type="text/javascript"
	src="<%=path%>/bootstrap/js/jquery-1.9.1.min.js"></script>
</head>
<body>

	<div class="table">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<thead>
				<tr>
					<th>序号</th>
					<th>品牌</th>
					<th>型号</th>
					<th>类型</th>
					<th>系统信息</th>
					<th>是否支持IPTV</th>
					<th>是否支持想家通话</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="itvStb">
						<tr>
							<td>${itvStb.mId }</td>
							<td>
							    <c:choose>
									<c:when test="${!empty itvStb.mBrand }">
						                 ${itvStb.mBrand }
						            </c:when>
									<c:otherwise>
									    未填写
						           </c:otherwise>
								</c:choose>
						    </td>
						    <td>
							    <c:choose>
									<c:when test="${!empty itvStb.mModel }">
						                 ${itvStb.mModel }
						            </c:when>
									<c:otherwise>
									    未填写
						           </c:otherwise>
								</c:choose>
						    </td>
						    <td>
						        <c:choose>
									<c:when test="${!empty itvStb.mType }">
						                 ${itvStb.mType }
						            </c:when>
									<c:otherwise>
									    未填写
						           </c:otherwise>
								</c:choose>
						    </td>
						    <td>
							    <c:choose>
									<c:when test="${!empty itvStb.mSysInfo }">
						                 ${itvStb.mSysInfo }
						            </c:when>
									<c:otherwise>
									    未填写
						           </c:otherwise>
								</c:choose>
						    </td>
						    
						    <td>
							    <c:choose>
									<c:when test="${itvStb.mIsIptv==0 }">
						                                            不支持
						            </c:when>
						            <c:when test="${itvStb.mIsIptv==1 }">
						                                            支持
						            </c:when>
									<c:otherwise>
									    未填写
						           </c:otherwise>
								</c:choose>
						    </td>
						    <td>
							    <c:choose>
									<c:when test="${itvStb.mIsMediaCall==0 }">
						                                            不支持
						            </c:when>
						            <c:when test="${itvStb.mIsMediaCall==1 }">
						                                            支持
						            </c:when>
									<c:otherwise>
									    未填写
						           </c:otherwise>
								</c:choose>
						    </td>
						    <td>
						        <a onclick="updateStb(${itvStb.mId},'${itvStb.mBrand }','${itvStb.mModel }','${itvStb.mType }',${itvStb.mIsIptv },${itvStb.mIsMediaCall })"  class="ico edit">编辑</a>
								<a onclick="deleteStb(${itvStb.mId})" class="ico del">删除</a>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<!-- 分页开始 -->
	<div align="center" style="margin-top: 20px">
		<c:choose>
			<c:when test="${page.totalPageCount==0}">
			</c:when>
			<c:otherwise>
				<div>
					<font size="2">共 ${page.totalPageCount} 页</font> <font size="2">第
						${page.pageNow} 页</font> <a
						href="<%=path%>/itvstb/all?pageNow=1">首页</a>
					<c:choose>
						<c:when test="${page.pageNow - 1 > 0}">
							<a
								href="<%=path%>/itvstb/all?pageNow=${page.pageNow - 1}">上一页</a>
						</c:when>
						<c:when test="${page.pageNow - 1 <= 0}">
							<a
								href="<%=path%>/itvstb/all?pageNow=1">上一页</a>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.totalPageCount==0}">
							<a
								href="<%=path%>/itvstb/all?pageNow=${page.pageNow}">下一页</a>
						</c:when>
						<c:when test="${page.pageNow + 1 < page.totalPageCount}">
							<a
								href="<%=path%>/itvstb/all?pageNow=${page.pageNow + 1}">下一页</a>
						</c:when>
						<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
							<a
								href="<%=path%>/itvstb/all?pageNow=${page.totalPageCount}">下一页</a>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${page.totalPageCount==0}">
							<a
								href="<%=path%>/itvstb/all?pageNow=${page.pageNow}">尾页</a>
						</c:when>
						<c:otherwise>
							<a
								href="<%=path%>/itvstb/all?pageNow=${page.totalPageCount}">尾页</a>
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
				<label>序号：</label><input type="text" readonly="readonly" id="id"
					style="border: none; background: #f6f6f6;" /><br />
			</div>
	
			<div style="margin-left: 100px; margin-top: 5px">
				<label>机顶盒品牌：</label><input type="text" id="brand" /><br />
			</div>
			<div style="margin-left: 100px; margin-top: 5px">
				<label>机顶盒型号：</label><input type="text" id="model" /><br />
			</div>
			<div style="margin-left: 100px; margin-top: 5px">
				<label>机  顶  盒  类  型 ：</label><input style="margin-left: 19px" type="radio" name="type" id="type0" />2k<input
					type="radio" name="type" id="type1" />4k<br />
			</div>
			<div style="margin-left: 100px; margin-top: 5px">
				<label>是否支持 I P T V ：</label><input type="radio" name="iptv" id="isIptv0" />支持<input
					type="radio" name="iptv" id="isIptv1" />不支持<br />
			</div>
			<div style="margin-left: 100px; margin-top: 5px">
				<label>是否支持想家通话：</label><input type="radio" name="iscall" id="iscall0" />支持<input
					type="radio" name="iscall" id="iscall1" />不支持<br />
			</div>
			<div style="margin-left: 200px; margin-top: 30px">
				<input type="button" value="提交" onclick="editsumbit()" /> <input
					type="reset" value="取消" onclick="editcancle()" />
			</div>
		</form>
	</div>
	
	<div id="del"> 
	   <input type="text" id="mId" style="display: none;">
	   
	   <h2 style="font-style: oblique; margin-left: 50px; margin-top: 20px;"><img alt="" src="<%=path%>/images/jg.png">是否删除数据</h2>
	  	<div style="margin-left: 180px; margin-top: 15px">
			<input style="width: 45px" type="button" value="是" onclick="delsumbit()" /> 
			<input style="width: 45px"	type="reset" value="否" onclick="delcancle()" />
		</div>
	</div>
	
</body>
<script type="text/javascript">
  
    function delcancle() {
    	document.getElementById("del").style.display="none";
	}

    function delsumbit() {
    	var id = $("#mId").val();
    	$.ajax({
    		data:{"id":id},
    		url:"<%=path%>/itvstb/delStb",
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
    function deleteStb(id) {
    	document.getElementById("del").style.display="block";
    	$("#mId").val(id);
	}
    function updateStb(id,brand,model,type,isiptv,iscall){
    	document.getElementById("edit").style.display="block";
    	$("#id").val(id);
    	$("#brand").val(brand);
    	$("#model").val(model);
        if(isiptv==1){
        	document.getElementById("isIptv0").checked=true;
        } else{
        	document.getElementById("isIptv1").checked=true;
        }
        if(iscall==1){
        	document.getElementById("iscall0").checked=true;
        } else{
        	document.getElementById("iscall1").checked=true;
        }
        if(type==''){
        	document.getElementById("type0").checked=true;
        }else if(type=='2k'){
        	document.getElementById("type0").checked=true;
        }else{
        	document.getElementById("type1").checked=true;
        }
    	
    }
    function editcancle(){
    	document.getElementById("edit").style.display="none";
    }
    function editsumbit() {
    	
    	var id = $("#id").val();
    	var brand = $("#brand").val();
    	var model = $("#model").val();
    	var type;
    	if(document.getElementById("type0").checked){
    		type = '2k'
    	}else{
    		type = '4k'
    	}
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
    	if(brand==""){
    		document.getElementById("brand").style="border:1px solid red";
    		document.getElementById("brand").focus=true;
    		return;
    	}else{
    		document.getElementById("brand").style="null";
    	}
    	 $.ajax({
    		data:{"id":id,"brand":brand,"model":model,"type":type,"isIptv":isIptv,"iscall":iscall},
    		url:"<%=path%>/itvstb/updateStb",
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
    
</script>
</html>