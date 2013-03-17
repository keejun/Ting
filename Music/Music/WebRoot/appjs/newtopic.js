function checkques(newtopic){
	with(newtopic){
	   if($("#question").val()==""||("#question").length>40){
			$("#tiwen").html("话题不能为空且字数不长于40");
			$("#tiwen").focus();
			return false;
		   }
	   if($("#ques").val()==""||("#ques").length>600){
		   $("#tiwentip").html("话题要有点内容,且内容长度不大于400");
		   $("#tiwentip").focus();
		   return false;
	   }
	   
	}
}
