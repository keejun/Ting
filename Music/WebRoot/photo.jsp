<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
<head> 
<link type="image/x-ico" rel="shortcut icon" href="listimage/favicon.ico" />
<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
<link href="css/redmond/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<script src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui-1.9.2.custom.js"></script>
<script type="text/javascript" src="appjs/header.js" charset="gb2312"></script>
<script type="text/javascript" src="appjs/list.js" charset="gb2312"></script>
<script type="text/javascript"src="appjs/chinesedata.js"  charset="gb2312"></script>
<script type="text/javascript"src="appjs/qdway.js" charset="gb2312"></script>
<link rel="stylesheet" href="kuting/main.css" />
 <style type="text/css">
   	 *{margin:0;padding:0;}
	  ul,li{list-style:none;}
	#div1{width:700px;height:450px;margin:40px auto;position:relative;}	
	#div1 li{position:absolute;width:700px;height:450px;left:0;top:0;overflow:hidden;}
   </style>
<link rel="stylesheet" href="kuting/main.css" />
<link rel="stylesheet" href="kuting/searchtip.css"/>
<link rel="stylesheet" href="kuting/search.css"/>
<link rel="stylesheet" href="kuting/object.css"/>
<link rel="shortcut icon" type="image/x-ico" href="kuting/favicon.ico" />
<title>Ting::发现您喜欢的音乐</title>
</head>
<header>
<div id="headerline"></div>
<div id="header">
<div id="i"><a href="index.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">专辑</button></a></div>
<div id="i"><a href="music.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">play</button></a></div>
<div id="i"><a href="tingfm.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">电台</button></a></div>
<div id="i"><a href="group.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">小组</button></a></div>
<div id="i"><a href="collection.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">收藏</button></a></div>
<div id="i"><a href="photo.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">photo</button></a></div>
</header>
<div id="headerlow"></div>
<body>
<div id="div1">
    <ul>
    	<li style="background:url(test/1.jpg) 0 0 no-repeat;"></li>
        <li style="background:url(test/2.jpg) 0 0 no-repeat;"></li>
        <li style="background:url(test/3.jpg) 0 0 no-repeat;"></li>
		<li style="background:url(test/1.jpg) 0 0 no-repeat;"></li>
    </ul>
</div>
</body>
<script>
var zIndex=9999;
window.onload=function(){
	var divNum=move._$("div1").getElementsByTagName("li");
	var divWidth=move._$("div1").offsetWidth;
	for(var i=0;i<divNum.length;i++)
	{
		zIndex--;
		divNum[i].style.zIndex=zIndex;
		var addSpan=document.createElement("span");
		addSpan.style.height=move._$("div1").offsetHeight+"px";
		addSpan.style.width=move._$("div1").offsetWidth+"px";
		addSpan.style.zIndex=99999;
		addSpan.style.display="block";
		divNum[i].appendChild(addSpan);
		divNum[i].onmousedown=function(ev){
			startMove(this,ev);
		};
	}
	function startMove(obj,ev)
	{
		var oEvent=ev||event;
		var o=obj;
		var divStartX=obj.offsetLeft;
		var mouseStartX=oEvent.clientX;
		var stopMouseX=0;
		if(obj.setCapture)
		{
			obj.onmousemove=doMove;
			obj.onmouseup=stopMove;
			obj.setCapture();
		}
		else
		{				
			document.addEventListener('mousemove',doMove,true);
			document.addEventListener('mouseup',stopMove,true);
		}
		function doMove(ev)
		{
			var oEvent=ev||event;
			var l=oEvent.clientX-mouseStartX+divStartX;
			stopMouseX=oEvent.clientX;
			o.style.left=l+"px";
			
		}
		function stopMove()
		{
			if(obj.releaseCapture)
			{
				obj.onmousemove=null;
				obj.onmouseup=null;
				obj.releaseCapture();
			}
			else
			{
				document.removeEventListener("mousemove",doMove,true);
				document.removeEventListener("mouseup",stopMove,true);
			}
			//document.title=mouseStartX+"|"+stopMouseX;
			//在这添加运动
			//注意：当鼠标只点击，而不移动时，此时的stopMouseX为0，所以向左拖拽成立，则运动执行！如不想要则把
			/*
			if(stopMouseX==0)
			{
				return false;
			}
			else 
			*/
			//加上即可
			if(stopMouseX<=mouseStartX)//向右拖拽
			{
				
				var index=o.style.zIndex;
				move.startMove(o,{left:-divWidth},function(){
				move.startMove(o,{left:0},null,index,"in",divNum.length);
				});
			
				
			}
			else{
				
				var index=o.style.zIndex;
				move.startMove(o,{left:divWidth},function(){
				move.startMove(o,{left:0},null,index,"in",divNum.length);
				});
			}
			
		}
		
	}
};
</script>
