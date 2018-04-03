<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程信息</title>
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

}
</style>
<script type="text/javascript">
function deletecourse(id){
	var idc=id;
	confirma=confirm("您确定要删除该门课程？");
	if(confirma){
		$.ajax({
			url:"${path}/course/delete",
			dataType:"text",
			type:"post",
			data:{
				"cid":idc,
			},
			success:function(){
				alert("删除成功！");
				window.location.reload();
			}
			
			
			
		})
	}
	
	
};

</script>
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

<div style="margin-left: 200px;margin-right: 50px;">
<h3>
<span class="glyphicon glyphicon-tag" style="margin-right: 20px;">
课程信息</h3>
<div>
<form action="addcourse">
<button type="submit" class="btn btn-primary" style="float: right;margin:10px;">
<span class="glyphicon glyphicon-plus-sign"></span>
添加课程
</button>
</form>
<div class="row" >

<div>
<table class="table table-striped text-warning table-bordered" 
style="table-layout:fixed;" >

<tr>
  <td class="warning" style="text-align: center;">课程名称</td>
  <td class="warning" style="text-align: center;">课程序列号</td>
  <td class="warning" style="text-align: center;">课时</td>
  <td class="warning" style="text-align: center;">学分</td>
  <td class="warning" style="text-align: center;">针对级别</td>
  <td class="warning" style="text-align: center;">操作</td>
</tr>

<c:forEach var="courseItem" items="${pageInfo.list}">
<tr>
  <!-- <td class="info wrap" style="text-align: center;">#${courseItem.cid }</td> -->
  <td class="info wrap" style="text-align: center;">${courseItem.cname }</td>
  <td class="info wrap" style="text-align: center;">${courseItem.ccode }</td>
  <td class="info wrap" style="text-align: center;">${courseItem.ctime }课时</td>
  <td class="info wrap" style="text-align: center;">${courseItem.cscore }学分</td>
  <td class="info wrap" style="text-align: center;">${courseItem.jibie }</td>
  <td class="info" style="text-align: center;">
<a href="detailcourse?cid=${courseItem.cid }"><font style="color: blue;">
详情</font></a>&nbsp
<a href="addteachercourse?cid=${courseItem.cid }&page=${pageInfo.pageNum}&jibie=${courseItem.jibie}" style="color:grey;">
分配教师
</a>&nbsp;
<a  style="color: red;cursor: pointer;" onclick="deletecourse(${courseItem.cid})">
删除</a>
</td>
</tr>
</c:forEach>
</table>

</div>
<div class="row" style="margin-left: 100px;">
<!-- 分頁文字信息 -->
<div class="col-md-4">
当前第：<font  size="3">${pageInfo.pageNum }</font>页，总共：<font  size="3">${pageInfo.pages }</font>页，总

共：<font  size="3">${pageInfo.total}</font>条记录
</div>
<!-- 分頁條信息 -->
<div class="col-md-8">
<nav aria-label="Page navigation">
  <ul class="pagination">
   <li><a href="${path }/course/list?pn=1">首页</a></li>
   <c:if test="${pageInfo.hasPreviousPage }">
    <li>
      <a href="${path }/course/list?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
   </c:if>
 
  <c:forEach items="${pageInfo.navigatepageNums }" var="pagenum">
    <c:if test="${pagenum==pageInfo.pageNum }">
    <li  class="active"><a href="#">${pagenum }</a></li>
    </c:if>
     <c:if test="${pagenum!=pageInfo.pageNum }">
    <li><a href="${path }/course/list?pn=${pagenum }">${pagenum }</a></li>
    </c:if>
    </c:forEach>
    <c:if test="${pageInfo.hasNextPage }">
   <li>
      <a href="${path }/course/list?pn=${pageInfo.pageNum+1 }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  
  </c:if>
    
     <li><a href="${path }/course/list?pn=${pageInfo.pages }">尾页</a></li>
  </ul>
</nav>
</div>
</div>
</div>
</div>
</div>
</body>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>