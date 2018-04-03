<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师信息</title>
<%
   pageContext.setAttribute("path",request.getContextPath());
%>
<link rel="stylesheet" href="${path}/static/bootstrap/css/bootstrap.min.css">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 --> 
 <script type="text/javascript" src="${path }/static/bootstrap/js/jquery-2.0.0.min.js"></script> 
 <script type="text/javascript" src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="${path }/static/bootstrap/js/tea.js"></script>
  <script type="text/javascript" src="${path }/static/bootstrap/js/time.js"></script>
    <script type="text/javascript" src="${path }/static/teache/flag.js"></script>
    <script type="text/javascript" src="${path }/static/tablechart/echarts.min.js"></script>
  <style type="text/css">
  
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
th{
text-align: center;
}
td{
text-align: center;
}

.centerbox{
 position: absolute;   
            top:300px;
            left: 50%;   
            -webkit-transform: translate(-50%, -50%);   
            -moz-transform: translate(-50%, -50%);   
            -ms-transform: translate(-50%, -50%);   
            -o-transform: translate(-50%, -50%);   
            transform: translate(-50%, -50%);   
}
  </style>
  
  
</head>

<body style="overflow-x: hidden">
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
<a style="color: blue;" href="javascript:void(0)" onclick="backpage()"><span class="glyphicon glyphicon-step-backward"></span></a>
各班级该科均分</h3>
<c:if test="${flag==0 }">
<div style="width: 600px;text-align: center;" class="centerbox">
<h2>请先录入成绩再查看各班级均分情况！</h2>
<img alt="" src="${path }/static/image/teacherperson/timg.jpg">
</div>
</c:if>
<c:if test="${flag!=0 }">
<div style="width: 600px;">
<a class="btn btn-default btn-sm" type="button" style="float: right;" id="pic1">
<span class="glyphicon glyphicon-save"></span>&nbsp;
下载图片</a>
</div>
</c:if>

<div class="col-md-10">
<c:if test="${flag==0 }">
<div id="main" style="width: 600px;height:400px;display: none;" id="pic1">
</div>
</c:if>
<c:if test="${flag!=0 }">
<div id="main" style="width: 600px;height:400px;" id="pic1">
</div>
</c:if>
</div>
</div>
    <input type="hidden" id="banji" value="${data}">
    <input type="hidden" id="score" value="${scores }">
    <input type="hidden" id="cxueqis" value="${course.xueqi }">
    <input type="hidden" id="cyears" value="${course.year }">
    <input type="hidden" id="cnames" value="${course.cname }">
    <input type="hidden" id="ccodes" value="${course.ccode }">
 <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        var banji=$("#banji").val();
        var score=$("#score").val();
        var year=$("#cyears").val();
        var xueqi=$("#cxueqis").val();
        var cname=$("#cnames").val();
        var code= $("#ccodes").val();
        
        // 指定图表的配置项和数据
        var option = {
            title: {
            	text: year+'-'+xueqi+' '+cname+'('+code+')'
            },
            tooltip: {},
            legend: {
                data:['均分'],
                left:'70%',
            },
            xAxis: {
                data: banji.split(',') 
                /* ["w","w","w","w","w","w"] */
            },
            yAxis: {
            	name:"分数/百分制",
            	
            },
            series: [{
                name: '均分',
                type: 'bar',
                data:score.split(","),
                itemStyle:{
                    normal:{
                    	label:{
                    		show:true,
                        	position:'top',
                    	},
                        color:'#00AFE4'
                    }
                },
                
            }]
        };
        
        option.xAxis.axisLabel={
                interval: 0,//标签设置为全部显示
                formatter:function(params){
                	 var newParamsName = "";// 最终拼接成的字符串
                	    var paramsNameNumber = params.length;// 实际标签的个数
                	    var provideNumber = 4;// 每行能显示的字的个数
                	    var rowNumber = Math.ceil(paramsNameNumber / provideNumber);// 换行的话，需要显示几行，向上取整
                	    /**
                	     * 判断标签的个数是否大于规定的个数， 如果大于，则进行换行处理 如果不大于，即等于或小于，就返回原标签
                	     */
                	    // 条件等同于rowNumber>1
                	    if (paramsNameNumber > provideNumber) {
                	        /** 循环每一行,p表示行 */
                	        for (var p = 0; p < rowNumber; p++) {
                	            var tempStr = "";// 表示每一次截取的字符串
                	            var start = p * provideNumber;// 开始截取的位置
                	            var end = start + provideNumber;// 结束截取的位置
                	            // 此处特殊处理最后一行的索引值
                	            if (p == rowNumber - 1) {
                	                // 最后一次不换行
                	                tempStr = params.substring(start, paramsNameNumber);
                	            } else {
                	                // 每一次拼接字符串并换行
                	                tempStr = params.substring(start, end) + "\n";
                	            }
                	            newParamsName += tempStr;// 最终拼成的字符串
                	        }

                	    } else {
                	        // 将旧标签的值赋给新标签
                	        newParamsName = params;
                	    }
                	    //将最终的字符串返回
                	    return newParamsName
                }
            }
       

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
       
    </script>
    
    <script type="text/javascript">
    function backpage(){
    	window.history.back(-1);
    }
    </script>
<script type="text/javascript">
$('img').on('mousedown',function (e) {
    e.preventDefault()
})
</script>
    
</body>
</html>