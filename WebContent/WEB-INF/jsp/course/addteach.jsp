<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教务信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
%>
<% 
   String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间
   int cc=Integer.parseInt(String.valueOf(session.getAttribute("cid")));
		  
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
<% 
   int pages=Integer.parseInt(String.valueOf(session.getAttribute("pas")));
%>
<script type="text/javascript">
function courseteacher(){

	var teach=document.getElementById("teach").value;
	var s1=document.getElementById("s1").value;
	var pn=document.getElementById("pn").value;
	var cc=document.getElementById("cc").value;
	var week=document.getElementById("week").value;
	var jie=document.getElementById("jie").value;
	$.ajax({
		data:{
			"pn":pn,
			"cc":cc,
			"teach":teach,
			"s1":s1,
			"week":week,
			"jie":jie,
		},
		type:"post",
		dataType:"text",
		url:"${path}/course/sureaddteach",
		success:function(message){
			if(message!=""){
				alert(message);
				window.location.reload();
			}
			else if(message==""){
				alert("插入成功！");
				window.location.reload();
			}
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


<!-- 显示年份 -->
<div style="margin-left: 200px;margin-right: 50px;">
<h3>授权课程教师</h3>
<div class="col-md-9 ">


<label style="margin-top: 20px;">所在课程页面：</label><font style="color: red;">${course.cname }(${course.ccode })</font><br>
<label style="margin-top: 10px;">目前课任教师：</label>
<c:forEach items="${teacherlist }" var="tea">
<font style="color:olive;">${tea.tname },</font>
</c:forEach>
<input type="hidden" value="<%=pages %>" id="pn">
<input type="hidden" value="<%=cc %>" id="cc">
<form <%-- action="sureaddteach?pn=<%=pages %>&cc=<%=cc %>" method="post" --%>>

<table class="table table-bordered" 
style="margin-top: 20px;" >

<tr>
  <td class="warning" style="text-align: center;">教师选择</td>
  <td class="warning" style="text-align: center;">选择授课班级</td>
   <td class="warning" style="text-align: center;">上课时间</td>
</tr>


<tr>
  <td class="info wrap" style="text-align: center;" >
   
   <select name="teach" id="teach" required="required">
   <c:forEach items="${teachers}" var="teacher">
   <option value="${teacher.id }" >${teacher.tname }(${teacher.tcode })</option>
   </c:forEach>
   </select>
  </td>
<td class="info wrap" style="text-align: center;" >
   <select name="s1" required="required" id="s1">
   <c:forEach items="${classroom }" var="rooms">
   <option value="${rooms.banhao }">${rooms.jibie}级${rooms.name }(${rooms.banhao })</option>
   </c:forEach>
   </select>
<%-- <select name="s2" required="required" id="s2">
   <c:forEach items="${classroom }" var="rooms">
   <option value="${rooms.banhao }" >${rooms.jibie}级${rooms.name }(${rooms.banhao })</option>
   </c:forEach>
</select> --%>
</td>
<td class="info wrap" style="text-align: center;" >
<select id="week" required="required">
<option value="周一">周一</option>
<option value="周二">周二</option>
<option value="周三">周三</option>
<option value="周四">周四</option>
<option value="周五">周五</option>
</select>
<select id="jie" required="required">
<option value="第一节">第一节</option>
<option value="第二节">第二节</option>
<option value="第三节">第三节</option>
<option value="第四节">第四节</option>
<option value="第五节">第五节</option>
<option value="第六节">第六节</option>
</select>


  </td> 
</tr>

</table>
<button type="button" class="btn btn-primary" style="margin-bottom: 10px;float: right;"
onclick="courseteacher()"
>
<span class="glyphicon glyphicon-ok"></span>
授权教师
</button>
<a href="backpages?pn=<%=pages %>"><button type="button" class="btn btn-warning" style="margin-bottom: 10px;float: right;margin-right: 10px;">
<span class="glyphicon glyphicon-share-alt"></span> 
返回上页
</button>
</a>
</form>
</div>
</div>

</body>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>