<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成绩信息</title>
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
  </style>
  <script type="text/javascript">
  function query(){
	  var ident=document.getElementById("ident").value;
	  var xueqi=document.getElementById("xueqi").value;
	  if(xueqi==""){
		  alert("请先选择年度！");
	  }
	  else{
		  $.ajax({
				data:{
					"ident":ident,
					"xueqi":xueqi,
				},
			  type:"post",
			  dataType:"text",
			  url:"${path}/users/shaixuan",
			  success:function(message){
				  alert(message);
				  if(message=="数据查找成功！"){
					  window.location.href="${path}/users/ownscorelist?xueqi="+encodeURI(encodeURI(xueqi))+"&ident="+ident;
				  }
				  
			  }
				  
				  
			  })
			  
	  }
	
	  
	  
  }
  </script>
  
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
成绩查看</h3>
<form action="${path}/users/shaixuan" method="post">
<input type="hidden" value="${ident }" name="ident" id="ident">
<select name="xueqi" id="xueqi" name="xueqi" required="required">
<option value="" selected="selected">请选择学期</option>
<c:forEach items="${timelists }" var="listtime">
<option value="${listtime.year }-${listtime.xueqi }">${listtime.year }-${listtime.xueqi }</option>
</c:forEach>
</select>
<button style="margin-left: 10px;" type="button" class="btn btn-default btn-sm" onclick="query()">
<span class="glyphicon glyphicon-search"></span>
查询</button>
</form>
学期：${xueqichoice}<br>
<table  style="width: 800px;border: 1px;margin-top: 10px;" 
class="table table-hover table-striped" id="ta">
<tr>
<th style="text-align: center;" colspan="2">课程</th>
<th style="text-align: center;" colspan="2">成绩</th>
</tr>
<c:forEach items="${listscore }" var="listscore">
<tr>
<td style="text-align: center;" colspan="2">${listscore.cname }</td>
<c:if test="${listscore.score<60 }">
<td style="text-align: center;" colspan="2"><font style="color: red;">${listscore.score }</font></td>
</c:if>
<c:if test="${listscore.score>60||listscore.score==60 }">
<td style="text-align: center;" colspan="2">${listscore.score }</td>
</c:if>
</tr>
</c:forEach>



<tr>
<td style="text-align: center;">总分</td>
<td style="text-align: center;">平均分</td>
<td style="text-align: center;">不及格数</td>
<td style="text-align: center;">总学时</td>

</tr>
<tr>
<td style="text-align: center;">${totalscore }分</td>
<td style="text-align: center;">${avarage }分</td>
<td style="text-align: center;"><font style="color: red;"><b>${lownum }</b></font>门</td>
<td style="text-align: center;">${totaltime }学时</td>

</tr>
</table>
<button style="margin-bottom: 10px;margin-left: 700px;" class="btn btn-primary" onclick="javascript:method1('ta')">
<span class="glyphicon glyphicon-save"></span>
导出成绩表单</button>

</div>


</body>
<script type="text/javascript">
$('img').on('mousedown',function (e) {
    e.preventDefault()
})

</script>
</html>