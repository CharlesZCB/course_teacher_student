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
  </style>
  <script type="text/javascript" src="${path }/static/teache/flag.js"></script>

</head>

<body style="overflow-x: hidden">
<div class="row" style="background-color: #dcdc;">
<div class="col-md-2">
<jsp:include page="/WEB-INF/jsp/teacher/teacherfile/teacher_left.jsp"></jsp:include>
</div>

<div class="col-md-10">
<div>
<jsp:include page="/WEB-INF/jsp/page/navbar_top.jsp"></jsp:include>
<div id="time" style="float: right; margin-right: 100px;"></div>
</div>
</div>
</div>

<input style="margin-left: 300px;" type="hidden" id="m" value="${po}">

<div style="text-align: center;">
<h1>欢迎来到教师中心！</h1>
<picture>
<img style="height: 100%;margin-top: 50px;" alt="Responsive image" class="img-fluid img-thumbnail" src="${path }/static/image/denglu/school.jpg">
</picture>

</div>
</body>
  <script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>