<%@page import="java.awt.Checkbox"%>
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
.textarea {
        width:50px;
        height:70px;
        background:url(${path}/static/image/hehua.jpg) no-repeat right top; 
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

.up-file {
    padding: 4px 10px;
    height: 40px;
    width: 240px;
    text-align: center;
    line-height: 40px;
    position: relative;
    cursor: pointer;
    background: #44bbff;
    color: #FFFFFF;
    border: 1px solid #ddd;
    border-radius: 4px;
    overflow: hidden;
    display: inline-block;
    *display: inline;
    *zoom: 1;
}
.up-file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer;
}
</style>       
<script type="text/javascript">
function previewImage(file)
{
  var MAXWIDTH  = 200; 
  var MAXHEIGHT = 100;
  var div = document.getElementById('preview');
  if (file.files && file.files[0])
  {
      div.innerHTML ='<img id=imghead onclick=$("#previewImg").click()>';
      var img = document.getElementById('imghead');
      img.onload = function(){
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        img.width  =  rect.width;
        img.height =  rect.height;
//         img.style.marginLeft = rect.left+'px';
        img.style.marginTop = rect.top+'px';
      }
      var reader = new FileReader();
      reader.onload = function(evt){img.src = evt.target.result;}
      reader.readAsDataURL(file.files[0]);
  }
  else //兼容IE
  {
    var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
    file.select();
    var src = document.selection.createRange().text;
    div.innerHTML = '<img id=imghead>';
    var img = document.getElementById('imghead');
    img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
    var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
    status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
    div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
  }
}
function clacImgZoomParam( maxWidth, maxHeight, width, height ){
    var param = {top:0, left:0, width:width, height:height};
    if( width>maxWidth || height>maxHeight ){
        rateWidth = width / maxWidth;
        rateHeight = height / maxHeight;
        
        if( rateWidth > rateHeight ){
            param.width =  maxWidth;
            param.height = Math.round(height / rateWidth);
        }else{
            param.width = Math.round(width / rateHeight);
            param.height = maxHeight;
        }
    }
    param.left = Math.round((maxWidth - param.width) / 2);
    param.top = Math.round((maxHeight - param.height) / 2);
    return param;
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
<h3>添加新闻</h3>
<form action="${path }/news/addnewsaction"  method="post" enctype="multipart/form-data">

<div class="row">
<div class="col-md-6">
<div class="form-group">
    <label for="exampleInputEmail1">题目</label>
    <input type="text" class="form-control" required="required"
     id="title" placeholder="标题" name="title"
     style="width:500px ">
  </div>
  
  <div class="form-group">
    <label for="exampleInputFile">正文</label><br>
    <textarea class="textarea" type="text" id="content" name="content"
    required="required"
    style="overflow-x:hidden;width: 500px;resize:none;height: 400px"
    >
    </textarea>
    
  </div>
  
</div>
<div class="col-md-6">
  
  <div class="form-group">
    <label for="exampleInputEmail1">编辑者</label>
    <input required="required" type="text" class="form-control"
     id="editor" placeholder="签名处" name="editor"
    style="width:500px; "
    >
  </div>

<label for="file" class="control-label">图片选择</label><br>
<div class="form-group" id="preview">
    <div style="width: 250px;height: 100px;margin-bottom: 30px;">
     <img id="newsimg" name="newsimg" border="0" src="${path}/static/image/zhaopian.png" onclick="$('#file').click();">
    </div>
    
  </div>
  <div>
    <a  class="up-file" style="cursor: pointer;text-decoration: none;">
    <input name="file" type="file"  id="file" required="required"
    style="width: 500px;"   onchange="previewImage(this)"
    >  
    选择图片
    </a><br>
    </div>
  <input type="checkbox" id="check" name="check" 
  style="margin-bottom: 10px;margin-top: 20px;" value="0">
  <font color="red">是否同时加入到前台滚动栏</font>

</div>

<div >
<button class="btn btn-primary" type="submit" style="margin-left: 15px;">
<span class="glyphicon glyphicon-open"></span>
确认上传
</button>

<button class="btn btn-warning" type="button" style="margin-left: 15px;" 
onclick="backpage()"
>
<span class="glyphicon glyphicon-share-alt"></span> 
返回上页</button>
</div>
</div>
</form>

</div>

</body>
<script type="text/javascript">
function backpage(){
	window.history.back(-1);
};

</script>
<script type="text/javascript">
  $('img').on('mousedown',function (e) {
	    e.preventDefault()
	})
  </script>
</html>