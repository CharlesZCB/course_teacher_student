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
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
<link rel="stylesheet" href="${path}/static/bootstrap/css/c.css">
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
<div>

<!--修改 ---------------------------------------------------------------------------- -->
<div style="margin-left: 200px;margin-right: 50px;">
<h4>修改教师信息</h4>
<div class="col-md-10" style="margin-right: 100px;width: 600px;">
<form class="form-horizontal"  action="${path }/teaches/tea_edit" method="post">   

<div class="form-group">
    <label for="tname1" class="col-sm-2 control-label">次序</label>
    <div class="col-sm-10">
      <input name="id" type="text" class="form-control" id="id1" readonly="readonly"
      value="${id }"
      >
    </div>
</div>



<div class="form-group">
    <label for="name" class="col-sm-2 control-label">编号</label>
    <div class="col-sm-10">
      <input name="tcode1" type="text" class="form-control" id="tcode1" readonly="readonly"
      value="${code }"
      >
    </div>
</div>

         <div class="form-group">
    <label for="file" class="col-sm-2 control-label">原职称</label>
    <div class="col-sm-10">
    <input maxlength="11" type="text" class="form-control" value="${workcall }" readonly="readonly"/>
    </div>
  </div>
  
   <div class="form-group">
    <label for="inputBirth3" class="col-sm-2 control-label"  >生日</label>
    <div class="col-sm-10">
   <input readonly="readonly" type="text" name="birth" class="form-control "
   format="yyyy-MM-dd" id="birth1" placeholder="例如：2011-11-11"
   value='<fmt:formatDate value="${birth }"/>' 
   >
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
    <label for="email" class="col-sm-2 control-label">邮箱</label>
    <div class="col-sm-10">
      <input type="email" name="email" class="form-control" id="email1" required="required"
      value="${email }"
      >
    </div>
</div>
  
  
         <div class="form-group">
    <label for="file" class="col-sm-2 control-label">电话</label>
    <div class="col-sm-10">
    <input maxlength="11" name="telephone" type="text" class="form-control" id="telphone1" required="required"
    onkeyup="this.value=this.value.replace(/\D/g,'')"
    	placeholder="请输入11位电话号码"
    	value="${telephone }"
    />
    </div>
  </div>
  
  

  
          <div class="form-group">
    <label for="name" class="col-sm-2 control-label">新职称</label>
    <div class="col-sm-10">
      <select id="workcall1" class="form-control" name="workcall"
      required="required"
      >
    <option value="">-- 职称选项 --</option>
    <option value="教授">教授</option>
    <option value="讲师">讲师</option>
    <option value="副教授">副教授</option>
    <option value="助教">助教</option>
</select>
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
</div>


<script type="text/javascript">
function goback(){
	window.history.back(-1);
}
</script>
<script type="text/javascript" src="${path }/static/bootstrap/js/c.js">
</script>
</body>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>