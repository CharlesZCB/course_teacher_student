<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师列表</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
%>
<% 
   String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间 
%>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
<script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
<script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/js/inform.js"></script>
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

.sel_btn{
            height: 21px;
            line-height: 21px;
            padding: 0 11px;
            background: #02bafa;
            border: 1px #26bbdb solid;
            border-radius: 3px;
            /*color: #fff;*/
            display: inline-block;
            text-decoration: none;
            font-size: 12px;
            outline: none;
            margin-bottom: 10px;
        }
        
.ch_cls{
  background: #e4e4e4;
  }
</style>
<script type="text/javascript">
function deletetea(id){
	confirm_=confirm("确认删除该名教师？");
	if(confirm_){
		var idtea=id;
		$.ajax({
			data:{
				"id":idtea,
			},
		dataType:"text",
		type:"post",
		url:"${path }/teaches/tea_del",
		success:function(message){
			alert(message);
			window.location.href="${path}/teaches/allteacher";
		}
			
		})
	}

};

function queryMohu(){
	var content=document.getElementById("content").value;
	//alert(content);
	$.ajax({
		data:{
			"content":content,
		},
		dataType:"text",
		type:"post",
		url:"${path}/teaches/query",
		success:function(mess){
			if(mess=="b"){
				alert("暂无该老师信息，请重新确认");
				return ;
			}
			if(mess=="a"){//查找成功
				alert("查找成功!");
			    window.location.href="${path}/teaches/QueryByCondition?content="+encodeURI(encodeURI(content));
			}
		}
		
		
	})
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
<h3><span class="glyphicon glyphicon-tag" style="margin-right: 20px;"></span>教师管理</h3>
<a style="float: right;margin: 10px;color: white;width: 70px;height: 25px;text-align:center;
background-color: #48A3DA;text-align: center;border-radius:4px;" href="${path }/teacher/addteacher">
<span class="glyphicon glyphicon-plus-sign"></span>
添加</a>
<form class="navbar-form navbar-left" role="search">
  <div class="form-group">
    <input type="text" class="form-control" placeholder="输入姓名或教师号" id="content">
  </div>
  <button type="button" class="btn btn-default" onclick="queryMohu()">搜索</button>
</form>
<table class="table table-striped text-warning table-bordered" 
style="table-layout:fixed;" 
width="500px">

<!-- On cells (`td` or `th`) -->
<tr>
  <td class="warning" style="text-align: center;">头像</td>
  <td class="warning" style="text-align: center;">姓名</td>
  <td class="warning" style="text-align: center;">性别</td>
  <td class="warning" style="text-align: center;">序列号</td>
  <td class="warning" style="text-align: center;">籍贯</td>
  <td class="warning" style="text-align: center;">生日</td>
  <td class="warning" style="text-align: center;">职称</td>
  <td class="warning" style="text-align: center;">操作</td>
  <td class="warning" style="text-align: center;">- -</td>
</tr>

<c:forEach var="teacher" items="${teacher}">
<tr>
  <td class="info wrap" style="text-align: center;">
  <img alt="" src="/images/${teacher.headname}" class="img-circle" style="width: 30px;height: 30px;">
  </td>
  <td class="info wrap" style="text-align: center;">
  ${teacher.tname }
  </td>
  <td class="info wrap" style="text-align: center;">
  ${teacher.tsex }
  </td>
  <td class="info wrap" style="text-align: center;">
  ${teacher.tcode }
  </td>
  <td class="info wrap" style="text-align: center;">
  ${teacher.province }${teacher.city }
  </td>
  <td class="info wrap" style="text-align: center;">
  <fmt:formatDate value="${teacher.birth }"/>
  </td>
  <td class="info wrap" style="text-align: center;">
  ${teacher.workcall }
  </td>
  <td class="info" style="text-align: center;">
<a href="${path }/teacher/updateteacher?id=${teacher.id}">
<font style="color: #7A67EE">
<span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>修改</font></a>
<a onclick="deletetea(${teacher.id})" style="cursor: pointer;color: red;">
<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
删除</a>
<!-- href="${path }/teaches/tea_del?id=${teacher.id}" style="color: red;" -->
</td>
  <td class="info wrap" style="text-align: center;">
  <a style="cursor: pointer;color: brown;text-decoration: none;"
href="${path }/teaches/detailteacher?tid=${teacher.id}"
>
<span class="glyphicon glyphicon-align-justify"></span>
详情</a>
  </td>
</tr>
</c:forEach>
</table>
</div>

<div style="width: 100%;height: 20px; background-color: white;"></div>
</body>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>