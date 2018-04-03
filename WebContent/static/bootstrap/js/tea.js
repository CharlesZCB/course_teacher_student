//单独删除

    function deleteteacher(id){    //deleteteacher
        confirm_ = confirm('您确定要删除该教师?');
        if(confirm_){
            $.ajax({
                method:"POST",
                data:{"id":id},
                url:'tea_del',
                success:function(){//若一上执行成功  则走这步
                    $("#tr_"+id).remove();
                    location.reload();
                }
            });
        }
    };
    //批量删除
     function batcheTeacher(){  
               //判断至少写了一项  
               var checkedNum = $("input[name='subcheck']:checked").length;  
               if(checkedNum==0){  
                   alert("请至少选择一项!");
                   return false;  
               }  
               if(confirm("确定删除所选项目?")){  
               var checkedList = new Array();  
               $("input[name='subcheck']:checked").each(function(){  
                   checkedList.push($(this).val());  
               });  
               $.ajax({  
                   type:"POST",  
                   url:"many_del_tea",  
                   data:{"delitems":checkedList.toString()},  
                   datatype:"html",  
                   success:function(data){  
                       $("[name='checkbox2']:checkbox").attr("checked",false);  
                     location.reload();//页面刷新  
                   },  
                   error:function(data){  
                       art.dialog.tips('删除失败!');  
                   }  
               });  
               }  
       };

       //修改 将表中的数据填到modal中
$(function(){
$('#updateTeacher').on('show.bs.modal', 
	function (event) {
 var a = $(event.relatedTarget); 
 var id = a.data('id');
 var tcode = a.data('tcode');
 var tname = a.data('tname'); 
 var email = a.data('email');
 var telphone = a.data('telphone');
 var workcall = a.data('workcall');
 var birth = a.data('birth');
 var modal = $(this);
 modal.find('#id1').val(id),
 modal.find('#tcode1').val(tcode),
 modal.find('#tname1').val(tname),
 modal.find('#telphone1').val(telphone),
 modal.find('#workcall1').val(workcall);
 modal.find('#email1').val(email);
 modal.find('#birth1').val(birth);
});
});

       //更新方法
       function teasure(){
    	   $.ajax({
               url:'tea_edit',
               data:{
            	   id:$("#id1").val(),
                   tname:$("#tname1").val(),
                   workcall:$("#workcall1").val(),
                   email:$("#email1").val(),
                   birth:$("#birth1").val(),
                   telphone:$("#telphone1").val()
               },
               type:'post',
               dataType:'json',
               success:function(){
            	  location.reload();
               },  
           })   
       };