var code1;
function createcode1(){
	code1 =new Array();
	var codelength1=6;
	var checkcode1=document.getElementById("yanzhengma1");
	checkcode1.innerHTML="";
	var selectchar1=new Array(0,1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f','g','h','j','k');;
	for(var i=0;i<codelength1;i++){
	 var charindex1=Math.floor(Math.random()*20);
	 code1+=selectchar1[charindex1];
	}
	if(code1.length!=codelength1){
		createcode1();
	}
	checkcode1.innerHTML=String(code1);
}