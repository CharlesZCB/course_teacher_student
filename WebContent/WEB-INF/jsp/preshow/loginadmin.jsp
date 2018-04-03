<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<%
pageContext.setAttribute("path", request.getContextPath());
%>
<title>管理员登录页面</title>

<link rel="stylesheet" href="${path }/static/css/denglu.css">
<link rel="stylesheet" href="${path }/static/css/denglu2.css">
<style type="text/css">
body{
 background-image:url("${path}/static/image/denglu/3.jpg");
 background-size:cover;
}
.top{
 width: 100%;
 height: 60px;
 position: fixed;
 top: 0;
 background-color: #00AFE4;
}
</style>

<script type="text/javascript">
function login(){
	var admin=document.getElementById("admin").value;
	var pass=document.getElementById("pass").value;
	$.ajax({
		data:{
			"admin":admin,
			"pass":pass
		},
		dataType:"text",
		url:"${path}/login/admin",
		type:"post",
		success:function(message){
			if(message=="登陆成功！"){
				alert(message);
				window.location.href="${path}/teaches/allteacher";
			}
			else{
				alert(message);
			}
			
			
		}
		
		
	})
}

</script>
</head>

<body>
<div class="top">
<h1 style="color: white;text-shadow:#039 8px 5px 6px;margin-top: 0;margin-left: 10px;"><a style="color: white;text-decoration: none;" href="${path }/front/home">Dou都教务网站</a>
<img alt="" src="${path }/static/image/home/leaf.png" style="text-shadow:#039 5px 2px 6px">
</h1>
</div>
<div class="login">
	<h1>管理员登录</h1>
	<form>
		<input type="text" id="admin" placeholder="用户名" required="required" id="name" autocomplete="off"/>
		<input type="password" id="pass" placeholder="密码" required="required" autocomplete="off"/>
		<button type="button" class="btn btn-primary btn-block btn-large" onclick="login()">登录</button>
	</form>
</div>
</body>

<jsp:include page="/WEB-INF/jsp/preshow/bottom.jsp"></jsp:include>
</html>
