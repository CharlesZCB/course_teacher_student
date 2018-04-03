<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>班级信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
%>

<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
<script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
<script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/js/time.js"></script>
<style type="text/css">
.b{
    border:1px 
    width:500px;
    height:40px;
    position:absolute;
    left:50%;
    bottom:0%;
    margin-left:-170px;
   /* margin-top:-190px;*/

}
</style>
<script type="text/javascript">
function queryMohu(){
	var pagenum=document.getElementById("pagenum").value;
	var xulie=document.getElementById("xulie").value;
	var reg=/^[1-9]\d*$|^0$/;   // 注意：故意限制了 0321 这种格式，如不需要，直接reg=/^\d+$/;
	if(xulie==""){
		alert("输入框不能为空！");
		return;
	}
	
	else if(reg.test(xulie)==true){
		//判断位数
		var number=xulie.length;
		//alert(number);
		if(number!=4){
			alert("班号输入不合法，请输入四位有效数字");
			return;
		}
		
		//判断数据库是否有这样的班号
		$.ajax({
			data:{
				"xulie":xulie,
			},
			url:"${path}/classroom/searchroom",
			dataType:"text",
			type:"post",
			success:function(message){
				if(message=="a"){
					alert("查找失败");
				}
				else{
					alert("查找成功！");
					window.location.href="${path}/classroom/getRoomBycode?bcode="+xulie+"&pagenum="+pagenum;
				}
			}
			
			
		})
	}
	else{
		alert("请输入正确的格式--四位合法的数字");
	}
}
function deleteroom(id){
	if(confirm("您真的要删除该班级？")){
		$.ajax({
			data:{
				"id":id
			},
			url:"${path }/classroom/room_del",
			dataType:"text",
			type:"post",
			success:function(messsage){
				alert(messsage);
				window.location.href="${path}/classroom/classroomlist"
			}
		})
	}
	
	
}
</script>
</head>

<body style="overflow-x: hidden">

<div class="row" style="background-color: #dcdc;">
<div class="col-md-2">
<jsp:include page="/WEB-INF/jsp/page/navbar_left.jsp"></jsp:include>
</div>

<div class="col-md-10">
<div>
<jsp:include page="/WEB-INF/jsp/page/navbar_top.jsp"></jsp:include>
<div id="time" style="float: right; margin-right: 100px;"></div>
</div>
</div>
</div>



<div style="margin-left: 200px;margin-right: 50px;">
<h3>
<span class="glyphicon glyphicon-tag" style="margin-right: 20px;"></span>
班级管理</h3>
<div>
<form action="addroom">
<button type="submit" class="btn btn-primary" style="margin-bottom: 10px;float: right;"
>
<span class="glyphicon glyphicon-plus-sign"></span>
添加班级
</button>
</form>
<form class="navbar-form navbar-left" role="search">
  <div class="form-group">
    <input type="text" class="form-control" placeholder="输入班级序列号" id="xulie">
  </div>
  <button type="button" class="btn btn-default" onclick="queryMohu()">
 <span class="glyphicon glyphicon-search"></span> 
  搜索</button>
</form>
<form>
<table class="table table-bordered" 
style="margin-top: 20px;" >

<!-- On cells (`td` or `th`) -->
<tr>
  <td class="warning" style="text-align: center;">班级名称</td>
  <td class="warning" style="text-align: center;">班级序列号</td>
  <td class="warning" style="text-align: center;">班主任</td>
  <td class="warning" style="text-align: center;">班主任编号</td>
  <td class="warning" style="text-align: center;">班级人数</td>
  <td class="warning" style="text-align: center;">操作</td>
</tr>


<tr>
  <td class="info wrap" style="text-align: center;">
    ${room.jibie }级-${room.name }
  </td>
  <td class="info wrap" style="text-align: center;">
    ${room.banhao }
  </td>
<td class="info" id="showoff" style="text-align: center;">
  ${room.t_name } 
</td>
  <td class="info" id="showoff" style="text-align: center;">
  ${room.tcode}
  </td>
 <td class="info" id="showoff" style="text-align: center;">
${room.snum }人
  </td>
  <td class="info row" style="text-align: center;" >
<a  href="${path }/classroom/roomedit?id=${room.id }&pagenum=${pagenum }" style="color: red;">
<span class="glyphicon glyphicon-wrench"></span>
 修改
 </a>
 <a  href="${path }/classroom/detailroom?id=${room.id }&pagenum=${pagenum }&bcode=${room.banhao }" style="color: 

blue;">
<span class="glyphicon glyphicon-eye-open"></span>
详情
</a>
  <a  href="javascript:void(0)" style="color: red;" onclick="deleteroom(${room.id })">
<span class="glyphicon glyphicon-trash"></span>
  删除</a>
  </td>
</tr>
</table>
</form>
<a href="${path}/classroom/classroomlist" type="button" class="btn btn-default" style="margin-bottom: 10px;float: right;"
>
<span class="glyphicon glyphicon-share-alt"></span>
返回列表页
</a>
</div>

</div>
<input type="hidden" id="pagenum" value="${pagenum }">
</body>
</html>