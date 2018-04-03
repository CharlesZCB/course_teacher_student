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
   List li=(List)session.getAttribute("lists");
   
 int pn=Integer.parseInt(String.valueOf(session.getAttribute("pagenum"))); 
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

}</style>
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


<div style="margin-left: 200px;margin-right: 50px;">
<h3>班级详情</h3>
<div class="col-md-9 table-responsive" >

<div class="row">
<div class="col-md-4 row">
<div class="col-md-6">
导员：${classdetail.t_name }
</div>
<div class="col-md-6">
班级人数:${classdetail.snum }
</div>
</div>
<div class="col-md-6">
${classdetail.jibie } 级-${classdetail.name }(${classdetail.banhao })
</div>
</div>
<a href="${path }/classroom/classroomlist?pn=${pagenum }"><button style="float: right;margin-right: 30px;margin-bottom: 10px;" class="btn btn-default">
<span class="glyphicon glyphicon-share-alt"></span>  
返回</button></a>
<table class="table table-bordered">
<tr>
<th style="text-align: center;">学生姓名</th>
<th style="text-align: center;">性别</th>
<th style="text-align: center;">序列号</th>
<th style="text-align: center;">住址</th>
<th style="text-align: center;">生日</th>
</tr>
<!-- 循环打印学生信息 -->
<tr>
<c:forEach var="xuesheng" items="${users }">
<tr>
<td style="text-align: center;">${xuesheng.name }</td>
<td style="text-align: center;">${xuesheng.sex }</td>
<td style="text-align: center;">${xuesheng.scode }</td>
<td style="text-align: center;">${xuesheng.s_province }-${xuesheng.s_city }-${xuesheng.s_county }</td>
<td style="text-align: center;"><fmt:formatDate value="${xuesheng.birth }"/></td>

</tr>
</c:forEach>
</tr>


</table>
<label>班级课程信息</label>
<table class="table table-bordered" style="margin-top:10px;">
<tr>
<td style="text-align: center;">课程名</td>
<td style="text-align: center;">学时</td>
<td style="text-align: center;">授课教师</td>
</tr>
<c:forEach items="${listcourseteacher}" var="listdetailcourse">
<tr>
<td style="text-align: center;">${listdetailcourse.cname }</td>
<td style="text-align: center;">${listdetailcourse.ctime }</td>
<td style="text-align: center;">${listdetailcourse.tname }</td>
</tr>
</c:forEach>
</table>
</div>
</div>


</body>
</html>