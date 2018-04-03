<%@ page pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <%
 pageContext.setAttribute("path", request.getContextPath());
 %>
 
 <html>
 <head>
 <%
 pageContext.setAttribute("page",request.getContextPath());
 %>
<link rel="stylesheet" type="text/css" href="${path }/static/homeleft/css/default.css" />
 <link rel="stylesheet" type="text/css" href="${path }/static/homeleft/css/component.css" />
<script src="${path }/static/homeleft/js/modernizr.custom.js"></script>
<script src="${path }/static/homeleft/js/classie.js"></script>
 </head>
 <body class="cbp-spmenu-push">
<div style="width: 150px;">
	<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
	<a href="${path }/teaches/allteacher?pn=1"><img src="${path }/static/image/teacher2.png">&nbsp;教师管理</a>
	<a href="${path }/classroom/classroomlist?pn=1"><img src="${path }/static/image/class.png">&nbsp;班级管理</a>
	<a href="${path }/users/stus?pn=1"><img src="${path }/static/image/student2.png">&nbsp;学生管理</a>
	<a href="${path }/course/list?pn=1"><img src="${path }/static/image/course.png">&nbsp;课程管理</a>
	<a href="${path }/score/listscore?pn=1"><img src="${path }/static/image/score.png">&nbsp;授录成绩</a>
	<a href="${path }/inform/edit?pn=1"><img src="${path }/static/image/educate_s2.png">&nbsp;校园教务</a>
	<a href="${path }/news/show?pn=1"><img src="${path }/static/image/news2.png">&nbsp;校园新闻</a>
	<a href="${path }/video/show?pn=1"><img src="${path }/static/image/video.png">&nbsp;校园视频</a>
	</nav>
</div>
</body>
</html>