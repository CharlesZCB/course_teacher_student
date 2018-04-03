<%@page import="com.cn.bean.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加课程信息</title>
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




<div style="margin-left: 200px;margin-right: 1000px;margin-top: 20px;margin-bottom: 100px;">

<table class="table table-bordered">
<tr>
<td style="text-align: center;"><label>课程代号：</label></td>
<td style="text-align: center;"><font>${ccode }</font></td>
</tr>

<tr>
<td style="text-align: center;"><label>课程名字：</label></td>
<td style="text-align: center;"><font>${cname }</font></td>
</tr>

<tr>
<td style="text-align: center;"><label>课时：</label></td>
<td style="text-align: center;"> <font >${ctime }&nbsp课时</font></td>
</tr>

<tr>
<td style="text-align: center;"><label>学分：</label></td>
<td style="text-align: center;"><font >${cscore }&nbsp分</font></td>
</tr>

<tr>
<td style="text-align: center;"><label>授课教师：</label></td>
<td style="text-align: center;">
<c:forEach items="${teachers}" var="t"><a style="color: red;" href="${path }/teaches/detailteacher?tid=${t.id}">${t.tname }</a>&nbsp;</c:forEach></td>
</tr>

<tr>
<td style="text-align: center;"><label>课程简介：</label></td>
<td style="text-align: center;">
<textarea
 style="overflow-x:hidden;width: 300px;text-align:center;
 resize:none;height: 200px;border: 0px;"
 readonly="readonly"
 >${cintroduce }</textarea>
</td>
</tr>
<tr>
<td colspan="2" style="text-align: center;">
<button onclick="Setback()"
style="margin-left: 300px;"
type="button" class="btn btn-default">
<span class="glyphicon glyphicon-share-alt"></span>
  返回前页
</button>
</td>
</tr>
</table>
</div>
<script type="text/javascript">
function Setback(){
	window.history.back(-1);	
};
$('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
</script>    
</body>
</html>