<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<h4 >添加教师信息</h4>     
<div class="col-md-10" style="margin-right: 100px;width: 600px;">
<form class="form-horizontal" enctype="multipart/form-data" action="${path }/teaches/teacher_add"  method="post">
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
      <input required="required" name="ident" type="text" class="form-control" id="ident" placeholder="请再此输入身份证">
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
      <input type="email" required="required" name="email" class="form-control" id="email" placeholder="邮箱地址必须有@">
    </div>
  </div>
  
    <div class="form-group">
    <label for="email" class="col-sm-2 control-label">籍贯</label>
    <div class="col-sm-10">
      
	<select id="s_province" name="s_province" class="control-label"></select>  

    <select id="s_city" name="s_city" class="control-label"></select>  

    <select id="s_county" name="s_county" class="control-label"></select>

   <script class="resources library" src="${path }/static/bootstrap/js/area.js" type="text/javascript"></script>
   
    <script type="text/javascript">_init_area();</script>
    </div>
  </div> 
  
        <div class="form-group">
    <label for="name" class="col-sm-2 control-label">职称</label>
    <div class="col-sm-10">
 <select id="test" class="form-control" name="workcall">
    <option value="0">-- 职称选项 --</option>
    <option value="教授">教授</option>
    <option value="讲师">讲师</option>
    <option value="副教授">副教授</option>
    <option value="助教">助教</option>
</select>
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


      <div class="modal-footer">
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