function checkreply(newreply)
{
	with(newreply){
		if($("#replycontent").val()==""||$("#replycontent").length>400){
			$("#replytips").css({
				 "margin-top" :"4px",
				 "font-size" :"4px" ,
				 "color" :"red" ,
				 "background" :"#B2DFEE",
				 "width":"100px",
				 "height":"20px",
				 "border-radius":"10px",
				 "border":"none",
				 "padding":"2px"
			});
			$("#replytips").html("回复要有点内容");
			
			
			$("#replycontent").focus();
			return false;
		}
	}

 }