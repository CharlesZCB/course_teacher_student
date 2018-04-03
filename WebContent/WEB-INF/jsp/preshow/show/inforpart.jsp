<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
pageContext.setAttribute("path", request.getContextPath());  
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.liinfor{
    text-align:left;
    margin-top: 10px;
    overflow: hidden; /*自动隐藏文字*/
    text-overflow:ellipsis;/*文字隐藏后添加省略号*/
    white-space: nowrap;/*强制不换行*/
    width: 20em;/*不允许出现半汉字截断*/
    margin-left: 10px;
}
.sec{
height: 252px;
background-color: white;
width: 385px;
}
</style>
</head>
<body>
<!-- 教务通知： -->
    <div class="sec">
    <!-- 标题 -->
    <div >
    <h4>
    <span class="glyphicon glyphicon-pushpin"></span>
    <b>教务通知</b><a href="${path }/home/informore"><font style="font-style: italic;">
    <span class="glyphicon glyphicon-th-list"></span>
    </font></a></h4>
   <hr style=" border:none;border-top:1px groove #EE6A50;margin: 2px;" />
    </div>
    <!-- 查看更多 -->
   <ul>
    <c:forEach items="${informs }" var="infor" begin="0" end="8">
    <li class="liinfor">
    <a href="${path }/home/detailinfor?id=${infor.id }">
    <span class="glyphicon glyphicon-tags"></span>
    <fmt:formatDate value="${infor.infordate }"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    ${infor.title }</a>
     </li>
    </c:forEach>
    </ul>
    </div>
</body>
</html>