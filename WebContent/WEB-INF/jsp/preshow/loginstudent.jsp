<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<%
pageContext.setAttribute("path", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>学生登录页面</title>

<link rel="stylesheet" href="${path }/static/css/denglu.css">
<link rel="stylesheet" href="${path }/static/css/denglu2.css">

<style type="text/css">
body{
 background-image:url("${path}/static/image/denglu/2.jpg");
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
	var code=document.getElementById("code").value;
	var password=document.getElementById("password").value;
	$.ajax({
		data:{
			"code":code,
			"password":password
		},
		type:"POST",  
	    dataType:"text",
	    url:"${path}/users/UGetScore",
		success:function(data){
			
			if(data=="登陆成功！"){
				alert(data);
				window.location.href="${path}/student/stuscorehome";	
			}
			else{
				alert(data);
			}
		}
		
	})
	
};
</script>
<style type="text/css">
#pass{
float: right;
color: white;
}
#pass:hover{
color: red;
}
</style>
</head>

<body>
<div class="top">
<h1 style="color: white;text-shadow:#039 8px 5px 6px;margin-top: 0;margin-left: 10px;"><a style="color: white;text-decoration: none;" href="${path }/front/home">Dou都教务网站</a>
<img alt="" src="${path }/static/image/home/leaf.png" >
</h1>
<div id="zhuihui" style="float: right;"></div>
</div>
<div class="login">
	<h1>学生登录</h1>
	<form>
		<input type="text" id="code" placeholder="用户名" required="required" />
		<input type="password" id="password" placeholder="密码" required="required" />
		<button type="button" class="btn btn-primary btn-block btn-large" onclick="login()">登录</button>
		 <a href="javascript:void(0)" id="pass"  onclick='diag()'>找寻密码</a>
	</form>

</div>
</body>
<script type="text/javascript">
function openModal(){
	if(confirm("需要更改密码？")){
		
	}
	else{
		alert("放弃追回");
	}
};
function diag(){
	var str=prompt("请输入您的学号");
	if(!str){
		return;
	}
	var str1=prompt("请输入身份证件号码");
	if(!str1){
		return;
	}
	if(str!=""&&str1!=""){
		//验证身份证 ，学号对不对
		$.ajax({
			url:"${path}/users/getscodeident",
			data:{
				"ident":str1,
				"scode":str
				
			},
			dataType:"text",
			type:"post",
			success:function(msg){
				if(msg=="ok"){
					//alert("邮件发送成功");
					$.ajax({
						data:{
							"xuehao":str,
						},
						url:"${path}/users/getpassfound",
						type:"post",
						dataType:"text",
						success:function(message){
							if(message=="ok"){
								alert("邮件发送成功,请登录您的QQ邮箱查收信息！");
							}
							else{
								alert("该账号在很短的时间内已经接受大量本系统的消息提示！请过段时间再尝试");
							}
						}
						
						
					})
				}
				else{
					alert("不存在该账号！");
				}
				
				
			}
			
			
		});

	}
	else{
		alert("账号不能为空！");
	}
}

</script>
<jsp:include page="/WEB-INF/jsp/preshow/bottom.jsp"></jsp:include>
</html>
