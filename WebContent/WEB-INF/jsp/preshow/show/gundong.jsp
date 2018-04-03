<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
pageContext.setAttribute("path", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></meta>
<link rel=stylesheet type=text/css href="${path }/static/gundong/css/css.css"></link>
<script type=text/javascript src="${path }/static/gundong/js/jquery.js"></script>
<script type=text/javascript src="${path }/static/gundong/js/js.js"></script>

<script type="text/javascript">
$(document).ready(function(){
  $(".area").hover(function(){
	  $(this).find(".qq").show(100);}
	  ,function(){
		$(this).find(".qq").hide(100);
	});
});
</script>
</head>
<body>
<div class="area">
	<a id="prev" class="prevBtn qq" href="javascript:void(0)"></a>
	<a id="next" class="nextBtn qq" href="javascript:void(0)"></a>
	<div id="js" class="js">
		<div class="box01">
		<c:forEach var="news" items="${NewsPic }" varStatus="tal">
		<img style="width: 425px;;height: 250px;;margin:0; padding:0; " src="/images/${news.image }"/>
		</c:forEach>
		</div>

		<div class="bg"></div>
		<div id="jsNav" class="jsNav">	
		<c:forEach var="news" items="${NewsPic }" varStatus="tal">	
		<c:if test="${tal.first }">
			<a class="trigger imgSelected" href="javascript:void(0)">1</a>
		</c:if>
		<c:if test="${!tal.first }">
			<a class="trigger" href="javascript:void(0)">${tal.index+1 }</a>
		</c:if>
		</c:forEach>
		</div>
	</div>
</div>

</body>

</html>