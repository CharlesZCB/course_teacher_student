<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<%
pageContext.setAttribute("path", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.linews{
margin-left:20px;
padding:0px;
overflow:hidden;
text-align:left;
white-space:nowrap; 
width:200px;
text-overflow:ellipsis;
}
</style>
</head>
<body>
<div style="background-color: white;width: 250px;height: 260px;">
<div>
<h4>
<span class="glyphicon glyphicon-pushpin"></span>
<b>校内新闻</b> <a href="${path }/home/newsmore"><font style="font-style: italic;">
<span class="glyphicon glyphicon-th-list"></span>
</font></a></h4>
  <hr style=" border:none;border-top:2px groove #EE6A50;margin: 2px;" />
</div>
<ul>
<c:forEach var="news" items="${newsAll }" begin="0" end="6">
<li class="linews"><a href="${path }/home/detailnews?id=${news.id }">
<span class="glyphicon glyphicon-paperclip"></span>
${news.title }</a></li>

<br>
</c:forEach>
</ul>
</div>