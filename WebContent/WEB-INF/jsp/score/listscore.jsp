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
}


</script>
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
<div style="margin-left: 200px;margin-right: 50px;" >
<h3>
<span class="glyphicon glyphicon-tag" style="margin-right: 20px;">
授录成绩</h3>
<form action="#">
<table class="table table-striped text-warning table-bordered" >
<tr>
<td class="warning" style="text-align: center;">年度选择</td>
<td class="warning" style="text-align: center;">学期选择</td>
<td class="warning" style="text-align: center;">截止时间</td>
<td class="warning" style="text-align: center;"></td>
</tr>
<tr>
<td class="warning" style="text-align: center; ">
<select id="year">
<option>年度选择</option>
<c:forEach items="${years }" var="listyear">
<option value="${listyear }">${listyear }</option>
</c:forEach>
</select>
</td>
<td class="warning" style="text-align: center; ">
<select style="height: 20px;" required="required" id="xueqi">
<option value=""    >学期选择</option>
<option value="上学期">上学期</option>
<option value="下学期">下学期</option>
</select>
</td>
<td class="warning" style="text-align: center;">
<input type="text" id="input1"  style="height: 20px;" required="required">
</td>
<td class="warning" style="text-align: center;">
<span class="glyphicon glyphicon-ok"></span>
<a onclick="Shouquan()" style="cursor: pointer;"><font style="color: brown;">
授权录分</font></a>
</td>
</tr>
</table>
</form>

<dir>已添加信息</dir>
<table class="table table-striped text-warning table-bordered" >
<tr>
<td class="warning" style="text-align: center;"><b>年度</b></td>
<td class="warning" style="text-align: center;"><b>学期</b></td>
<td class="warning" style="text-align: center;"><b>授录时间</b></td>
<td class="warning" style="text-align: center;"><b>截止时间</b></td>
<td class="warning" style="text-align: center;"><b>状态</b></td>
<td class="warning" style="text-align: center;"><b>操作</b></td>
</tr>
<c:forEach var="scoreinfor" items="${pageInfo.list }">
<tr>
<td class="info wrap" style="text-align: center;">${scoreinfor.year }</td>
<td class="info wrap" style="text-align: center;">${scoreinfor.xueqi }</td>
<td class="info wrap" style="text-align: center;">
<fmt:formatDate value="${scoreinfor.outtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
<td class="info wrap" style="text-align: center;">
<fmt:formatDate value="${scoreinfor.time }"    pattern="yyyy-MM-dd HH:mm:ss"/></td>
<td class="info wrap" style="text-align: center;">
<c:if test="${scoreinfor.flag==1}">
<font style="color: red;">已截止</font>
</c:if>
<c:if test="${scoreinfor.flag!=1}">
未截止
</c:if>
</td>
<td class="info wrap" style="text-align: center;">
<a href="${path }/score/detailteach?nian=${scoreinfor.year }&xueqi=${scoreinfor.xueqi }&flages=${scoreinfor.flag}" style="color: blue;">
<span class="glyphicon glyphicon-zoom-in"></span>
详情查看
</a>
</tr>
</c:forEach>
</table>
<input type="hidden" value="${scoreinfor.flag}" name="flages">
<div class="row" style="margin-left: 100px;" >
<!-- 分頁文字信息 -->
<div class="col-md-4">
当前第：<font  size="3">${pageInfo.pageNum }</font>页，总共：<font  size="3">${pageInfo.pages }</font>页，总

共：<font  size="3">${pageInfo.total}</font>条记录
</div>
<!-- 分頁條信息 -->
<div class="col-md-8">
<nav aria-label="Page navigation">
  <ul class="pagination">
   <li><a href="${path }/score/listscore?pn=1">首页</a></li>
   <c:if test="${pageInfo.hasPreviousPage }">
    <li>
      <a href="${path }/score/listscore?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
   </c:if>
 
  <c:forEach items="${pageInfo.navigatepageNums }" var="pagenum">
    <c:if test="${pagenum==pageInfo.pageNum }">
    <li  class="active"><a href="#">${pagenum }</a></li>
    </c:if>
     <c:if test="${pagenum!=pageInfo.pageNum }">
    <li><a href="${path }/score/listscore?pn=${pagenum }">${pagenum }</a></li>
    </c:if>
    </c:forEach>
    <c:if test="${pageInfo.hasNextPage }">
   <li>
      <a href="${path }/score/listscore?pn=${pageInfo.pageNum+1 }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  
  </c:if>
    
     <li><a href="${path }/score/listscore?pn=${pageInfo.pages }">尾页</a></li>
  </ul>
</nav>
</div>

</div>
</div>
<script src="${path }/static/scoreteacher/js/jquer_shijian.js?ver=1" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
$("#input1").shijian();
</script>	
</body>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>