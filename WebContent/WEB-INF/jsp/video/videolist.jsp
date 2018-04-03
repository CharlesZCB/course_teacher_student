<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 
<!DOCTYPE>
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


<div style="margin-left: 200px;margin-right: 50px;margin-top: 20px;">
<h3 style="display: inline;">
<span class="glyphicon glyphicon-tag" style="margin-right: 20px;">
视频管理&nbsp;&nbsp;&nbsp;</h3>
<div style="float: right;">
<a  style="display: inline;color: blue;" href="${path}/video/addone">
<span class="glyphicon glyphicon-plus-sign"></span>
添加</a>&nbsp;
<a  style="display: inline;color: red;" href="${path}/video/deletepage">
<span class="glyphicon glyphicon-trash"></span>
删除</a>
</div>
</div><br><br>
<div>
<div class='img-wrap' style="width: 1200px;margin-left: 300px;">
<c:forEach items="${pageInfo.list }" var="list">
<div style="margin-bottom: 20px;display: inline-block;margin-right: 10px;" id="videodiv">
<video class="video" poster="/images/${list.pic}" style="width: 230px;height: 150px;"controls>
<source src="/images/${list.videoname }"></source>
</video>
<div style="font-size: 8px;width: 230px;">
 <span class="glyphicon glyphicon-facetime-video"></span>:&nbsp;<font color="red">${list.name }</font>
<font style="float: right;">
<span class="glyphicon glyphicon-user"></span>：<font color="red">${list.personname }</font></font><br>
<span class="glyphicon glyphicon-time"></span>：<font color="red">
<fmt:formatDate value="${list.dateTime}" pattern="yyyy/MM/dd hh:mm" type="date" dateStyle="long" /> 
</font>
<a title="${list.introduce }" style="cursor: pointer;"><font style="float: right;color: black;">查看简介</font></a>

</div>
</div>
</c:forEach>


<div class="row">
<!-- 分頁文字信息 -->
<div class="col-md-4">
当前第<font  size="3">${pageInfo.pageNum }</font>页,总共<font size="3">${pageInfo.pages }</font>页,总

共:<font size="3">${pageInfo.total}</font>条记录
</div>

<!-- 分页信息-->
<div class="col-md-8">
<nav aria-label="Page navigation">
  <ul class="pagination">
   <li><a href="${path }/video/show?pn=1">首页</a></li>
  <c:if test="${pageInfo.hasPreviousPage }">
    <li>
      <a href="${path }/video/show?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
  </c:if>
  <c:forEach items="${pageInfo.navigatepageNums }" var="pagenum">
    <c:if test="${pagenum==pageInfo.pageNum }">
    <li  class="active"><a href="#">${pagenum }</a></li>
    </c:if>
     <c:if test="${pagenum!=pageInfo.pageNum }">
    <li><a href="${path }/video/show?pn=${pagenum }">${pagenum }</a></li>
    </c:if>
    </c:forEach>
    <c:if test="${pageInfo.hasNextPage }">
   <li>
      <a href="${path }/video/show?pn=${pageInfo.pageNum+1 }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  
  </c:if>
    
     <li><a href="${path }/video/show?pn=${pageInfo.pages }">尾页</a></li>
  </ul>
</nav>
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