  $(document).ready(function(){
	 // alert("kk");
	 var tt=$("#m").val();
	 if(tt=="yes"){
		 var color=new Array("#CDCD00","#49A2DA");
		 var divmessage=document.getElementById("#message");
		 var i = -1;
		 setInterval(function () {
		    i++;
		    i%=color.length;
		    $("#message").css("background-color",color[i]);
		    }, 400);
	 }
	
	  
  })