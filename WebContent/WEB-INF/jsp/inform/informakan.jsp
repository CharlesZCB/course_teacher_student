<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade kans" id="kans"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">通知详情</h4>
      </div>
      <div class="modal-body">
<form class="form-horizontal"   enctype="multipart/form-data" >     
       
         <div class="form-group">
    <label for="name" class="col-sm-2 control-label">标题</label>
    <div class="col-sm-10">
      <textarea name="title1" type="text" class="form-control" id="title1" readonly="readonly"
      style="overflow-x:hidden;width: 450px;resize:none;"></textarea>
    </div>
  </div>

 <div class="form-group">
    <label for="inputBirth3" class="col-sm-2 control-label"  >发布人</label>
    <div class="col-sm-10">
   <input name="writer1"
   style="width: 450px;"
   type="text" class="form-control" id="writer1" readonly="readonly">
    </div>
</div> 

  <div class="form-group">
    <label for="email" class="col-sm-2 control-label">内容</label>
    <div class="col-sm-10">
      <textarea  
      style="overflow-x:hidden;width: 450px;resize:none;height: 200px;"
      name="content1" class="form-control" id="content1" readonly="readonly">
      </textarea>
    </div>
  </div>
  <div class="form-group">
    <label for="password" class="col-sm-2 control-label" >发布时间</label>
    <div class="col-sm-10">
      <input name="infordate1"
      style="width: 450px;" 
      type="text" class="form-control" id="infordate1" readonly="readonly">
    </div>
  </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal">
   <span class="glyphicon glyphicon-off"></span>       
        关闭</button>
      </div>
</form>
      </div>
      
    </div>
  </div>
</div>　
