<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>成绩信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
%>
<% 
   String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间 
%>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/static/scoreteacher/css/shijian.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
<script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
<script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/js/time.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/My97DatePicker/WdatePicker.js"></script>

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
td,th{
text-align: center;
}
</style>

 <script type="text/javascript">
function tipteach(tid,bcode,classname){
	//href='${path }/flag/tip?tid=${list.tid}'
	var cname=document.getElementById("cname").value;
	var cid=document.getElementById("cid").value;
	
	$.ajax({
		url:"${path }/flag/tip",
		data:{
			"cname":cname,//课程名字
			"classname":classname,//班级名字
			"bcode":bcode,//班号
			"tid":tid//教师id
		},
		type:"post",
		dataType:"text",
		success:function(message){
			alert(message);
			
		}
	})
	
}
</script> 
</head>

<body style="overflow-x: hidden;">
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
<div style="margin-left: 200px;margin-right: 50px;margin-top: 20px;" >
<div style="margin-bottom: 20px;">
<a onclick="backpage()" style="color: brown;cursor: pointer;"><span class="glyphicon glyphicon-step-backward" ></span></a>
<div style="display: inline;">&nbsp;<a href="${path }/course/detailcourse?cid=${id}" style="color: red;cursor: pointer;">${cname }</a>&nbsp;授分情况一览表</div>
</div>
<input type="hidden" value="${cname }" id="cname">
<input type="hidden" value="${id }" id="cid">
<table class="table table-striped text-warning table-bordered" >
<tr>
<th>班级号</th>
<th>班级名</th>
<th>授课教师</th>
<th>状态</th>
<th>操作</th>
</tr>
 <c:forEach items="${lists }" var="list">
<tr>
<td>${list.bid }</td>
<td>${list.classname }</td>
<td>${list.tname }</td>
<td>
<c:if test="${list.cname=='0' }">
暂未录入
</c:if>
<c:if test="${list.cname=='1' }">
录入完毕
</c:if>

</td>
<td>&nbsp;&nbsp;
<c:if test="${list.cname=='1' }">
- -
</c:if>
<c:if test="${list.cname=='0' }"><span class="glyphicon glyphicon-info-sign
"></span>
<c:if test="${flages!='1' }">
<a  style="cursor: pointer;color: red;" onclick="tipteach(${list.tid},${list.bid },'${list.classname }')">提醒</a>
</c:if>
<c:if test="${flages=='1' }">
已截止
</c:if>
</c:if>
</td>
</tr>
</c:forEach>
</table>
</div>

<script src="${path }/static/scoreteacher/js/jquer_shijian.js?ver=1" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
function backpage(){
	window.history.back(-1);
};
</script>	
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</body>
</html>