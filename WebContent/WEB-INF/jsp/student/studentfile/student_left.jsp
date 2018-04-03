<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
  pageContext.setAttribute("path",request.getContextPath());
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${path }/static/homeleft/css/default.css" />
 <link rel="stylesheet" type="text/css" href="${path }/static/homeleft/css/component.css" />
<script src="${path }/static/homeleft/js/modernizr.custom.js"></script>
<script src="${path }/static/homeleft/js/classie.js"></script>
</head>
<body class="cbp-spmenu-push">
<div style="width: 150px;">
<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
	<a href="${path }/users/person?id=${stuidown}"><img src="${path }/static/image/teacher2.png">&nbsp;个人中心</a>
	<a href="${path }/users/scoreown?id=${stuidown}"><img src="${path }/static/image/scorestu.png">&nbsp;成绩查看</a>
	<a href="${path}/course/tablehome?id=${stuidown}"><img src="${path }/static/image/courset.png">&nbsp;课表查询</a>
</nav>
</div>
</body>
</html>


