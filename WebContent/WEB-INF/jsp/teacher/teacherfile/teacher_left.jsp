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
	<a href=" ${path }/teacher/person?id=<%=session.getAttribute("tid") %>"><img src="${path }/static/image/teacher2.png">&nbsp个人中心</a>
	<a href="${path }/scores/classroom"><img src="${path }/static/image/class.png">&nbsp;主管班级</a>
	<a href="${path}/scores/score"><img src="${path }/static/image/score.png">&nbsp;成绩管理</a>
	<a href="${path}/scores/tableMain?id=<%=session.getAttribute("tid") %>"><img src="${path }/static/image/courset.png">&nbsp;课表查询</a>
	<a id="message"  href="${path }/score/message?tid=<%=session.getAttribute("tid") %>"><img src="${path }/static/image/message.png">&nbsp;课程消息</a>
	</nav>
</div>
</body>
</html>