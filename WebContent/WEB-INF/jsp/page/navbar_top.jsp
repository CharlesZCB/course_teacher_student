  <%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>顶部信息栏</title>

<%
pageContext.setAttribute("paths",request.getContextPath());
%>
<script type="text/javascript" src="${paths }/static/bootstrap/js/time.js"></script>
 </head>
 <body onload="start()">

	<div class="col-md-12" >
		<div class="row">
			<div  style="float: left;">
				<h3 style=" margin: 10px 0 0 0; ">Dou都教务后台管理系统</h3>
			</div>
		
			<div class="col-md-6">
				<h5 style="float: right;  margin: 15px 18px 0 0;">
					<a href="${paths }/school/invalid" style=""><font style="color: #4FA1A6">退出系统</font></a>
				</h5>
				<img style="float: right; margin: 15px 12px 0 0;"  src="${paths }/static/image/exit.png">
				<h5 style="float: right;  margin: 15px 18px 0 0;">
					<a href="${paths }/front/home" ><font style="color: #4FA1A6">前台首页</font>&nbsp;</a><font style="color: blue;">|</font>
				</h5>

				<img style="float: right; margin: 15px 12px 0 0;" src="${paths }/static/image/pre_home.png">
				<h5 style="float: right; margin: 15px 12px 0 0;color: blue;">
					
					,欢迎您|&nbsp;
				</h5>
				<h5 style="float: right; margin: 15px 12px 0 0;">
					<a href="#" style="color: brown;"><%= session.getAttribute("username") %></a>
				</h5>
				<div style="height: 25px;width: 25px;float: right;margin-top: -2px;">
				<c:if test='<%=session.getAttribute("headimg")==null%>'>
				<img  class="img-circle" style="margin-top:4px; width:18px;height:18px; float: right; margin: 15px 12px 0 0;" src="${paths}/static/image/useradmin.png">
				</c:if>
				<c:if test='<%=session.getAttribute("headimg")!=null%>'>
				<img  class="img-circle" style="margin-top:4px; width:18px;height:18px; float: right; margin: 15px 12px 0 0;" src="/images/<%=session.getAttribute("headimg")%>">
				</c:if>
				</div>
			</div>
			    <div>
				<div id="time" style="float: right;margin-top: 12px;">
				</div>
				</div>
				<img alt="时钟" src="${paths }/static/image/clock.png" 
				style="float: right; margin-right: 10px;margin-top: 15px;"> 
		</div>
	</div>
 </body>
 </html>