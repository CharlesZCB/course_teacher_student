<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
  pageContext.setAttribute("path",request.getContextPath());
%>

<title></title>
<style type="text/css">
</style>
<link rel="stylesheet" href="${path}/static/bootstrap/css/c.css">
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
 <script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
 <script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="${path }/static/bootstrap/js/time.js"></script>

  <script type="text/javascript">
  
  var Gid  = document.getElementById ;

  var showArea = function(){

  	Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市" + 	

  	Gid('s_city').value + " - 县/区" + 

  	Gid('s_county').value + "</h3>"

  							};
  </script>
  
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
		url:"Findjibie",
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
	$.ajax({
		url:"Getbanhao",
		data:{
			"banming":banming,
			"jibie":jibie,
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
<div style="margin-left: 200px;margin-right: 50px;">
<h4 >添加学生信息</h4>     
<div class="col-md-10" style="margin-right: 100px;width: 600px;">
<form class="form-horizontal" enctype="multipart/form-data" action="${path }/users/add_users"  method="post">
   <div class="form-group">
    <label for="file" class="col-sm-2 control-label">头像</label>
    <div class="col-sm-10">
    <input name="file" type="file" class="form-control" id="file" required="required">
    </div>
  </div>
 
        
        <div class="form-group">
    <label for="name" class="col-sm-2 control-label">姓名</label>
    <div class="col-sm-10">
      <input required="required" name="name" type="text" class="form-control" id="tname" placeholder="请再此输入名字">
    </div>
  </div>
  
          <div class="form-group">
    <label for="name" class="col-sm-2 control-label">身份证</label>
    <div class="col-sm-10">
      <input required="required" name="ident" type="text" class="form-control" id="ident" placeholder="请再此输入号码">
    </div>
  </div>
    <div  class="form-group">
    <label for="file" class="col-sm-2 control-label" >性别</label>
    <div class="col-sm-10 checkbox">
      <input type="radio" name="sex" value="男" checked="checked"/>男
      <input type="radio" name="sex" value="女" checked="checked" style="margin-left: 20px;"/>女 
    </div>
    </div>
  
  
  
         <div class="form-group">
    <label for="name" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-10">
      <input required="required" name="password" type="password" class="form-control" id="password" placeholder="请再此输入密码">
    </div>
  </div>
  
        
         <div class="form-group">
    <label for="file" class="col-sm-2 control-label">电话</label>
    <div class="col-sm-10">
    <input maxlength="11" name="telephone" type="text" class="form-control" id="telphone" required="required"
    onkeyup="this.value=this.value.replace(/\D/g,'')"
    	placeholder="请输入11位电话号码"
    />
    </div>
  </div>
        

  <div class="form-group">
    <label for="email" class="col-sm-2 control-label">邮箱</label>
    <div class="col-sm-10">
      <input type="email" required="required" name="email" class="form-control" id="email" placeholder="请输入QQ邮箱">
    </div>
  </div>
  
    <div class="form-group">
    <label for="email" class="col-sm-2 control-label">籍贯</label>
    <div class="col-sm-10">
      
	<select id="s_province" name="s_province" class="control-label" required="required"></select>  

    <select id="s_city" name="s_city" class="control-label" required="required"></select>  

    <select id="s_county" name="s_county" class="control-label" required="required"></select>

   <script class="resources library" src="${path }/static/bootstrap/js/area.js" type="text/javascript"></script>
   
    <script type="text/javascript">_init_area();</script>
    </div>
  </div> 

  
 <div class="form-group">
    <label for="inputBirth3" class="col-sm-2 control-label"  >生日</label>
    <div class="col-sm-10">
   <input required="required" type="text" name="birth" class="form-control calendar" 
   id="birth" placeholder="格式:1999-12-31" format="yyyy-MM-dd" firstDayOfWeek="0" showTime="0"
    oncopy="return false;" oncut="return false;" onpaste="return false;">
    </div>
</div>


 <div class="form-group">
     <label for="email" class="col-sm-2 control-label">班级</label>
    <div class="col-sm-10">
        <select id="jibie" name="jibie" class="control-label"  onchange="cascade();">
		<option value="" selected="selected">--请选择级别--</option>
		<c:forEach items="${listjibie }" var="jibie">
		<option value="${jibie.jibie }">${jibie.jibie }</option>
		</c:forEach>
		</select> 

		<select id="zhuanye" name="zhuanye" class="control-label"onchange="selectbanhao();">
		<option value="">--请选择班级--</option>
		<optgroup label="" id="banmings">
		</optgroup>
		</select> 

		<select id="banhao" name="banhao" class="control-label">
		<option value="">--请选择班号--</option>
		<optgroup label="" id="banhaos">
		</optgroup>
		</select> 
</div>
</div>






      <div class="modal-footer" style="float: right;">
        <button type="button" class="btn btn-warning" onclick="goback()" >
        <span class="glyphicon glyphicon-share-alt"></span>  
        返回上页</button>
        <button type="submit" class="btn btn-primary">
        <span class="glyphicon glyphicon-ok"></span>
        确认添加</button>
      </div>
</form>
</div>
</div>



<script type="text/javascript" src="${path }/static/bootstrap/js/c.js">
</script>
<script type="text/javascript">
function goback(){
	window.history.back(-1);
};
$('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
</script>
</body>
</html>