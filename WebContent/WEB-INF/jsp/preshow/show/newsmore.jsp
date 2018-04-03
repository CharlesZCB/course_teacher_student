<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
</head>
<body style="background-color:#EEEED1;  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;" >
  <div class="con">
<jsp:include page="/WEB-INF/jsp/preshow/show/top.jsp"></jsp:include>

<div class="row whole">
<div class="col-md-12">
<table class="table  text-warning table-bordered" style="table-layout:fixed;background-color: #F7F7F7;" >
<tr>
<td style="text-align:center;">插图</td>
<th style="text-align:center;">主题</th>
<th style="text-align:center;">内容</th>
<th style="text-align:center;">发布时间</th>
<th style="text-align:center;">发布人</th>
<th style="text-align:center;">操作</th>
</tr>


<c:forEach var="list" items="${pageInfo.list }">
<tr>
<td style="text-align:center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
<img alt="Responsive image" class="img-fluid img-thumbnail" style="text-align:center;width: 100px;height: 50px;" alt="" src="/images/${list.image }">
</td>
<td style="text-align:center; white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${list.title }</td>
<td style="text-align:center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${list.content }</td>
<td style="text-align:center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><fmt:formatDate value="${list.editdate }"/></td>
<td style="text-align:center;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">${list.editor }</td>
<td style="text-align:center;"><a href="${path }/home/detailnews?id=${list.id }" style="color: blue;" >查看</a></td>
</tr>
</c:forEach>
</table>
</div>
<!-- 分頁文字信息 -->
<div class="col-md-4" style="color: blue;">
当前第<font color="blue" size="3">${pageInfo.pageNum }</font>页,总共<font color="blue" size="3">${pageInfo.pages }</font>页,总共:<font color="blue" size="3">${pageInfo.total}</font>条记录
</div>
<!-- 分頁條信息 -->
<div class="col-md-8">
<nav aria-label="Page navigation">
  <ul class="pagination">
   <li><a href="${path }/home/newsmore?pn=1">首页</a></li>
  <c:if test="${pageInfo.hasPreviousPage }">
    <li>
      <a href="${path }/home/newsmore?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
  </c:if>
  <c:forEach items="${pageInfo.navigatepageNums }" var="pagenum">
    <c:if test="${pagenum==pageInfo.pageNum }">
    <li  class="active"><a href="#">${pagenum }</a></li>
    </c:if>
     <c:if test="${pagenum!=pageInfo.pageNum }">
    <li><a href="${path }/home/newsmore?pn=${pagenum }">${pagenum }</a></li>
    </c:if>
    </c:forEach>
    <c:if test="${pageInfo.hasNextPage }">
   <li>
      <a href="${path }/home/newsmore?pn=${pageInfo.pageNum+1 }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  
  </c:if>
    
     <li><a href="${path }/home/newsmore?pn=${pageInfo.pages }">尾页</a></li>
  </ul>
</nav>
</div>

</div>
<div style="background-color: #F8F8FF;height: 50px;"></div>
</div>
</body>
</html>