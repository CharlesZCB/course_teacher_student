<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<%
pageContext.setAttribute("path", request.getContextPath());
%>
<meta charset="UTF-8">
<title>教师登录页面</title>

<link rel="stylesheet" href="${path }/static/css/denglu.css">
<link rel="stylesheet" href="${path }/static/css/denglu2.css">
<style type="text/css">
body{
 background-image:url("${path}/static/image/denglu/1.jpg");
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
	var tcode=document.getElementById("tcode").value;
	var tpass=document.getElementById("tpass").value;
	$.ajax({
		data:{
			"tcode":tcode,
			"tpass":tpass
		},
		url:"${path }/teaches/login",
		type:"post",
		dataType:"text",
		success :function(message){
			
			if(message=="登陆成功！"){
				alert(message);
				window.location.href="${path}/teacher/teacherhome?tcode="+tcode;
			}
			else{
				alert(message);
			}
		}
		
	})
}

</script>
<style type="text/css">
#pass{
float: right;
color: blue;
}
#pass:hover{
color: red;
}
</style>
</head>

<body>
<div class="top">
<h1 style="color: white;text-shadow:#039 8px 5px 6px;margin-top: 0;margin-left: 10px;"><a style="color: white;text-decoration: none;" href="${path }/front/home">Dou都教务网站</a>
<img alt="" src="${path }/static/image/home/leaf.png" style="text-shadow:#039 5px 2px 6px">
</h1>
<div id="zhuihui" style="float: right;"></div>
</div>
<div class="login">
	<h1>教师登录</h1>
	<form >
		教师序列号：<input type="text" id="tcode" placeholder="序列号" required="required" />
		密码：   <input type="password" id="tpass" placeholder="密码" required="required" />
		<button type="button" class="btn btn-primary btn-block btn-large" onclick="login()">登录</button>
		<a href="javascript:void(0)" id="pass"  onclick='diag()'>找寻密码</a>
	</form>
</div>
</body>
<script type="text/javascript">
function diag(){
	var str=prompt("请输入您的教师号码");
	if(!str){
		return;
	}
	var str1=prompt("请输入身份证件号码");
	if(!str1){
		return ;
	}
	if(str!=""&&str1!=""){
		//验证身份证 ，学号对不对
		$.ajax({
			url:"${path}/teaches/getcodeident",
			data:{
				"ident":str1,
				"scode":str
			},
			dataType:"text",
			type:"post",
			success:function(msg){
				if(msg=="ok"){
					$.ajax({
						data:{
							"tcode":str,
						},
						url:"${path}/teaches/getpassfound",
						type:"post",
						dataType:"text",
						success:function(message){
							if(message=="ok"){
								alert("邮件发送成功！请登录您的QQ邮箱查收");
							}
							else{
								alert(message);
							}
						}
						
						
					})
				
	
}
				else{
					alert("该账号不存在！");
				}
			}
		})
	}		
}
</script>
<jsp:include page="/WEB-INF/jsp/preshow/bottom.jsp"></jsp:include>
</html>
