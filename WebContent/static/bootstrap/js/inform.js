       //修改 将表中的数据填到modal中

$(function(){
$('#kans').on('show.bs.modal', 
	function (event) {
	
 var a = $(event.relatedTarget); 
 var id = a.data('id');
 var title = a.data('title'); 
 var content = a.data('content');
 var infordate = a.data('infordate');
 var writer = a.data('writer');
 var modal = $(this);

 modal.find('#id1').val(id);
 modal.find('#title1').val(title);
 modal.find('#content1').val(content);
 modal.find('#infordate1').val(infordate);
 modal.find('#writer1').val(writer);
});
});



function deletea(id){
	confirm_ = confirm('您确定要删除该条记录?');
    if(confirm_){
        $.ajax({
            method:"POST",
            data:{"id":id},
            url:'inform_del',
            success:function(){//若一上执行成功  则走这步
                $("#tr_"+id).remove();
                location.reload();
            }
        });
    }
};

function batcheInfor(){  
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
        url:"many_del_inf",  
        data:{"delitems":checkedList.toString()},  
        datatype:"html",  
        success:function(){  
        	alert("删除成功！");
            location.reload();//页面刷新  
        },  
        error:function(data){  
            alert('删除失败!');  
        }  
    });  
    }  
};

