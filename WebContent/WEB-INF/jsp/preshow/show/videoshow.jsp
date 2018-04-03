<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
pageContext.setAttribute("path", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div style="background-color: white;">
<div>
<h4 style="width:300px;">
<span class="glyphicon glyphicon-pushpin"></span>
<b>校园视频</b><a href="${path }/video/listshowvideo"><font style="font-style: italic;">
<span class="glyphicon glyphicon-th-list"></span>
</font></a></h4>
  <hr style="border:none;border-top:2px groove #EE6A50;margin: 2px;width: 100%;" />
  <jsp:include page="/WEB-INF/jsp/preshow/video.jsp"></jsp:include>
</div>
<ul>
</ul>
<!-- 查看更多 -->
</div>
</body>
</html>