<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>视频信息</title>
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
<script type="text/javascript" src="${path }/static/bootstrap/js/time.js"></script>
	
<style type="text/css">
 .aaa{
            height: 32px;
            line-height: 22px;
            width:80px;
            padding: 0 10px;
            background: #87CEEB;
            border: 1px #26bbdb solid;
            border-radius: 3px;
            /*color: #fff;*/
            display: inline-block;
            text-decoration: none;
            color:white;
            font-size: 15px;
            outline: none;
            text-decoration：none;
            
        }
        
.b{
    border:1px 
    width:500px;
    height:40px;
    position:absolute;
    left:50%;
    bottom:0%;
    margin-left:-170px;
}
.mask{height:100%; width:100%; position:fixed; _position:absolute; top:0; z-index:1000; } 
.opacity{ opacity:0.6; filter: alpha(opacity=10); background-color:#000; }
</style>

</head>

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
<h3>视频添加</h3>
<div class="col-md-10 ">
<form action="${path }/video/addsure" enctype="multipart/form-data" method="post">
<table  class="table table-bordered">
<tr>
<td style="text-align: center;"><label> 视频文件选择</label></td>
<td style="text-align: center;"><input type="file" name="videofile" title="选择视频文件(英文名)" required="required"></td>
</tr>

<tr>
<td style="text-align: center;"><label>视频海报选择</label></td>
<td style="text-align: center;"><input name="pic" type="file" style="margin-top: 20px; " title="添加视频海报图"  required="required"></td>
</tr>

<tr>
<td style="text-align: center;"> <label>修改视频名称:</label> </td>
<td><input id="name" name="name" type="text" style="margin-top: 20px; "  required="required"></td>
</tr>

<tr>
<td style="text-align: center;"><label>视频发布者:</label> </td>
<td><input id="personname" name="personname" type="text" style="margin-top: 20px; "  required="required"></td>
</tr>
<tr>
<td style="text-align: center;"><label>视频简介：</label></td>
<td style="text-align: left;">
<textarea type="text"  name="introduce"
 style="overflow-x:hidden;width: 300px;resize:none;height: 200px"
 required="required"
 >
 </textarea>
</td>
</tr>
<tr>
<td style="text-align: center;" colspan="2">
<button onclick="goback()" class="btn btn-sm btn-primary" >
<span class="glyphicon glyphicon-share-alt"></span>
返回</button>
<button class="btn btn-sm btn-warning" type="submit"  >
<span class="glyphicon glyphicon-open"></span>
提交</button>
</td>
</tr>
</table>
</form>
</div>
</div> 

</body>
<script type="text/javascript">
function goback(){
	window.history.back(-1);
}
</script>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>