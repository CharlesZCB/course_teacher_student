<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
pageContext.setAttribute("path", request.getContextPath());
%>
<meta charset="UTF-8">
<title>主页</title>
<link rel="stylesheet" href="${path }/static/bootstrap/css/bootstrap.min.css">
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
<!-- == -->
<!-- 标题 -->
<img alt="" src="${path }/static/image/home/backhome.png" onclick="goback()" style="cursor: pointer;width: 20px;height: 20px;margin-left: 20px;margin-top: 10px;">
 <div style="text-align:center;">
 <a style="cursor: pointer;text-decoration: none;"><font style="margin-top: 20px;margin-left: 20px;font-size:large;">
 &nbsp;&nbsp;
 <span class="glyphicon glyphicon-tags" style="margin-right: 20px;"></span>
 ${news.title }
 </font></a>
 </div>
<!-- 图片 -->
<div style="text-align: center;margin-top: 20px;">
<%-- <a href="/image/<%=request.getAttribute("image") %>"></a> --%>
<img alt="图片" src="/images/${news.image }" style="
width: 800px; height: 400px;;border-top-style:double;" class="img-fluid img-thumbnail" >
</div>
<!-- 正文 -->
<div style="margin-top: 20px;margin-right: 15px;margin-left: 15px;">
<pre>${news.content }</pre>
</div>
<!-- 时间 -->
<div>
<h5 style="float: right;margin-right: 40px;"><img alt="" src="${path }/static/image/sa.png">&nbsp发布时间：<fmt:formatDate value="${news.editdate }"/> </h5>
</div><br><br>
<!-- 作者 -->
<div>
<h5 style="float: right;margin-right: 40px;"><img alt="" src="${path }/static/image/edit.png">&nbsp文章编辑：<em>${news.editor }</em></h5>
</div>
</div>
<div style="background-color: #F8F8FF;height: 50px;"></div>
</div>
</body>
<script type="text/javascript">
function goback(){
	window.history.back(-1);
}
</script>
</html>