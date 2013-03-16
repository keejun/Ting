var code;
function createcode(){
	code =new Array();
	var codelength=6;
	var checkcode=document.getElementById("yanzhengma");
	
	checkcode.innerHTML="";
	
	var selectchar=new Array(0,1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f','g','h','j','k');
	for(var i=0;i<codelength;i++){
	 var charindex=Math.floor(Math.random()*20);
	 code+=selectchar[charindex];
	}
	if(code.length!=codelength){
		createcode();
	}
	checkcode.innerHTML=String(code);
	
}