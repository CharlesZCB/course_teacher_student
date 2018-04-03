  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息</title>
<%
pageContext.setAttribute("paths",request.getContextPath());
%>
<script type="text/javascript" src="${paths }/static/bootstrap/js/time.js"></script>
 
 </head>
 <body style="margin: 0px;" onload="start()">
 <div class="row" id="header"  style="width: 100%;margin: 0px;">
 
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-6" style="float: left;">
				<img alt="" style="float: left;margin-left: -15px" src="<%-- ${paths }/static/image/neu.ico --%>">
				<h3 style=" margin: 10px 0 0 0; float:inherit;">学生信息系统中心</h3>
			</div>
		
			<div class="col-md-6">
				<h5 style="float: right;  margin: 15px 18px 0 0;">
					<a href="${paths }/school/invalid" style="">退出系统</a>
				</h5>
				<img style="float: right; margin: 15px 12px 0 0;"  src="${paths }/static/image/exit.png">

				<h5 style="float: right;  margin: 15px 18px 0 0;">
					<a href="${paths }/front/home" >前台首页&nbsp;|</a>
				</h5>
				
				<img style="float: right; margin: 15px 12px 0 0;" src="${paths }/static/image/pre_home.png">
				<h5 style="float: right; margin: 15px 12px 0 0;color: blue;">
					
					,欢迎您&nbsp;|
				</h5>
				<h5 style="float: right; margin: 15px 12px 0 0;">
					<a href="#" style="color: black;font-family: cursive;"><%=session.getAttribute("username") %></a>
				</h5>
				
				<img style="float: right; margin: 15px 12px 0 0;" src="${paths }/static/image/useradmin.png">
				
			</div>
				<div id="time" style="float: right; margin-right: 100px;margin-top: 16px;">
				</div>
				<img alt="时钟" src="${paths }/static/image/clock.png" 
				style="float: right; margin-right: 10px;margin-top: 16px;"> 
				
		</div>
		
	</div>
</div>
  
 </body>

 </html>