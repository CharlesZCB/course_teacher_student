<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%> 
<%@ page import="java.text.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成绩信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
   String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间
    int snum= Integer.parseInt(String.valueOf(request.getAttribute("snum")));
    List userclass=(List)request.getAttribute("userclass");
    int cid=Integer.parseInt(request.getParameter("cid"));
    int status=Integer.parseInt(String.valueOf(request.getAttribute("status")));
    //System.out.print("JSP"+status);
%>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
<script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
<script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/static/bootstrap/js/time.js"></script>
  <script type="text/javascript" src="${path }/static/teache/flag.js"></script>
<style type="text/css">
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
<script type="text/javascript">
function sureaddscore(){
	var nian=document.getElementById("nian").value;
	var xueqi=document.getElementById("xueqi").value;
	var bid=document.getElementById("bid").value;
	var userclass=document.getElementById("userclass").value;
	var snum=document.getElementById("snum").value;
	var filename=document.getElementById("filename").value;
	var cid=document.getElementById("cid").value;
	$.ajax({
		data:{
			"nian":nian,
			"xueqi":xueqi,
			"bid":bid,
			"userclass":userclass,
			"snum":snum,
			"filename":filename,
			"cid":cid,
		},
		url:"${path }/score/batches",
		type:"post",
		dataType:"text",
		success:function(message){
			alert(message);
			if(message=="成绩批量插入成功！"){
				var con=confirm("查看录入情况？");
				if(con){
					window.location.href="${path}/score/getownScore?bid="+bid+"&cid="+cid;
				}
				else{
					window.location.href="${path}/scores/score";
				}
				
			}
			else if(message=="此班级该年度该门课程成绩已经录入过，您无法再次录入成绩！"){
				alert("即将返回本班级页面！");
				window.location.reload();
			}
		}
		
		
	})
};
</script>
</head>

<body style="overflow-x: hidden;">
<div class="row" style="background-color: #dcdc;">
<div class="col-md-2">
<jsp:include page="/WEB-INF/jsp/teacher/teacherfile/teacher_left.jsp"></jsp:include>
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
<a style="color: black;cursor: pointer;"><span class="glyphicon glyphicon-menu-left" onclick="backpage()"
style="margin-bottom: 10px;"
></span></a>
班级人数核对</h3>
<div class="col-md-10">
<h6><font>学期</font>：<%=request.getAttribute("nian") %>年-<%=request.getAttribute("xueqi") %><br><br>
<font >本次录分截止至:</font>
<%=request.getAttribute("time") %>&nbsp;
<c:if test="${status==0 }">
<font style="color: red;">(已经截止，仅能查看)</font>
</c:if>
</h6>
<table class="table table-striped text-warning table-bordered" >
<tr>
<td class="warning" style="text-align: center;">姓名</td>
<td class="warning" style="text-align: center;">性别</td>
<td class="warning" style="text-align: center;">个人序列号</td>
<td class="warning" style="text-align: center;">班级序列号</td>
</tr>
<c:forEach items="${users }" var="users">
<tr>
<td class="warning" style="text-align: center;">${users.name }</td>
<td class="warning" style="text-align: center;">${users.sex }</td>
<td class="warning" style="text-align: center;">${users.scode }</td>
<td class="warning" style="text-align: center;">${users.banhao }</td>
</tr>
</c:forEach>


</table>
<c:if test="${status==0 }">
<button  type="button" class="btn btn-primary" 
data-toggle="modal" data-target="#exampleModal" 
data-whatever="@mdo" style="float: right;display:none;">导入成绩单</button>
</c:if>
<c:if test="${status==1 }">
<button  type="button" class="btn btn-primary" 
data-toggle="modal" data-target="#exampleModal" 
data-whatever="@mdo" style="float: right;">
<span class="glyphicon glyphicon-inbox"></span>
导入成绩单</button>
</c:if>
<a type="button" href="${path}/score/getownScore?cid=${cid}&bid=${bid}" class="btn btn-default" style="float: right;margin-right: 10px;">
查看录入成绩</a>
</div>
<input type="hidden" value="${cid}" id="cid">
<input type="hidden" value="${snum}" id="snum">
<input type="hidden" value="${bid}" id="bid">


</div>
</div>
<input style="margin-left: 300px;" type="hidden" id="m" value="${po }">
<!-- 模态框 -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">导入框</h4>
      </div>
        <form action="${path }/score/batches?cid=${cid}&snum=${snum}&bid=${bid}" method="post">
      <div class="modal-body">
          <div class="form-group">
            <label for="recipient-name" class="control-label">选择Excel文件：</label>
            <input type="file" class="form-control" id="filename" name="filename" required="required">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onclick="sureaddscore()">确定</button>
      </div>
          <input type="hidden" value="<%=request.getAttribute("nian") %>" name="nian" id="nian">
          <input type="hidden" value="<%=request.getAttribute("xueqi") %>" name="xueqi" id="xueqi">
          <input type="hidden" value="<%=snum%>" name="snum" id="snum">
          <input type="hidden" value="<%=userclass %>" name="userclass" id="userclass">
          <input type="hidden" value="<%=cid %>" name="cid" id="cid">
          <input type="hidden" value="${bid }" name="bid" id="bid">
          
          <!-- List userclass - personclass._jspService(HttpServletRequest, HttpServletResponse) -->
   </form>
    </div>

  </div>
</div>

</body>
<script type="text/javascript">
function backpage(){
	window.history.back(-1);
};
$('img').on('mousedown',function (e) {
	    e.preventDefault()
	})	
</script>	

</html>