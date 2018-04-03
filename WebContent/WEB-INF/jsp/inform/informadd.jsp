<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教务添加</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
%>
<% 
   String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间 
%>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
<script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
<script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/js/inform.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/js/time.js"></script>

<style type="text/css">
.b{
    border:1px 
    width:500px;
    height:40px;
    position:absolute;
    left:50%;
    bottom:0%;
    margin-left:-170px;
   /* margin-top:-190px;*/

}</style>


<body style="overflow-x: hidden">
<div class="row" style="background-color: #dcdc;">
<div class="col-md-2">
<jsp:include page="/WEB-INF/jsp/page/navbar_left.jsp"></jsp:include>
</div>

<div class="col-md-10">
<div>
<jsp:include page="/WEB-INF/jsp/page/navbar_top.jsp"></jsp:include>
<div id="time" style="float: right; margin-right: 100px;"></div>
</div>
</div>
</div>


<div style="margin-left: 200px;margin-right: 50px;margin-top: 20px;">

<form action="addinform"  method="post">
<table class="table table-bordered">
<tr>
<td style="text-align: center;"><label for="exampleInputEmail1">题目</label></td>
<td style="text-align: center;"><input type="text" class="form-control" required="required"
     id="title" placeholder="标题" name="title"
     style="width:300px "></td>
</tr>
<tr>
<td style="text-align: center;"><label for="exampleInputFile">正文编辑</label></td>
<td style="text-align: left;">
<textarea type="text" id="content" name="content" required="required"
    style="overflow-x:hidden;width: 300px;resize:none;height: 300px"
    >
    </textarea>
</td>
</tr>
<tr>
<td style="text-align: center;"> <label for="exampleInputEmail1">发布者</label></td>
<td style="text-align: center;">
<input type="text" class="form-control" id="writer" placeholder="签名处" name="writer"
    style="width:300px; "
    required="required"
    >
</td>
</tr>
<tr>
<td style="text-align: center;" colspan="2"> 
<button type="submit" class="btn btn-default">
<span class="glyphicon glyphicon-ok"></span>
提交发布</button>
 <button type="button" onclick="backpage()" class="btn btn-default">
 <span class="glyphicon glyphicon-share-alt"></span> 
 放弃返回</button>
</td>
</tr>
</table>
</form>
</div>
</body>
<script type="text/javascript">
function backpage(){
	window.history.back(-1);
}
</script>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>