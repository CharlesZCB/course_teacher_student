<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
%>
<% 
   String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间 
%>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
<link rel="stylesheet" href="${path}/static/bootstrap/css/c.css">
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
td{
text-align: center;
}
</style>
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
<div>

<!--修改 ---------------------------------------------------------------------------- -->
<div style="margin-left: 200px;margin-right: 200px;">
<button style="margin-top: 30px;" class="btn btn-default btn-sm" onclick="backpage()">
<span class="glyphicon glyphicon-chevron-left"></span>&nbsp;
返回</button>
<table class="table table-striped text-warning table-bordered" style="margin-top: 10px;">
<tr>
<td colspan="2" style="text-align: center;">
<img alt="" src="/images/${teacher.headname }" style="width: 50px;height: 50px;" class="img-thumbnail">
</td>
</tr>

<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/username.png">&nbsp;
姓名</td>
<td>
${teacher.tname }</td>
</tr>
<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/code.png">&nbsp;
编号</td>
<td>${teacher.tcode }</td>
</tr>
<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/sexm.png">&nbsp;
性别</td>
<td>${teacher.tsex }</td>
</tr>

<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/ident.png">&nbsp;
身份证</td>
<td>${teacher.ident }</td>
</tr>

<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/zhichen.png">&nbsp;
职称</td>
<td>${teacher.workcall }</td>
</tr>
<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/birthday.png">&nbsp;
生日</td>
<td>
<fmt:formatDate value="${teacher.birth }" pattern="yyyy-MM-dd"/></td>
</tr>
<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/address.png">&nbsp;
籍贯</td>
<td>${teacher.province }-${teacher.city }-${teacher.county }</td>
</tr>
<tr>

<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/phone.png">&nbsp;
电话</td>
<td>${teacher.telphone }</td>
</tr>
<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/email.png">&nbsp;
邮箱</td>
<td>${teacher.email}</td>
</tr>
<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/course.png">&nbsp;
授课</td>
<td>
<c:forEach items="${course }" var="item">
${item.cname }&nbsp;
</c:forEach>
</td>
</tr>


</table>


</div>
</div>
</body>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	});
  function backpage(){
	  window.history.back(-1);
  }
  </script>
</html>