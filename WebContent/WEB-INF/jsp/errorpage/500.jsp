<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
pageContext.setAttribute("path", request.getContextPath());
%>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
<script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
<script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	background-size: cover;
	background-image: url("${path}/static/image/errorpage/500.jpg");
}
.con{
    position: absolute;
    top: 50%;
    left:50%;
    height: 240px;
    margin-top: -120px; /* 盒子本身高度的一半 */
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>错误提示</title>
</head>
<body>
<div class="con">
<a style="cursor: pointer;" onclick="back()"><img alt="" src="${path }/static/image/errorpage/back.png">
<font style="color: white;">点此返回</font></a>
</div>
</body>
<jsp:include page="/WEB-INF/jsp/preshow/bottom.jsp"></jsp:include>
<script type="text/javascript">
function back(){
	window.history.back(-1);
}
</script>
</html>