<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
   
%>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
 <script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
 <script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="${path }/static/bootstrap/js/tea.js"></script>
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
th{
text-align: center;
}
  </style>
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
个人中心</h3>
<table  style="width: 800px;border: 1px" 
class="table table-hover table-striped"
>

<tr>
<th></th>
<td>
<img alt="头像" style="width:80px;height: 80px;" src="/images/${headImg }" class="img-thumbnail">
</td>
</tr>
<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/username.png">&nbsp;
姓名</td>
<td>
${sname }
</td>
</tr>
<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/sexm.png">&nbsp;
性别:</td>
<td>
${sex }
</td>
</tr>

<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/classpic.png">&nbsp;
所在班级:</td>
<td>
${nianji }-${banming }(${banhao })
</td>
</tr>

<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/jiguan.png">&nbsp;
籍贯:</td>
<td>
${province }-${city }-${county }
</td>
</tr>

<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/birthday.png">&nbsp;
出生</td>
<td>
<fmt:formatDate value="${birth }"/>
</td>
</tr>


<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/email.png">&nbsp;
邮箱</td>
<td>
${email }
</td>
</tr>


<tr>
<td>
<img alt="" src="${path }/static/image/teacherperson/pass.png">&nbsp;
密码</td>
<td>
<form<%--  action="${path }/teaches/editpass" --%>>
<input name="newpass" value="${password }" style="text-align: center;" type="text" id="password"
onfocus="if (value =='${password}'){value =''}" onblur="if (value ==''){value='${password}'}">
&nbsp;&nbsp;&nbsp;&nbsp;
<button class="btn btn-primary btn-sm" onclick="setpass();">
<span class="glyphicon glyphicon-open"></span>
确认修改</button>
</form>
</td>
</tr>

</table>


</div>

<script type="text/javascript">
function setpass(){
	var newpass=document.getElementById("password").value;
	$.ajax({
		data:{
			"newpass":newpass
		},
		method:"post",
		url:"${path}/users/editpass",
		dataType:"json",
		success:function(){
			alert("密码修改成功！");
		}
	})
};
$('img').on('mousedown',function (e) {
	    e.preventDefault()
	})

</script>
</body>
</html>