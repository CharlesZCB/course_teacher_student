<%@page import="com.cn.bean.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加课程信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
%>

<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
 <link rel="stylesheet" href="${path}/static/numjijian/css/wan-spinner.css" />
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
<script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
<script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/js/time.js"></script>
<script type="text/javascript" src="${path }/static/numjijian/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/numjijian/js/indexjs.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/My97DatePicker/WdatePicker.js"></script>
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
}
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

<div style="margin-left: 200px;margin-right: 100px;margin-top: 20px;">
<form action="addcourses" accept-charset="UTF-8" method="post">
<table class="table table-bordered">
<tr>
<td style="text-align: left;"><label>课程名字：</label></td>
<td style="text-align: left;"><input  type="text" name="cname" required="required"/></td>
</tr>
<tr>
<td style="text-align: left;"><label>年度选择：</label></td>
<td style="text-align: left;"><input onFocus="WdatePicker({lang:'zh-cn',dateFmt:'yyyy'})" type="text" name="year" required="required"/></td>
</tr>
<tr>
<td style="text-align: left;"><label>课时选择：</label></td>
<td style="text-align: left;"><input class="sdddq" id="inp" name="ctime" required="required"></td>
</tr>
<tr>
<td style="text-align: left;"><label>学分选择：</label></td>
<td style="text-align: left;"> <input class="sdddq" id="inputs"  name="cscore" required="required"></td>
</tr>
<tr>
<td style="text-align: left;"><label>课程简介：</label></td>
<td style="text-align: left;">
<textarea type="text" name="cintroduce"
 style="overflow-x:hidden;width: 300px;resize:none;height: 200px">
 </textarea>
</td>
</tr>
<tr>
<td style="text-align: left;"><label>班级级别,学期选择：</label></td>
<td style="text-align: left;">
 <select name="jibie" required="required">
 <option value="">班级级别选择</option>
<c:forEach items="${jibie }" var="jibie">
<option value="${jibie.jibie }">${jibie.jibie }</option>
</c:forEach>
 </select>
 
 
 <select name="xueqi" required="required">
 <option value="">学期选择</option>
 <option value="上学期">上学期</option>
 <option value="下学期">下学期</option>
 </select>
</td>
</tr>
<tr>
<td style="text-align: center;" colspan="2">
<button type="button" class="btn btn-default" onclick="backpage()" >
<span class="glyphicon glyphicon-share-alt"></span> 
放弃填写</button>
<button type="submit" class="btn btn-default" >
 <span class="glyphicon glyphicon-ok"></span>
提交数据库</button>
</td>
</tr>
</table>
</form>
<div style="height: 20px;width: 100%;"></div>
</div>

</body>
<script type="text/javascript">
function backpage(){
	window.history.back(-1);
};
$('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
</script>

</html>
