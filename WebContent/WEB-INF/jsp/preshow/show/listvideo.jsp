<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<%
pageContext.setAttribute("path", request.getContextPath());
%>
<meta charset="UTF-8">
<title>主页</title>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${path }/static/homejs/css/css.css"/>
<link rel="stylesheet" href="${path }/static/css/home.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
<script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
<script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
<SCRIPT type=text/javascript src="${path }/static/homejs/js/jquery.js"></SCRIPT>
<SCRIPT type=text/javascript src="${path }/static/homejs/js/js.js"></SCRIPT>
<style type="text/css">
.con{
background-color:#F8F8FF;
width:810px;
margin:  auto;
}
</style>

<script type="text/javascript">
function goback(){
	window.history.back(-1);
}
</script>
</head>
<body style="background-color:#EEEED1;  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;" >
<div class="con">
<jsp:include page="/WEB-INF/jsp/preshow/show/top.jsp"></jsp:include>
<div >
<div >
<img alt="" src="${path }/static/image/home/backhome.png" onclick="goback()" style="cursor: pointer;width: 20px;height: 20px;margin-left: 10px;margin-top: 10px;margin-bottom: 20px;">
<!-- 视频显示区域 -->
<div >
<div class='img-wrap' style="margin-top: 10px;">
<c:forEach items="${pageInfo.list }" var="list">
<div style="margin-bottom: 20px;display: inline-block;margin-right: 10px;margin-left: 15px;" id="videodiv">
<video class="video" poster="/images/${list.pic}" style="width: 240px;height: 150px;"controls>
<source src="/images/${list.videoname }"></source>
</video>
<div style="font-size: 8px;width: 240px;">
<span class="glyphicon glyphicon-facetime-video"></span>:&nbsp;:<font color="red">${list.name }</font>
<font style="float: right;">
<span class="glyphicon glyphicon-user"></span>：<font color="red">${list.personname }</font></font><br>
<span class="glyphicon glyphicon-time"></span>：<font color="red">
<fmt:formatDate value="${list.dateTime}" pattern="yyyy/MM/dd hh:mm" type="date" dateStyle="long" /> 
</font>
<font style="float: right;"><a title="${list.introduce }" style="cursor: pointer;">查看简介</a></font>
</div>
</div>
</c:forEach>


<div class="row">
<!-- 分頁文字信息 -->
<div class="col-md-4">
当前第<font color="red" size="3">${pageInfo.pageNum }</font>页,总共<font color="red" size="3">${pageInfo.pages }</font>页,总共:<font color="red" size="3">${pageInfo.total}</font>条记录
</div>

<!-- 分页信息-->
<div class="col-md-8">
<nav aria-label="Page navigation">
  <ul class="pagination">
   <li><a href="${path }/video/listshowvideo?pn=1">首页</a></li>
  <c:if test="${pageInfo.hasPreviousPage }">
    <li>
      <a href="${path }/video/listshowvideo?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
  </c:if>
  <c:forEach items="${pageInfo.navigatepageNums }" var="pagenum">
    <c:if test="${pagenum==pageInfo.pageNum }">
    <li  class="active"><a href="#">${pagenum }</a></li>
    </c:if>
     <c:if test="${pagenum!=pageInfo.pageNum }">
    <li><a href="${path }/video/listshowvideo?pn=${pagenum }">${pagenum }</a></li>
    </c:if>
    </c:forEach>
    <c:if test="${pageInfo.hasNextPage }">
   <li>
      <a href="${path }/video/listshowvideo?pn=${pageInfo.pageNum+1 }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  
  </c:if>
    
     <li><a href="${path }/video/listshowvideo?pn=${pageInfo.pages }">尾页</a></li>
  </ul>
</nav>
</div>

</div>
</div>
</div>

</div>
</div>
</div>
</body>
</html>