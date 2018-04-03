//单独删除


    function deletenews(id){    //deleteteacher
        confirm_ = confirm('您确定要删除该记录?');
        if(confirm_){
            $.ajax({
                method:"POST",
                data:{"id":id},
                url:'news_del',
                success:function(){//若一上执行成功  则走这步
                    $("#tr_"+id).remove();
                    location.reload();
                }
            });
        }
    };
    