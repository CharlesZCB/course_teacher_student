<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <html> 
  <head> 
    <%
    pageContext.setAttribute("path", request.getContextPath());
    %>
<script type="text/javascript">
function batch(){
	var fileinfor=document.getElementById("fileinfor").value;
	$.ajax({
		url:"${path }/infor/batches",
		data:{
			"fileinfor":fileinfor,
		},
		type:"post",
		dataType:"text",
		success:function(message){
			alert(message);
			if(message!="文件格式出错！指定文件xls或者xlsx"){
				var fileaddress="C:/Users/Administrator/Desktop/"+fileinfor;
				window.location.href="${path}/infor/actioninsert?file="+fileaddress;
			}
		}
		
		
	})
}
</script>
   
</head>   
<div class="modal fade" id="batches" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">批量导入</h4>
      </div>
      <div class="modal-body">
<form class="form-horizontal"   enctype="multipart/form-data" action="${path }/infor/batches" >   
  <div class="form-group">
    <label for="email" class="col-sm-2 control-label">Excel文件</label>
    <div class="col-sm-10">
      <input class="form-control" type="file" name="fileinfor" id="fileinfor">
    </div>
  </div>
  

      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal">
   <span class="glyphicon glyphicon-off"></span>     
        关闭</button>
        <button type="button" class="btn btn-primary" onclick="batch()">
   <span class="glyphicon glyphicon-ok"></span>     
        确定</button>
      </div>
</form>
      </div>
      
    </div>
  </div>
</div>　

</html>
