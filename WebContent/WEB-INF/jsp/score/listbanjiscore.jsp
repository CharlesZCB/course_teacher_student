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
    <script type="text/javascript" src="${path }/static/teache/flag.js"></script>
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
th{
text-align: center;
}
td{
text-align: center;
}
  </style>
  
  <script type="text/javascript">
  function  getClass(id){//课程的id
	  //通过课程的id 获取到班级
	  cid=id;
  //alert(cid);
  var bool=0;
  var div=document.getElementById("course");
  var banji=document.getElementById("banji");
  div.style.display="none";
  banji.style.display="block";
	  $.ajax({
		data:{
			"cid":cid
		},
		dataType:"json",
		method:"post",
		url:"getclass",
		success:function( listclassroom ){
	        var pt=JSON.stringify(listclassroom);
	       //alert(pt);
	         for(var i=0;i<pt.length;i++){
	        	 var id=listclassroom[i].id;
	        	 var name1=listclassroom[i].name;
	        	 var jibie=listclassroom[i].jibie;
	        	 var banhao=listclassroom[i].banhao;
	        	 var snum=listclassroom[i].snum;
	        	 
	        	 $("#table").append("<tr><td>"+jibie+"</td><td>"+name1+"</td><td>"+banhao+"</td><td>"+snum+'人'+"</td><td><a style='color:blue;' href='${path}/scores/lufen?id="+id   +"&cid="+  cid +"  ' ><span class='glyphicon glyphicon-pencil'></span>&nbsp;录入分数</td></tr>");
	        	 /* bool=bool+1; */
	        	 if(bool==0){
	        		 $("#detail").append("<a href='${path}/score/tablescore/?cid="+cid+"&bid="+pt +"' style='color:blue; cursor: pointer;text-decoration: none;'><span class='glyphicon glyphicon-list'></span>&nbsp;各班情况</a>");
	        		 bool=bool+1;
	        	 }
	        	 
	        } 
	         
		}
		/* <a id="detail"  style="cursor: pointer;color: blue;float: right;" href="${path }/score/tablescore?courseid=">
		<span class="glyphicon glyphicon-tasks" style="color: black;"></span>
		各班情况</a> */  
		  
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

<div style="margin-left: 200px;margin-right: 50px;">

<h3>
<span class="glyphicon glyphicon-tag"></span>
成绩管理</h3>
<div class="col-md-10">

<div id="banji"style="display: none;">
<a href="${path}/scores/score" style="cursor: pointer;color: blue;">
<span class="
glyphicon glyphicon-menu-left" style="color: black;"></span>
返回</a>
<!-- <div style="float: right;">各班情况</div> -->
<div id="detail" style="float: right;"></div>
<table border="1" id="table" class="table table-striped text-warning table-bordered">
<tr>
<td>级别</td>
<td>班级名</td>
<td>班号</td>
<td>班级人数</td>
<td>选择</td>
</tr>
</table>
</div>
<input style="margin-left: 300px;" type="hidden" id="m" value="${po }">
<div id="course" style="width: 950px;">
<c:if test="${empty courses }">
<div style="margin-left: 200px;">
<h1 style="margin-left: 140px;">暂时还没有您的课程！</h1>
<img alt="" src="${path }/static/image/teacherperson/timg.jpg">
</div>
</c:if>
<ul style="list-style:decimal;" id="ul">
<c:forEach items="${courses }" var="cou">
<a onclick="getClass(${cou.cid})" style="cursor: pointer;">
<li style="border-style:outset;padding: 30px;display:inline;float:left;margin: 20px;background-color: #EEEED1;" 
id="to">
<font style="color: blue;">${cou.cname }(${cou.ccode })</font>
<img alt="" src="${path }/static/image/file.png">
</li>
</a>
</c:forEach>
</ul>
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