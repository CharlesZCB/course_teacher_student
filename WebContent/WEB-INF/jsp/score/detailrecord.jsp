<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>成绩信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
%>
<% 
   String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间 
%>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/static/scoreteacher/css/shijian.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
<script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
<script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/js/time.js"></script>
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
td,th{
text-align: center;
}
</style>
<script type="text/javascript">
function Shouquan(){
	var year=document.getElementById("year").value;
	var xueqi=document.getElementById("xueqi").value;
	var jiezhi=document.getElementById("input1").value;
	var xueqi1=encodeURI(xueqi);
	if(year==""||xueqi==""||jiezhi==""){
		alert("所选框不能有空！请重新选择");
		return;//直接结束
	}
	if(year!=""&&xueqi!=""&&jiezhi!=""){
		alert("您确定添加吗？确定后不可更改");
	}
	$.ajax({ 
		dataType:'text',
		method:"post",
        data:{"year":year,
        	  "xueqi":xueqi1,
        	  "jiezhi":jiezhi
        },
        url:'${path}/score/shouquan',
        success:function(message){//若一上执行成功  则走这步
        	alert(message);
            window.location.reload();
        }
		
		
		
	})
};
</script>
<style type="text/css">
textarea{ resize:none;}
</style>
</head>

<body style="overflow-x: hidden;">
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
<div style="margin-left: 200px;margin-right: 50px;margin-top: 20px;" >
<div style="margin-bottom: 20px;">
<a onclick="backpage()" style="color: brown;cursor: pointer;"><span class="glyphicon glyphicon-step-backward" ></span></a>
<div style="display: inline;"><font style="color: red;">${year }年-${xueqi }</font>&nbsp;教师授分情况</div>
</div>
<table class="table table-striped text-warning table-bordered" >
<tr>
<th>年度</th>
<th>学期</th>
<th>课程号</th>
<th>课程名</th>
<th>操作</th>
</tr>


<c:forEach items="${listcourse }" var="list">
<tr>
<td>${list.year }</td>
<td>${list.xueqi }</td>
<td id="ccode">${list.ccode }</td>
<td>${list.cname }</td>
<td><a  href="${path }/score/teachlist1?ccode=${list.cid }&flages=${flages}"  style="color: blue;cursor: pointer;">
<span class="glyphicon glyphicon-align-justify"></span>
授分情况</a></td>
</tr>
</c:forEach>

</table>
</div>


<script src="${path }/static/scoreteacher/js/jquer_shijian.js?ver=1" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
function backpage(){
	window.history.back(-1);
}
</script>	

</body>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>