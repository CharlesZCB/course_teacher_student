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
<title>成绩信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
%>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
<script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
<script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/js/time.js"></script>
  <script type="text/javascript" src="${path }/static/teache/flag.js"></script>
<style type="text/css">
.b{
    border:1px 
    width:500px;
    height:40px;
    position:relative;
    left:50%;
    bottom:0%;
    margin-left:-170px;
   /* margin-top:-190px;*/

}
th,td{
text-align:center;
}
</style>
</head>

<body style="overflow-x: hidden;">
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

<div style="margin-left: 200px;margin-right: 50px;">
<h3><span class="glyphicon glyphicon-step-backward" onclick="backpage()"
style="margin-bottom: 10px;cursor: pointer;"
></span>上传情况</h3>

<table class="table table-striped text-warning table-bordered">
<tr>
<td class="warning">班级</td>
<td class="warning">班号</td>
<td class="warning">学号</td>
<td class="warning">姓名</td>
<td class="warning">分数</td>
<td class="warning">录入时间</td>
</tr>
<tr>
<c:if test="${empty listscore}">
<td colspan="6">对不起,该班级成绩尚未录入！！</td>
</c:if>
</tr>

<c:if test="${!empty listscore}">
<c:forEach items="${listscore }" var="list">
<tr>
<td class="info wrap">${bname}</td>
<td class="info wrap">${banhao}</td>
<td class="info wrap">${list.uid}</td>
<td class="info wrap">${list.uname}</td>
<td class="info wrap">${list.score}</td>
<td class="info wrap">
${list.dateup}
</td>
</tr>
</c:forEach>
</c:if>
</table>
</div>
</body>
<script type="text/javascript">
function backpage(){
	window.history.back(-1);
}
</script>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>