<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教务信息</title>
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


<div style="margin-left: 200px;margin-right: 50px;">
<!-- 标题行 -->
<h3>
<span class="glyphicon glyphicon-tag" style="margin-right: 20px;">
教务管理</h3>
<!-- 按钮行 -->
<!-- 表格 -->
<form action="${path }/inform/re" >
<!-- <button type="button" class="btn btn-warning btn-sm" style="margin-bottom: 5px;float: right;margin-left: 10px;"
data-toggle="modal" data-target="#batches"
>
<span class="glyphicon glyphicon-open"></span>
批量导入</button> -->
<button type="button" class="btn btn-danger btn-sm"  style="margin-bottom: 5px;float: right;margin-left: 10px;" onclick="batcheInfor()">
<span class="glyphicon glyphicon-trash"></span>
批量删除</button>
<button type="submit" class="btn btn-primary btn-sm" style="margin-bottom: 5px;float: right;">
<span class="glyphicon glyphicon-plus-sign"></span>
添加通知
</button>
</form>
<div class="row" >
<div class="col-md-12">
<table class="table table-striped text-warning table-bordered" style="table-layout: fixed;">
<tr>
  <td class="warning" style="text-align: center;">
  <span class="glyphicon glyphicon-tasks"></span>
  </td>
  <!-- <td class="warning" style="text-align: center;">序号</td> -->
  <td class="warning" style="text-align: center;">标题</td>
  <td class="warning" style="text-align: center;">内容</td>
  <td class="warning" style="text-align: center;">发布时间</td>
  <td class="warning" style="text-align: center;">发布者</td>
  <td class="warning" style="text-align: center;">操作</td>
</tr>
<tr>
<c:forEach var="infor" items="${pageInfo.list}">
<tr>
<td style="text-align: center;"><input type="checkbox" name="check" value="${infor.id }"></td>
<%-- <td style="text-align: center;">${infor.id }</td> --%>
<td style="text-align: center;
             overflow:hidden;
             text-align: center;
             white-space:nowrap;
             text-overflow:ellipsis;">${infor.title }</td>
  
<td style="text-align: center;
             overflow:hidden;
             white-space:nowrap;
             text-overflow:ellipsis;">${infor.content }</td><!-- 人数加入 -->
<td style="text-align: center;"><fmt:formatDate value="${infor.infordate }"/></td>
<td style="text-align: center;">${infor.writer }</td>

<td style="text-align: center;">
<a style="cursor: pointer;color: blue;"
data-toggle="modal" data-target="#kans" data-id="${infor.id }"data-title="${infor.title}"
data-content="${infor.content}"
data-infordate="<fmt:formatDate value='${infor.infordate }'/>"
data-writer="${infor.writer }"
>
<span class="glyphicon glyphicon-zoom-in"></span>
详情</a>
<a style="cursor: pointer;color: red;" onclick="deletea(${infor.id })">
<span class="glyphicon glyphicon-trash"></span>
删除</button>
</a>


</tr>
</c:forEach>
</tr>
</table>



</div>
</div>
<!-- 分頁文字信息 -->
<div class="col-md-4">
当前第：<font  size="3">${pageInfo.pageNum }</font>页，总共：<font  size="3">${pageInfo.pages }</font>页，总

共：<font size="3">${pageInfo.total}</font>条记录
</div>
<!-- 分頁條信息 -->
<div class="col-md-8">
<nav aria-label="Page navigation">
  <ul class="pagination">
   <li><a href="${path }/inform/edit?pn=1">首页</a></li>
   <c:if test="${pageInfo.hasPreviousPage }">
    <li>
      <a href="${path }/inform/edit?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
   </c:if>
 
  <c:forEach items="${pageInfo.navigatepageNums }" var="pagenum">
    <c:if test="${pagenum==pageInfo.pageNum }">
    <li  class="active"><a href="#">${pagenum }</a></li>
    </c:if>
     <c:if test="${pagenum!=pageInfo.pageNum }">
    <li><a href="${path }/inform/edit?pn=${pagenum }">${pagenum }</a></li>
    </c:if>
    </c:forEach>
    <c:if test="${pageInfo.hasNextPage }">
   <li>
      <a href="${path }/inform/edit?pn=${pageInfo.pageNum+1 }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  
  </c:if>
    
     <li><a href="${path }/inform/edit?pn=${pageInfo.pages }">尾页</a></li>
  </ul>
</nav>
</div>
</div>

<jsp:include page="/WEB-INF/jsp/inform/informakan.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/inform/batches.jsp"></jsp:include>
</body>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>