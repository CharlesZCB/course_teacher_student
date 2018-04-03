//单独删除

    function deletes(id){    
        confirm_ = confirm('您确定要删除改名学生?');
        if(confirm_){
            $.ajax({
                method:"POST",
                data:{"id":id},
                url:'stu_del',
                success:function(){//若一上执行成功  则走这步
                    $("#tr_"+id).remove();
                    location.reload();
                }
            });
        }
    };
    //批量删除
     function batchDeletes(){  
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
                   url:"many_del",  
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
$('#update').on('show.bs.modal', 
	function (event) {
 var a = $(event.relatedTarget); 
 var id = a.data('id');
 var name = a.data('name'); 
 var email = a.data('email');
 var password = a.data('password');
 var scode = a.data('scode');
 var modal = $(this);
 modal.find('#id1').val(id),
 modal.find('#name1').val(name),
 modal.find('#password1').val(password);
 modal.find('#email1').val(email);
 modal.find('#scode1').val(scode);
});
});

       //更新方法
       function sure(){
    	 //  alert("hello");
    	   $.ajax({
               url:'user_edit',
               data:{
            	   id:$("#id1").val(),
                   name:$("#name1").val(),
                   password:$("#password1").val(),
                   email:$("#email1").val(),
                  // birth:$("#birth1").val()
               },
               type:'post',
               dataType:'json',
               success:function(){
            	   alert("执行成功")
            	 location.reload();
               },  
           })   
       };
       
       
       


       