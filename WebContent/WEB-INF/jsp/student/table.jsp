<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课表信息</title>
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
    	var yearxueqi=document.getElementById("year").value;
    	var id=document.getElementById("ownid").value;
    	if(yearxueqi==""){
    		alert("请先选择年度！");
    	}
    	else{
    		var year=encodeURI(yearxueqi);
        	$.ajax({
        		data:{
        			"year":year,
        			"id":id
        		},
        		dataType:"text",
        		type:"post",
        		url:"${path}/course/table1",
        		success:function(message){
        			if(message=="查找成功！"){
        				alert(message);
        				window.location.href="${path}/course/table?year="+encodeURI(year)+"&id="+id;
        			}
        			else{
        				alert("查找失败，暂无您要的数据");
        			}
        		}
        		
        		
        	})
    	}
    	
    	
    }
    
    
</script>
</head>

<body style="overflow-x: hidden">
<div class="row" style="background-color: #dcdc;">
<div class="col-md-2">
<jsp:include page="/WEB-INF/jsp/student/studentfile/student_left.jsp"></jsp:include>
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
个人课表</h3><button style="margin-bottom: 10px;float: right;" class="btn btn-primary" onclick="javascript:method1('ta')">
<span class="glyphicon glyphicon-save"></span>
导出课表</button>
<input type="hidden" value="${id}" id="ownid">
<select name="year" id="year">
<option value="">选择年度</option>
<c:forEach items="${listtime }" var="list">
<option value="${list.year }-${list.xueqi}">${list.year }-${list.xueqi}</option>
</c:forEach>
</select>
<button onclick="QueryTable()"style="margin-left: 20px;margin-bottom: 10px;" class="btn btn-default btn-sm">
<span class="glyphicon glyphicon-search"></span>
查询
</button><br>
年度:&nbsp;<font style="color: red;">${year }</font>
<table border="1" class="table table-striped text-warning table-bordered" style="table-layout: fixed;" id="ta">
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
<td style="text-align: center;"><a style="cursor: pointer;" title="${listrow1.tname }"><font style="color: blue;">${listrow1.cname }</font></a>&nbsp;</td>
</c:forEach><!-- 遍历第一行 -->
</tr>
<tr>
<td>7:50~8:30</td>
<c:forEach items="${listrow2 }" var="listrow2">
<td style="text-align: center;"><a style="cursor: pointer;" title="${listrow2.tname }"><font style="color: blue;" >${listrow2.cname }</font></a>&nbsp;</td>
</c:forEach><!-- 遍历第二行 -->
</tr>
<tr>
<td>8:40~9:10</td>
<c:forEach items="${listrow3 }" var="listrow3">
<td style="text-align: center;"><a style="cursor: pointer;" title="${listrow3.tname }"><font style="color: blue;">${listrow3.cname }</font></a>&nbsp;</td>
</c:forEach><!-- 遍历第二行 -->
</tr>
<tr>
<td colspan="6" style="text-align: center;"><h4>午-休-时-间</h4></td>
</tr>
<tr>
<td>13:00~13:40</td>
<c:forEach items="${listrow4 }" var="listrow4">
<td style="text-align: center;"><a style="cursor: pointer;" title="${listrow4.tname }"><font style="color: blue;">${listrow4.cname }</font></a>&nbsp;</td>
</c:forEach><!-- 遍历第二行 -->
</tr>

<tr>
<td>13:50~14:30</td>
<c:forEach items="${listrow5 }" var="listrow5">
<td style="text-align: center;"><a style="cursor: pointer;" title="${listrow5.tname }"><font style="color: blue;">${listrow5.cname }</font></a>&nbsp;</td>
</c:forEach><!-- 遍历第二行 -->
</tr>
<tr>
<td>14:40~15:20</td>
<c:forEach items="${listrow6 }" var="listrow6">
<td style="text-align: center;"><a style="cursor: pointer;" title="${listrow6.tname }"><font style="color: blue;">${listrow6.cname }</font></a>&nbsp;</td>
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