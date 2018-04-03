<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
   
%>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
 <script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
 <script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="${path }/static/bootstrap/js/tea.js"></script>
  <script type="text/javascript" src="${path }/static/bootstrap/js/time.js"></script>
    <script type="text/javascript" src="${path }/static/teache/flag.js"></script>
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
th{
text-align: center;
}
  </style>
</head>

<body style="overflow-x: hidden">
<div class="row" style="background-color: #dcdc;">
<div class="col-md-2">
<jsp:include page="/WEB-INF/jsp/teacher/teacherfile/teacher_left.jsp"></jsp:include>
</div>
<input style="margin-left: 300px;" type="hidden" id="m" value="${po }">
<div class="col-md-10">
<div>
<jsp:include page="/WEB-INF/jsp/page/navbar_top.jsp"></jsp:include>
<div id="time" style="float: right; margin-right: 100px;"></div>
</div>
</div>
</div>

<div  style="margin-left: 200px;margin-right: 50px;">

<h3>
<span class="glyphicon glyphicon-tag"></span>
主管班级</h3>
<div class="col-md-10">
<table class="table table-striped text-warning table-bordered" >
<tr>
<td class="warning" style="text-align: center;"><b>级别</b></td>
<td class="warning" style="text-align: center;"><b>班级名</b></td>
<td class="warning" style="text-align: center;"><b>班级人数</b></td>
<td class="warning" style="text-align: center;"><b style="color: blue;">操作</b></td>
</tr>

<c:if test="${empty classroomlist }">
<tr>
<td colspan="4" style="text-align: center;">还没有您所带的班级！</td>
</tr>
</c:if>
<c:if test="${!empty classroomlist }">
<c:forEach var="classroom" items="${classroomlist }">
<tr>
<td style="text-align: center;">${classroom.jibie }级</td>
<td style="text-align: center;">${classroom.name }-${classroom.banhao }班</td>
<td style="text-align: center;">${classroom.snum }人</td><!-- 人数加入 -->
<td style="text-align: center;"><a href="${path }/score/ownclasscore/?classroomid=${classroom.id }"><font style="color: blue;">
<span class="glyphicon glyphicon-zoom-in"></span>
成绩查看</font></a>
</tr>
</c:forEach>
</c:if>
</table>
</div>
</div>



</body>
<script type="text/javascript">
$('img').on('mousedown',function (e) {
	    e.preventDefault()
	})	
</script>	

</html>