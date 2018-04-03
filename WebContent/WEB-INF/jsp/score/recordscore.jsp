<%-- <%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教务信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
   String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间 
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
<div class="row">
<div class="col-md-12" style="background-color: #dcdc;">
<jsp:include page="/WEB-INF/jsp/page/navbar_top.jsp"></jsp:include>
<div id="time" style="float: right; margin-right: 100px;"></div>
</div>
</div>


<div class="row">
<div class="col-md-2">
<div>
<jsp:include page="/WEB-INF/jsp/page/navbar_left.jsp"></jsp:include>
</div>
</div>

<h3>成绩录入板块 </h3>
<div class="col-md-10 ">
<form>
<table class="table table-striped text-warning table-bordered" >
<thead>${jibie }级-${cname }(${banhao })————请在对应的方格内输入分数</thead>
<thead><input type="text" style="float: right;" value="请选择考试年度"></thead>
<!-- 表头项目行 -->
<tr>
<th>序列号</th>
<th>姓名</th>
<c:forEach items="${courses }" var="courses">
<th>${courses.cname }</th>
</c:forEach>
<th style="text-align: center;">操作</th>
</tr>
<!-- 内容填值 -->
<c:forEach items="${users }" var="users">
<tr>
<th>${users.scode }</th>
<th>${users.name }</th>
<c:forEach items="${courses }" var="courses">
<th><input type="text" name="sin"
onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" style="width: 30px;">
</th>
</c:forEach>
<th><button type="button" style="float: right;" class="btn btn-primary">提交</button>
<button  type="button" class="btn btn-warning">修改</button></th>
</tr>
</c:forEach>
</table>

</form>
</div>
</div>

<!-- 向后台传输成绩数据 -->
<script type="text/javascript">

</script>


</body>
</html> --%>