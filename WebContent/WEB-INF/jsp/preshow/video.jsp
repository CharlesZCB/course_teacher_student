<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<html>

<%
pageContext.setAttribute("path", request.getContextPath());
%>

<head>
<link rel="stylesheet" type="text/css" href="http://www.ijquery.cn/css/css.css" media="all" />
<script src="${path }/static/video/html5media.js"></script>
<script src="${path }/static/video/html5media.min.js"></script>
<style type="text/css"></style>
</head>
<body>
<div  style="width: 100%;height: 240px;">
<div style="position: relative;width: 100%;height: 150px;">

<video class="video" poster="/images/${video.pic}" 
style="width: 320px;height: 210px;"
 controls>
<source src="/images/${video.videoname }"></source>
</video>
<div style="position: absolute;">
(片名:${video.name }/上传于：<fmt:formatDate value="${video.dateTime }"/>)
</div>
</div>
</div> 
</body>
</html>