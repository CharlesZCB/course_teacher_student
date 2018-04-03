<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
%>
<% 
   String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间 
%>
<link rel="stylesheet" href="${path}/static/bootstrap/css/c.css">
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

 <script type="text/javascript">
/**
 * 触动级别按钮添加此方法获取二级值
 --班级名称
 */	
 function cascade(){
	$("#banmings").empty();
	$("#banhaos").empty();
	var jibie=document.getElementById("jibie").value;
	$.ajax({
		url:"${path}/users/Findjibie",
		data:{
			"jibie":jibie,
		},
	method:"post",
	dataType:"json",
	success:function(st1){
		for(var i=0;i<st1.length;i++){
			$("#banmings").append(st1[i]);
		}
	}
		
	})
	
}
function selectbanhao(){
	$("#banhaos").empty();
	var banming1=document.getElementById("zhuanye").value;
	var jibie  =document.getElementById("jibie").value;
    var banming=encodeURI(banming1);
	/* alert(banming);
	alert(jibie); */
	$.ajax({
		url:"${path}/users/Getbanhao",
		data:{
			"banming":banming,
			"jibie":jibie
		},
		method:"post",
		dataType:"json",
		success:function(list2){//list2就是班号集
			for(var i=0;i<list2.length;i++){
				$("#banhaos").append(list2[i]);
			}
		}
	})
	
	
}
</script>
  

</head>

<body style="overflow-x: hidden">
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


<!--修改 ---------------------------------------------------------------------------- -->
<div style="margin-left: 200px;margin-right: 50px;">
<h4>修改学生信息</h4>
<div class="col-md-10" style="margin-right: 100px;width: 600px;">
<form class="form-horizontal"  action="${path }/users/user_edit?pn=${pn}" method="post">   

<div class="form-group">
    <label for="tname1" class="col-sm-2 control-label">次序</label>
    <div class="col-sm-10">
      <input name="id" type="text" class="form-control" id="id1" readonly="readonly"
      value="${id }"
      >
    </div>
</div>



<div class="form-group">
    <label for="name" class="col-sm-2 control-label">序列号</label>
    <div class="col-sm-10">
      <input name="tcode1" type="text" class="form-control" id="tcode1" readonly="readonly"
      value="${scode }"
      >
    </div>
</div>

 <div class="form-group">
    <label for="inputBirth3" class="col-sm-2 control-label"  >生日</label>
    <div class="col-sm-10">
   <input type="text" name="birth" class="form-control"
   format="yyyy年MM月dd日" id="birth1" placeholder="例如：2011-11-11" readonly="readonly"
   value='<fmt:formatDate value="${birth }"/>' 
   >
    </div>
</div>

<div class="form-group">
    <label for="name" class="col-sm-2 control-label">原班级</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" value="${nianji}-${banming}-${banhao}" readonly="readonly">
    </div>
</div>
<div class="form-group">
    <label for="name" class="col-sm-2 control-label">姓名</label>
    <div class="col-sm-10">
      <input name="name" type="text" class="form-control" id="tname1" required="required"
      value="${name }"
      >
    </div>
</div>





 <div class="form-group">
     <label for="email" class="col-sm-2 control-label">班级</label>
    <div class="col-sm-10">
        <select id="jibie" name="jibie" class="control-label"  onchange="cascade();" required="required">
		<option value="" selected="selected">--请选择级别--</option>
		<c:forEach items="${listjibie }" var="jibie">
		<option value="${jibie.jibie }">${jibie.jibie }</option>
		</c:forEach>
		</select> 

		<select id="zhuanye" name="zhuanye" class="control-label"onchange="selectbanhao();" required="required">
		<option value="">--请选择班级--</option>
		<optgroup label="" id="banmings">
		</optgroup>
		</select> 

		<select id="banhao" name="banhao" class="control-label" required="required">
		<option value="">--请选择班号--</option>
		<optgroup label="" id="banhaos">
		</optgroup>
		</select> 
</div>
</div>




<div class="form-group">
    <label for="email" class="col-sm-2 control-label">邮箱</label>
    <div class="col-sm-10">
      <input type="email" name="email" class="form-control" id="email1" required="required"
      value="${email }"
      >
    </div>
</div>
  
  
  
    
  
  
 
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" onclick="goback()">
   <span class="glyphicon glyphicon-share-alt"></span>      
        返回上页</button>
        <button type="submit" class="btn btn-primary">
        <span class="glyphicon glyphicon-ok"></span>
        确认修改</button>
      </div>
</form>
</div>
</div>    
      

<script type="text/javascript" src="${path }/static/bootstrap/js/c.js"></script>
<script type="text/javascript">
function goback(){
	window.history.back(-1);
}
</script>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</body>
</html>
　
