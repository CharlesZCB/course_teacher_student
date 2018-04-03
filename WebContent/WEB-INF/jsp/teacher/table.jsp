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
  <script type="text/javascript" src="${path }/static/ExportExcel/jquery.table2excel.js"></script>
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
$(function(){
        $("#btn").click(function(){
        	var ifno=document.getElementById("ta");
        		   $("#tableid").table2excel({
                       // 不被导出的表格行的CSS class类
                       exclude: ".noExl",
                       // 导出的Excel文档的名称，（没看到作用）
                       name: "Excel Document Name",
                       // Excel文件的名称
                       filename: "导出的excel"
                   });
        });
    });
    
    function QueryTable(){
    	
    	var year1=document.getElementById("year").value;
    	/* alert(year1); */
    	var tid=document.getElementById("tid").value;
    	if(year1==""){
    		alert("请先选择年度！");
    	}
    	else{
    		var year=encodeURI(year1);
        	//alert(year);
        	$.ajax({
        		data:{
        			"id":tid,
        			"year":year
        		},
        		dataType:"text",
        		type:"post",
        		url:"${path}/scores/table1",
        		success:function(message){
        			if(message=="yes"){
        				alert("查找成功！");
        				window.location.href="${path}/scores/table?id="+tid+"&year="+encodeURI(year);
        			}
        			else{
        				alert("对不起,没有该年数据");
        			}
        		}
        		
        		
        	})
        };
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

<div style="margin-left: 200px;margin-right: 50px;">
<h3>
<span class="glyphicon glyphicon-tag"></span>
个人课表</h3><button style="margin-bottom: 10px;float: right;" class="btn btn-primary" onclick="javascript:method1('ta')">
<span class="glyphicon glyphicon-save"></span>
导出课表</button>

<input type="hidden" id="tid" value="${tid }">
<select name="year" id="year" required="required">
<option value="">选择年度</option>
<c:forEach items="${listcourse}" var="listcourse">
<option value="${listcourse.year}-${listcourse.xueqi }">${listcourse.year}-${listcourse.xueqi }</option>
</c:forEach>
</select>
<button onclick="QueryTable()" class="btn btn-default btn-sm" style="margin-left: 20px;margin-bottom: 10px;">
<span class="glyphicon glyphicon-search"></span>
查看 
</button><br>

年度:&nbsp;<font style="font-family:cursive;">${year }</font>
<table  border="1" class="table table-striped text-warning table-bordered" style="table-layout: fixed;" id="ta">
<tr>
<td style="text-align: center;"><b>时间</b></td>
<td style="text-align: center;"><b>星期一</b></td>
<td style="text-align: center;"><b>星期二</b></td>
<td style="text-align: center;"><b>星期三</b></td>
<td style="text-align: center;"><b>星期四</b></td>
<td style="text-align: center;"><b>星期五</b></td>
</tr>
<tr>
<td>7:00~7:40</td>
<c:forEach items="${listrow1 }" var="listrow1">
<td style="text-align: center;"><a style="cursor: pointer;" title="${listrow1.classname }-${listrow1.bid}班"><font style="color: blue;">${listrow1.cname }</font></a>&nbsp;</td>
</c:forEach><!-- 遍历第一行 -->
</tr>
<tr>
<td>7:50~8:30</td>
<c:forEach items="${listrow2 }" var="listrow2">
<td style="text-align: center;"><a style="cursor: pointer;" title="${listrow2.classname }-${listrow2.bid}班"><font style="color: blue;"> ${listrow2.cname }</font></a>&nbsp;</td>
</c:forEach><!-- 遍历第二行 -->
</tr>


<tr>
<td>8:40~9:10</td>
<c:forEach items="${listrow3 }" var="listrow3">
<td style="text-align: center;"><a style="cursor: pointer;" title="${listrow3.classname }-${listrow3.bid}班"><font style="color: blue;"> ${listrow3.cname }</font></a>&nbsp;</td>
</c:forEach><!-- 遍历第二行 -->
</tr>
<tr>
<td colspan="6" style="text-align: center;"><h4>午-休-时-间</h4></td>
</tr>
<tr>
<td>13:00~13:40</td>
<c:forEach items="${listrow4 }" var="listrow4">
<td style="text-align: center;"><a style="cursor: pointer;" title="${listrow4.classname }-${listrow4.bid}班"><font style="color: blue;"> ${listrow4.cname }</font></a>&nbsp;</td>
</c:forEach><!-- 遍历第二行 -->
</tr>

<tr>
<td>13:50~14:30</td>
<c:forEach items="${listrow5 }" var="listrow5">
<td style="text-align: center;"><a style="cursor: pointer;" title="${listrow5.classname }-${listrow5.bid}班"><font style="color: blue;">${listrow5.cname }</font></a>&nbsp;</td>
</c:forEach><!-- 遍历第二行 -->
</tr>
<tr>
<td>14:40~15:20</td>
<c:forEach items="${listrow6 }" var="listrow6">
<td style="text-align: center;"><a style="cursor: pointer;" title="${listrow6.classname }-${listrow6.bid}班"><font style="color: blue;">${listrow6.cname }</font></a>&nbsp;</td>
</c:forEach><!-- 遍历第二行 -->
</tr>

</table>

</div>
	
</body>
<script type="text/javascript">
$('img').on('mousedown',function (e) {
	    e.preventDefault()
	})	
</script>
</html>