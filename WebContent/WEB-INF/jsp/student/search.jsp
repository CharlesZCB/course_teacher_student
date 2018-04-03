<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息</title>
<%
  pageContext.setAttribute("path",request.getContextPath());

%>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
 <script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
 <script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="${path }/static/bootstrap/js/stu.js"></script>
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
 function searchClass(){
	 var banhao=document.getElementById("ban").value;
	 if(banhao=="请选择班级"){
		 alert("请首先选择一个班级！");
		 return;
	 }
	 $.ajax({
		 data:{
			 "banhao":banhao,
		 },
	     url:"${path}/classroom/searchban",
	     dataType:"text",
	     type:"post",
	     success:function(message){
	    	 if(message=="no"){
	    		 alert("查找失败！暂无数据");
	    	 }
	    	 else{
	    		 alert("查找成功！");
	    		 window.location.href="${path}/classroom/searchban1?banhao="+banhao;
	    	 }
	     }
		 
		 
	 })
 };
 function deletes(id){    
     confirm_ = confirm('您确定要删除改名学生?');
     if(confirm_){
         $.ajax({
             method:"POST",
             data:{"id":id},
             url:'${path}/users/stu_del',
             success:function(){//若一上执行成功  则走这步
                 $("#tr_"+id).remove();
                 location.reload();
             }
         });
     }
 };
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


<div  >
<!-- 标题行 -->
<!-- 表格 -->
<div class="row" style="margin-left: 200px;margin-right: 50px;">
<h3>
<span class="glyphicon glyphicon-tag" style="margin-right: 20px;"></span>
学生管理</h3>
<div >
<form action="${path }/users/add">
<button type="submit" class="btn btn btn-warning btn-sm" style="float: right;margin: 10px;">
<span class="glyphicon glyphicon-plus-sign"></span>
新增数据
</button>
</form>

<form class="navbar-form navbar-left" role="search">
  <div class="form-group">
   <!--  <input type="text" class="form-control" placeholder="Search"> -->
   <select class="form-control" id="ban">
   <option>请选择班级</option>
   <c:forEach items="${listroom }" var="list">
   <option value="${list.banhao }">${list.jibie }级-${list.name }(${list.banhao })</option>
   </c:forEach>
   </select>
  </div>
  <button type="button" onclick="searchClass()" class="btn btn-default">搜索</button>
</form>

<table class="table table-striped text-warning table-bordered" id="group_item">
<tr>
<!-- <td>#</td> -->
<!-- <td style="text-align: center;">序号</td> -->
<td style="text-align: center;">头像信息</td>
<td style="text-align: center;">姓名</td>
<td style="text-align: center;">所在班级</td>
<td style="text-align: center;">编号</td>
<td style="text-align: center;">籍贯</td>
<td style="text-align: center;">邮箱</td>
<td style="text-align: center;">生日</td>
<td style="text-align: center;">操作</td>
<td style="text-align: center;">- -</td>
</tr>
<tr>
<c:forEach var="stu" items="${listuser}">
<tr >
<td style="text-align: center;"><img alt="头像" src="/images/${stu.filename }" width="40px" height="40px"class="img-circle" ></td>
<td style="text-align: center;">${stu.name }</td>
<td style="text-align: center;">${stu.nianji}级-${stu.banming}-${stu.banhao }</td>
<td style="text-align: center;">${stu.scode }</td>

<td style="text-align: center;"> ${stu.s_province}-${stu.s_city }-${stu.s_county }</td>
<td style="text-align: center;">${stu.email }</td>
<td style="text-align: center;"><fmt:formatDate value="${stu.birth }"/></td>
<td style="text-align: center;">
<a href="${path }/student/edit?id=${stu.id}&pn=1"><font style="color: blue;">
<span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
修改
</font>
</a>
<a onclick="deletes(${stu.id })" style="cursor:pointer">
<font color="red">
<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
刪除
</font>
</a>
</td>
<td  style="text-align: center;">
<span class="glyphicon glyphicon-align-justify"></span>
<a href="${path}/users/detailstus?uid=${stu.id}" style="color: brown;cursor: pointer;text-decoration: none;">详情</a></td>
</tr>
</c:forEach>
</tr>
</table>
</div>
</div>




</div>
<div style="width: 100%;height: 40px;background-color: white;"></div>

</body>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>