function checkques(newtopic){
	with(newtopic){
	   if($("#question").val()==""||("#question").length>40){
			$("#tiwen").html("���ⲻ��Ϊ��������������40");
			$("#tiwen").focus();
			return false;
		   }
	   if($("#ques").val()==""||("#ques").length>600){
		   $("#tiwentip").html("����Ҫ�е�����,�����ݳ��Ȳ�����400");
		   $("#tiwentip").focus();
		   return false;
	   }
	   
	}
}
