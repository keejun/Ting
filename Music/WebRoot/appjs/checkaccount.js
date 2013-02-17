function checkemail(email)

{

with (email)

{

apos=value.indexOf("@")

dotpos=value.lastIndexOf(".")

if (apos<1||dotpos-apos<2) 

  { 
   return false ;}

else {return true}

}
}  
function checkpass(password){
	with(password){
	if(password.value.length<5) {
		return false;
	}
  }
}

function checkname(nickname){
	with(nickname){
		if(nickname.value==""||nickname.value.length>7){
			return false;
		}
		
	}
}
function checkyan(yanzheng){
	with(yanzheng){
	   if(yanzheng.value!=document.getElementById("yanzhengma").innerHTML){
		   return false; 
       }		
	}
}
function checkpass1(password1,password){
	with(password1,password){
		if(password1.value!=password.value){
			
			return false;
		}
	}
	
}
function checkyan1(yanzheng1){
	with(yanzheng1){
	   if(yanzheng1.value!=document.getElementById("yanzhengma1").innerHTML){
		   return false; 
       }		
	}
}
function checklogin(login){
	with(login){
		
		if(checkemail(email)==false||checkpass(password)==false||checkyan1(yanzheng1)==false){
		   document.getElementById("error1").innerHTML="邮箱格式不对|密码长度不够6位|验证码错误<br/>";
		   return false;
			
		}
	}	
}
function checkregi(regi){
	with(regi){
		if(checkemail(email)==false||checkpass(password)==false||checkname(nickname)==false||checkyan(yanzheng)==false||checkpass1(password1,password)==false){
			   document.getElementById("error3").innerHTML="邮箱格式不对|密码长度不够6位|昵称不可以为空且长度不大于7|验证码输入不对<br/>";
			   return false;
		 }
	}
	
}
