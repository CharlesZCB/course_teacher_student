<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
%>
<%
Object pas=session.getAttribute("pas");

int pag=Integer.valueOf(String.valueOf(pas));
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

}</style>
<script type="text/javascript">
function batchenews(){
    //判断至少写了一项  
    var checkedNum = $("input[name='check']:checked").length;  
    if(checkedNum==0){  
        alert("请至少选择一项!");
        return false;  
    }
    if(confirm("确定删除所选项目?")){  
    var checkedList = new Array();  
    $("input[name='check']:checked").each(function(){  
        checkedList.push($(this).val());  
    }); 
    
   // alert(checkedList);
    $.ajax({  
        type:"POST",  
        url:"${path}//news/many_del_news",  
        data:{"delitems":checkedList.toString()},  
        datatype:"html",  
        success:function(){  
            location.reload();//页面刷新  
        },  
        error:function(data){  
            art.dialog.tips('删除失败!');  
        }  
    });  
    }  
};
</script>
<script type="text/javascript">
function deletenews(id){
	<%-- href="news_del?id=${newsItem.id }" --%>
	 var ids=id;
	 con=confirm("确定删除该条新闻？");
	 if(con){
		 $.ajax({
			 url:"${path}/news/news_del",
				data:{
					"id":id
				}, 
				type:"post",
				dataType:"text",
				success:function(){
					alert("删除成功！");
					window.location.reload();
				}
			 
		 })
	 }
	 
	/* */
	
	
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
<h3>
<span class="glyphicon glyphicon-tag" style="margin-right: 20px;">
新闻管理</h3>
<div>
<form action="addnews" >
<button type="button" class="btn btn-danger"  style="margin-bottom: 5px;float: right;margin-left: 10px;"
onclick="batchenews()"
>
<span class="glyphicon glyphicon-trash"></span>
批量删除</button>
<button type="submit" class="btn btn-primary" style="margin-bottom: 5px;float: right;">
<span class="glyphicon glyphicon-plus-sign"></span>
添加新闻
</button>
</form>
<form>
<div class="row">
<div >
<table class="table table-striped text-warning table-bordered"
style="table-layout:fixed;" >

<!-- On cells (`td` or `th`) -->
<tr>
  <td style="text-align: center;width: 80px;">#</td>
  <td class="warning" style="text-align: center;">标题</td>
  <td class="warning" style="text-align: center;">状态值</td>
  <td class="warning" style="text-align: center;">内容</td>
  <td class="warning" style="text-align: center;">图片名</td>
  <td class="warning" style="text-align: center;">发布时间</td>
  <td class="warning" style="text-align: center;">发布者</td>
  <td class="warning" style="text-align: center;">操作</td>
</tr>

<c:forEach var="newsItem" items="${pageInfo.list}">

<tr>
  <td class="info" id="id" style="text-align: center;">  
  <input name="check" type="checkbox" value="${newsItem.id }">
  </td>
  <td class="info wrap"
  style="overflow:hidden;
  white-space:nowrap;
  text-overflow:ellipsis;"
  style="text-align: center;"
  >
  ${newsItem.title }
  </td>
  <td class="info" id="showoff" style="text-align: center;">${newsItem.showoff }</td>
  <td class="info wrap" 
  style="overflow:hidden;
  white-space:nowrap;
  text-overflow:ellipsis;"
  style="text-align: center;"
  >${newsItem.content }
  </td>
  <td 
  class="info"
  style="overflow:hidden;
  text-align: center;
  white-space:nowrap;
  text-overflow:ellipsis;"
  id="image"
  >${newsItem.image }</td>
  <td class="info" id="editdate" style="text-align: center;"><fmt:formatDate value="${newsItem.editdate }"/></td>
  <td class="info" id="editor"
  style="overflow:hidden;
  white-space:nowrap;
  text-overflow:ellipsis;
  text-align: center;"
  >${newsItem.editor }</td>
  <td class="info" style="text-align: center;">
 <a href="news_detail?id=${newsItem.id }&pag=<%=pag %>" style="color: blue;font-size: 8px;">
 <span class="glyphicon glyphicon-zoom-in"></span>
 详情
 </a>
 <a <%-- href="news_del?id=${newsItem.id }" --%> style="cursor:pointer; color: red;font-size: 8px;" onclick="deletenews

(${newsItem.id })" >
<span class="glyphicon glyphicon-trash"></span>
删除</a>

  </td>



</tr>

</c:forEach>

</table>
</div>
</div>
</form>
</div>
</div>

<div class="row" style="margin-left: 300px;">
<!-- 分頁文字信息 -->
<div class="col-md-4">
当前第：<font color="red" size="3">${pageInfo.pageNum }</font>页，总共：<font color="red" size="3">${pageInfo.pages }</font>页，总

共：<font color="red" size="3">${pageInfo.total}</font>条记录
</div>
<!-- 分頁條信息 -->
<div class="col-md-8">
<nav aria-label="Page navigation">
  <ul class="pagination">
   <li><a href="${path }/news/show?pn=1">首页</a></li>
   <c:if test="${pageInfo.hasPreviousPage }">
    <li>
      <a href="${path }/news/show?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
   </c:if>
 
  <c:forEach items="${pageInfo.navigatepageNums }" var="pagenum">
    <c:if test="${pagenum==pageInfo.pageNum }">
    <li  class="active"><a href="#">${pagenum }</a></li>
    </c:if>
     <c:if test="${pagenum!=pageInfo.pageNum }">
    <li><a href="${path }/news/show?pn=${pagenum }">${pagenum }</a></li>
    </c:if>
    </c:forEach>
    <c:if test="${pageInfo.hasNextPage }">
   <li>
      <a href="${path }/news/show?pn=${pageInfo.pageNum+1 }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  
  </c:if>
    
     <li><a href="${path }/news/show?pn=${pageInfo.pages }">尾页</a></li>
  </ul>
</nav>
</div>
</div>

</body>

<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>