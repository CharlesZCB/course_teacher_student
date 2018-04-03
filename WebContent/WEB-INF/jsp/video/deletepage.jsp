<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 
<!DOCTYPE>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>视频信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
%>


<% 
   String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间 
%>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
<script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
<script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/js/time.js"></script>
<style type="text/css">
 .aaa{
            height: 32px;
            line-height: 22px;
            width:80px;
            padding: 0 10px;
            background: #87CEEB;
            border: 1px #26bbdb solid;
            border-radius: 3px;
            /*color: #fff;*/
            display: inline-block;
            text-decoration: none;
            color:white;
            font-size: 15px;
            outline: none;
            text-decoration：none;
            
        }
        
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
function deletevideo(id){
	confirm_=confirm("确认删除该视频？");
	if(confirm_){
		$.ajax({
			url:"${path}/video/delete",
			data:{
				"id":id,
			},
		   method:"post",
		   jdbcType:"json",
		   success:function(){
			   alert("删除成功!");
			   window.location.reload();
		   }
			
		})
	}
}


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


<div style="margin-left: 200px;margin-right: 50px;">
<div class="col-md-10" style="margin-top: 20px;">
<div style="margin-bottom: 10px;">
<img alt="" src="${path }/static/image/video/back.png">&nbsp;&nbsp;<a href="${path }/video/show"><font style="color: blue;">
<span class="glyphicon glyphicon-chevron-left"></span>
返回</font></a>
</div>
<table class="table table-striped text-warning table-bordered"
style="table-layout:fixed;"
>
<tr>
<td style="text-align: center;">片名</td>
<td style="text-align: center;">海报图片</td>
<td style="text-align: center;">上传者</td>
<td style="text-align: center;">上传时间</td>
<td style="text-align: center;">影片大小</td>
<td style="text-align: center;">操作</td>
</tr>
<c:forEach items="${pageInfo.list }" var="videolist">
<tr>
<td style="text-align: center;">${videolist.name }</td>
<td style="text-align: center;"><img style="width:90px;height: 50px;" class="img-fluid img-thumbnail" alt="" src="/images/${videolist.pic}"> </td>
<td style="text-align: center;">${videolist.personname }</td>
<td style="text-align: center;"><fmt:formatDate value="${videolist.dateTime }"/></td>
<td style="text-align: center;">${videolist.size }</td>
<td style="text-align: center;">
<button onclick="deletevideo(${videolist.id })" class="btn btn-danger btn-sm">
<span class="glyphicon glyphicon-trash"></span>
删除
</button></td>
</tr>
</c:forEach>

</table>
</div>

<div class="row" style="margin-left: 100px;">
<div class="row" >
<!-- 分頁文字信息 -->
<div class="col-md-4">
当前第：<font color="red" size="3">${pageInfo.pageNum }</font>页，总共：<font color="red" size="3">${pageInfo.pages }</font>页，总共：<font color="red" size="3">${pageInfo.total}</font>条记录
</div>
<!-- 分頁條信息 -->
<div class="col-md-8">
<nav aria-label="Page navigation">
  <ul class="pagination">
   <li><a href="${path }/video/deletepage?pn=1">首页</a></li>
   <c:if test="${pageInfo.hasPreviousPage }">
    <li>
      <a href="${path }/video/deletepage?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
   </c:if>
 
  <c:forEach items="${pageInfo.navigatepageNums }" var="pagenum">
    <c:if test="${pagenum==pageInfo.pageNum }">
    <li  class="active"><a href="#">${pagenum }</a></li>
    </c:if>
     <c:if test="${pagenum!=pageInfo.pageNum }">
    <li><a href="${path }/video/deletepage?pn=${pagenum }">${pagenum }</a></li>
    </c:if>
    </c:forEach>
    <c:if test="${pageInfo.hasNextPage }">
   <li>
      <a href="${path }/video/deletepage?pn=${pageInfo.pageNum+1 }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  
  </c:if>
    
     <li><a href="${path }/video/deletepage?pn=${pageInfo.pages }">尾页</a></li>
  </ul>
</nav>
</div>

</div>
</div>
</div>
</body>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>