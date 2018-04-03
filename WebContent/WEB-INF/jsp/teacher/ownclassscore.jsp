<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>班级信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
%>

<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
 <script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
 <script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/js/time.js"></script>
<script type="text/javascript" src="${path }/static/ExportExcel/jquery.table2excel.js"></script>
    <script type="text/javascript" src="${path }/static/teache/flag.js"></script>
  <style type="text/css">
  
  .b{
    border:1px 
    width:500px;
    height:40px;
    position:relative;
    left:50%;
    bottom:0%;
    margin-left:-170px;

}
th{
text-align: center;
}
  </style>
  
  <script type="text/javascript">
  function shaixuan(){
	var xueqi=document.getElementById("xueqi").value;
	var classident=document.getElementById("classident").value;
	$.ajax({
		url:"${path}/score/shaixuan",
		method:"post",
		dataType:"json",
		data:{
			"xueqi":xueqi,
			"classident":classident
		},
	})
}
  function query(){
	  var classident=document.getElementById("classident").value;
	  var xueqi=document.getElementById("xueqi").value;
	  var xueqi1=encodeURI(xueqi);
	  if(xueqi1==""){
		  alert("请先选择年度!");
	  }
	  else{
		  $.ajax({
			  data:{
				  "classident":classident,
				  "xueqi":xueqi1,
			  },
			  url:"${path}/score/shaixuan",
			  type:"post",
			  dataType:"text",
			  success:function(message){
				  if(message=="yes"){
					  alert("数据查找成功！");
					  //$("#btndiv").style.display="";
					  window.location.href="${path}/score/actionquery?xueqi="+encodeURI(encodeURI(xueqi))+"&classident="+classident;
					  //$("#flag").value="1";
				  }
				  else{
					  alert("对不起，暂时没有您要的数据...");
					//  $("#flag").value="0";
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
成绩查看</h3>
<div class="col-md-10">
<div style="margin-bottom: 10px;">
<form style="display: inline;">
<input type="hidden" value="${classident }" name="classident" id="classident">
<select name="xueqi" id="xueqi" required="required" >
<option value="" selected="selected">请选择学期</option>
<c:forEach items="${timelist }" var="listtime">
<option value="${listtime.year }-${listtime.xueqi }">${listtime.year }-${listtime.xueqi }</option>
</c:forEach>
</select>
<button type="button" class="btn btn-sm" onclick="query()">
<span class="glyphicon glyphicon-search"></span>
查看</button>
</form>

</div>
学期：${xueqichoice }
  <button style="margin-bottom: 10px;float: right;" class="btn btn-primary" onclick="javascript:method1('ta')">
<span class="glyphicon glyphicon-download-alt"></span>
导出为Excel</button>


<table class="table table-striped text-warning table-bordered" id="ta" >
<tr>
<c:forEach items="${titles }" var="titles">
<td style="text-align: center;">${titles }</td>
</c:forEach>
</tr>

 <c:forEach items="${detail}" var="obj"  varStatus="status">   
     <c:if test="${status.count eq 1 || (status.count-1) % numbertitle eq 0}">    
      <tr>    
     </c:if>
      
  
       <td  style="text-align: center;">
        ${obj}
       </td>  
  
        
      
      <c:if test="${status.count % numbertitle eq 0 || status.count eq numbertitle}">    
      <tr>    
      </c:if>    
  </c:forEach> 
  <%-- <tr>
  <td colspan="${numbertitle }">
    <font style="float: right;">
    <button style="margin-bottom: 10px;float: right;" class="btn btn-primary" onclick="javascript:method1('ta')">
<span class="glyphicon glyphicon-download-alt"></span>
导出为Excel</button>
    </font>
  </td>
  </tr> --%>
</table>
</div>
</div>


</body>
<script type="text/javascript">
$('img').on('mousedown',function (e) {
    e.preventDefault()
})

</script>
</html>