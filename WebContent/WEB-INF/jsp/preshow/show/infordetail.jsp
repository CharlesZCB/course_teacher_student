<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
pageContext.setAttribute("path", request.getContextPath());
%>
<meta charset="UTF-8">
<title>主页</title>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
<script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
<script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
.con{
background-color:#F8F8FF;
width:810px;
margin:  auto;
}
pre { 
white-space: pre-wrap; /*css-3*/ 
white-space: -moz-pre-wrap; /*Mozilla,since1999*/ 
white-space: -pre-wrap; /*Opera4-6*/ 
white-space: -o-pre-wrap; /*Opera7*/ 
word-wrap: break-word; /*InternetExplorer5.5+*/
background-color: inherit;
border: 0px;
} 
</style>
</head>
<body style="background-color:#EEEED1;  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;" >
  <div class="con">
<jsp:include page="/WEB-INF/jsp/preshow/show/top.jsp"></jsp:include>
<div class="row whole">
<div style="margin-top: 20px;">
<!-- 标题 -->
<img alt="" src="${path }/static/image/home/backhome.png" onclick="goback()" style="cursor: pointer;width: 20px;height: 20px;margin-left: 20px;margin-top: 10px;">
<div style="text-align: center;">
 <font style="margin-top: 20px;margin-left: 20px;font-size:large;">
 &nbsp;&nbsp;
 <span class="glyphicon glyphicon-tags" style="margin-right: 20px;"></span>.
 ${infor.title }
 </font>

<!-- 内容 -->
<div style="margin-top: 20px;margin-left: 15px;margin-right: 15px;">
<pre>${infor.content }</pre>
</div>
<!-- 时间 -->
<div style="margin-top: 20px;float: right;margin-right: 50px;">
<img alt="" src="${path }/static/image/sa.png">&nbsp;<b><fmt:formatDate value="${infor.infordate }"/>:</b>
<b>${infor.writer }</b>

</div><br>

</div>

</div>

</div>
<div style="height: 50px;background:#F8F8FF; "></div>
<script type="text/javascript">
function goback(){
	window.history.back(-1);
}
</script>

</div>

</body>
</html>