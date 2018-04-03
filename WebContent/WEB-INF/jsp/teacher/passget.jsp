<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<%
pageContext.setAttribute("path", request.getContextPath());
%>
<title>密码找回</title>

<link rel="stylesheet" href="${path }/static/css/denglu.css">
<link rel="stylesheet" href="${path }/static/css/denglu2.css">
<script type="text/javascript" src="${path }/static/bootstrap/js/jquery-1.8.2.min.js"></script>
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
</head>

<body>
<div class="top">
<h1 style="color: white;text-shadow:#039 5px 2px 6px;margin-top: 0;margin-left: 10px;"><a style="color: white;text-decoration: none;" href="${path }/front/home">Dou都教务网站</a>
<img alt="" src="${path }/static/image/home/leaf.png" style="text-shadow:#039 5px 2px 6px">
</h1>
</div>
<div class="login">
	<h1>密码重置</h1>
	<form>
		<input type="text" id="scode" placeholder="教师号" required="required" id="name" autocomplete="off"/>
		<input type="text" id="pass1" placeholder="新密码" required="required" id="name" autocomplete="off"/>
		<input type="password" id="pass2" placeholder="再次确认密码" required="required" autocomplete="off"/>
		<button type="button" class="btn btn-primary btn-block btn-large" onclick="subnew()">确认修改</button>
	</form>
	<input type="hidden" value="${scode }" id="codes">
</div>
</body>
<script type="text/javascript">
function subnew(){
	var scode=document.getElementById("scode").value;
	var pass1=document.getElementById("pass1").value;
	var pass2=document.getElementById("pass2").value;
	var codes=document.getElementById("codes").value;
	if(scode!=codes){
		alert("对不起，您输入的教师号出错，请重新输入！");
	}
	else{
		if(pass1==pass2){
		$.ajax({
				data:{
					"scode":scode,
					"pass":pass1
				},
				dataType:"text",
				type:"post",
				url:"${path}/teaches/editpass2",
				success:function(msg){
					if(msg=="ok"){
						alert("密码修改成功！");
						window.location.href="${path}/front/loginteacher"
					}
				}
				
			})
		}
		else{
			alert("对不起，密码前后不一致!请重新输入");
		}
	}
}
</script>
</html>
