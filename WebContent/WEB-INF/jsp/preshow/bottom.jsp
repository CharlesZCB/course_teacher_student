<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*;" %>
       <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<%
pageContext.setAttribute("path", request.getContextPath());
%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"></meta>
<link rel="stylesheet" type="text/css" media="all" href="${path }/static/bottom_home/css/style.css"></link>
<script type="text/javascript" src="${path }/static/bottom_home/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
jQuery(function($) {

$('#toggling').hide();

var footerHeight = $('#footer').outerHeight(true);

$('#footer-toggle').click(function(){

	$('#toggling').animate({

		'height':'toggle'

	}, 500);

	$(this).toggleClass('expanded');

	return false;

});

});

</script>
<style type="">

a{
cursor: pointer;
}
</style>


</head>



<body>

<div id="fixed-footer-wrap">
    <!-- Footer -->
    <div id="footer-wrap">
        <div id="footer">
            <a class="" href="#" id="footer-toggle"><span></span></a>
            <div id="toggling">
            	<div class="border-top" style="text-align: center;">
                <h6>
                本款Web基于SSM设计的教务系统,采用Ajax Bootstrap 等前端技术<br><br>
                后台拥有             <a style="text-decoration: underline;">教师管理</a>  
                  <a style="text-decoration: underline;">学生管理</a>
                  <a style="text-decoration: underline;">教务信息管理</a>  
                  <a style="text-decoration: underline;">视频管理</a> 
                  <a style="text-decoration: underline;">教室管理</a>
                  <a style="text-decoration: underline;">学生成绩管理</a>
                  <a style="text-decoration: underline;">课表查询</a>等
               
                </h6>
                </div>
            </div>
        </div>
    </div>
    <div id="fixed-footer" style="text-align: center;font-size: 10px;">        
      设计者： Charles Zhang V1.0 &nbsp;&nbsp;&nbsp;|
			&nbsp;&nbsp;&nbsp;参考网站： <a href="">Github</a>&&<a href="">Bootstrap</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;历史访问人次：<a style="cursor: pointer;text-decoration: none;color: black;"><%=session.getAttribute("total") %></a>
    </div>
</div>
</body>
</html>

