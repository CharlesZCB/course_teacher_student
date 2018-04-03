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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>主页</title>  
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
 <script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
 <script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.js"></script>
 <style type="text/css">
.con{
width:810px;
margin:  auto;
}
div{

}
</style>


</head>
<body style="background-image: url('${path}/static/image/home/background.jpg');">

<div class="con" >
<jsp:include page="/WEB-INF/jsp/preshow/show/top.jsp"></jsp:include><!-- 菜单栏 -->
<!--左边 滚动栏目 -->
<div>
<div style="float: left;">
<jsp:include page="/WEB-INF/jsp/preshow/show/gundong.jsp"></jsp:include>
</div>
<div style="float: left;margin-top: 2px;">
<jsp:include page="/WEB-INF/jsp/preshow/show/inforpart.jsp"></jsp:include>
</div>
<div >
</div>
</div>
<div style="margin-top: 255px;width: 100%;">
<div style="height: 30px;background-color: #00AFE4;"></div>
<div style="float: left;height:260px;background-color: white;">
<h4>
<span class="glyphicon glyphicon-pushpin"></span>
<b>登录入口</b></h4>
<hr style=" border:none;border-top:2px groove #EE6A50;margin-top: 2px;"/>
<a href="${path }/front/loginstudent">
<img alt="" src="${path }/static/image/denglu/stu.png" style="width: 150px;height: 50px;"></a><br>
<a href="${path }/front/loginadmin">
<img alt="" src="${path }/static/image/denglu/admin.png" style="width: 150px;height:50px;margin-top: 10px;">
</a><br>
<a href="${path }/front/loginteacher">
<img alt="" src="${path }/static/image/denglu/tea.png" style="width: 150px;height: 50px;margin-top: 10px;"></a><br>
</div>

<div style="float: left;">
<jsp:include page="/WEB-INF/jsp/preshow/show/newsleft.jsp"></jsp:include>
</div>

<div style="width:405px; float: left;background-color: white;margin-left: 1px;">
<jsp:include page="/WEB-INF/jsp/preshow/show/videoshow.jsp"></jsp:include>
</div>
</div>
<div style="width: 810px; background-color: white;height: 50px;float: left;margin-top: -2px;;"></div>
</div>

</body>
<jsp:include page="/WEB-INF/jsp/preshow/bottom.jsp"></jsp:include>
</html>