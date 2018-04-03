<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
%>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
 <script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
 <script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="${path }/static/bootstrap/js/tea.js"></script>
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

td,th{
text-align: center;
}

  </style>
  <script type="text/javascript">
  $(document).ready(function(){
	  var tt=$("#m").val();
		 if(tt=="yes"){
			 var color=new Array("#CDCD00","#49A2DA");
			 var divmessage=document.getElementById("#message");
			 var i = -1;
			 setInterval(function () {
			    i++;
			    i%=color.length;
			    $("#message").css("background-color",color[i]);
			    }, 400);
		 }
		
	  
  });
  
  function Delete(mesid){
	  $.ajax({
		data:{
			"id":mesid,
		},
		type:"post",
		dataType:"text",
		url:"${path}/message/delete",
		success:function(message){
			alert(message);
			window.location.reload();
		}
		  
	  })
  }
  </script>

</head>

<body style="overflow-x: hidden">
<div class="row" style="background-color: #dcdc;">
<div class="col-md-2">
<jsp:include page="/WEB-INF/jsp/teacher/teacherfile/teacher_left.jsp"></jsp:include>
</div>

<div class="col-md-10">
<div>
<jsp:include page="/WEB-INF/jsp/page/navbar_top.jsp"></jsp:include>
<div id="time" style="float: right; margin-right: 100px;"></div>
</div>
</div>
</div>
<input style="margin-left: 300px;" type="hidden" id="m" value="${po }">

<div style="margin-left: 200px;margin-right: 50px;margin-top: 20px;">
<h3>
<span class="glyphicon glyphicon-tag"></span>
消息通知</h3>

<table class="table table-striped text-warning table-bordered">
<tr>
<td>时间</td>
<td>内容</td>
<td>操作</td>
<td>#</td>
</tr>
<c:if test="${empty message }">
<tr>
<td colspan="4" style="text-align: center;margin-top: 50%;">暂无消息记录</td>
</tr>
</c:if>
<c:if test="${!empty message }">

<c:forEach items="${message }" var="list">
<tr>
<td>
<c:if test="${list.biaoji==0 }">
<b><fmt:formatDate value="${list.time }" pattern="yyyy-MM-dd HH:mm:ss"/></b>
</c:if>
<c:if test="${list.biaoji==1 }">
<fmt:formatDate value="${list.time }" pattern="yyyy-MM-dd HH:mm:ss"/>
</c:if>
</td>
<td>
<c:if test="${list.biaoji==0 }">
<b>您好，您所带的班级:${list.banming }(${list.banhao})-${list.cname }成绩尚未录入！提醒您请及时录入成绩</b>
</c:if>
<c:if test="${list.biaoji==1 }">
您好，您所带的班级:${list.banming }(${list.banhao})-${list.cname }成绩尚未录入！提醒您请及时录入成绩
</c:if>
</td>
<td><a href="${path }/message/oksure?id=${list.id}&tid=${tid}" style="cursor: pointer;color: #8D6E35">
<c:if test="${list.biaoji==0 }">
<span class="glyphicon glyphicon-folder-close"></span>&nbsp;<font style="color: red;">确定</font>
</c:if>
</a>
<c:if test="${list.biaoji==1 }">
<span class="glyphicon glyphicon-folder-open"></span>&nbsp;已阅读
</c:if>
</td>
<td>
<c:if test="${list.biaoji==1 }">
<a onclick="Delete(${list.id})" style="cursor: pointer;color: blue;">删除</a>
</c:if>
<c:if test="${list.biaoji==0 }">
- -
</c:if>
</td>

</tr>
</c:forEach>
</c:if>
</table>
</div>
</body>
<script type="text/javascript">
$('img').on('mousedown',function (e) {
	    e.preventDefault()
	})	
</script>
</html>