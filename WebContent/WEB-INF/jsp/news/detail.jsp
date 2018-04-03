<%@page import="net.sf.jsqlparser.expression.StringValue"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教务信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
   request.setCharacterEncoding("UTF-8");
   Object pa=session.getAttribute("pa");
   int pags=Integer.parseInt(String.valueOf(pa));
%>
<% 
   String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间 
%>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
<script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
<script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/js/time.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/js/news.js"></script>

<style type="text/css">
pre{
white-space: pre-wrap; /*css-3*/ 
white-space: -moz-pre-wrap; /*Mozilla,since1999*/ 
white-space: -pre-wrap; /*Opera4-6*/ 
white-space: -o-pre-wrap; /*Opera7*/ 
word-wrap: break-word; /*InternetExplorer5.5+*/
background-color: inherit;
border: 0px;
        }
.b{
    border:1px 
    width:500px;
    height:40px;
    position:relative;
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


<%
String opt=null;
Object num=request.getAttribute("showoff");
int g=new Integer(num.toString());
if(g==0){
	opt="未加入";
}
else {
	opt="已加入";
}


DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
String time=df.format(request.getAttribute("editdate"));
 String person=String.valueOf(request.getAttribute("editor"));
String ids=request.getParameter("id");
int i=Integer.parseInt(ids);

/* String pa=request.getParameter("pns");
int pag=Integer.parseInt(pa); */

%>


<!-- 标题 -->


<div style="margin-left: 200px;margin-right: 100px;">
<h3>新闻详情</h3>
<div style="font-size: 12;color: red;margin-bottom: 10px;">
<a title="点击取消" href="editstatue?id=<%=i%>&pnga=<%=pags %>" style="color: black;">
<span class="glyphicon glyphicon-refresh"></span>
</a>&nbsp;是否加入前台滚动：
<font style="color: blue;"><%=opt %></font>
</div>
 <h4>
 <a href="backpage?pn=<%=pags %>" style="color: black;" title="返回">
 <span class="glyphicon glyphicon-step-backward"></span>
 </a>
 &nbsp;&nbsp;&nbsp;<%=request.getAttribute("title")%>
 </h4>
<!-- 图片 -->
<div style="text-align: center;">
<%-- <a href="/image/<%=request.getAttribute("image") %>"></a> --%>
<img alt="图片" src="/images/<%=request.getAttribute("image")%>" style="
width: 500px; height: 180px;border-top-style:double;" class="img-fluid img-thumbnail" >
</div>
<!-- 正文 -->
<div>
<pre style="margin-top: 20px;margin-right: 50px;"><p> <%=request.getAttribute("content") %></p>
<h5 style="float: right;margin-right: 100px;"><img alt="" src="${path }/static/image/sa.png">&nbsp发布时间:<%=time %>
<h5 style="float: right;margin-right: 100px;"><img alt="" src="${path }/static/image/edit.png">&nbsp发布者:<%=person %></h5>

<!-- 作者 -->

</pre>
<!-- 时间 -->
</div>
</div>



</body>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>