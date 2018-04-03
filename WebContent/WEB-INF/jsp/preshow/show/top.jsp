<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
pageContext.setAttribute("path", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${path }/static/menu/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${path }/static/menu/js/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#menu2 li a").wrapInner( '<span class="out"></span>' );
	$("#menu2 li a").each(function() {
		$( '<span class="over">' +  $(this).text() + '</span>' ).appendTo( this );
	});

	$("#menu2 li a").hover(function() {
		$(".out",	this).stop().animate({'top':	'48px'},	300); // move down - hide
		$(".over",	this).stop().animate({'top':	'0px'},		300); // move down - show

	}, function() {
		$(".out",	this).stop().animate({'top':	'0px'},		300); // move up - show
		$(".over",	this).stop().animate({'top':	'-48px'},	300); // move up - hide
	});

});
</script>
</head>
<body class="keBody">
<div class="kePublic">
<!--效果html开始-->
<a href="#"><img src="${path }/static/image/ico/tubiao.ico" alt="" style="width: 60px;height: 40px;border-radius:5px 0 0 0;"/></a>
<div id="menu2" class="menu" style="float: right;border-radius:0 5px 0 0;">
  <ul>
    <li><a href="${path }/front/home">首 页</a></li>
    <li><a href="#">校园风光</a></li>
    <li><a href="#">文档下载</a></li>
    <li><a href="#">教师专区</a></li>
    <li><a href="#">学生专区</a></li>
    <li><a href="#">校园比赛</a></li>
  </ul>
</div>
<!--效果html结束-->

</div>
</body>
</html>