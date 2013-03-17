<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="play.music.entity.User" %>
<% User user = (User)session.getAttribute("user"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<head> 
<link type="image/x-ico" rel="shortcut icon" href="listimage/favicon.ico" />
<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
<link href='http://fonts.googleapis.com/css?family=Nosifer' rel='stylesheet' type='text/css'>
<link href="css/redmond/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<script src="js/jquery-1.8.3.js"></script>
<script src="appjs/swfobject.js"></script>
<script src="appjs/fm.js" charset="gb2312"></script>
<script src="appjs/music.js" charset="gb2312"></script>
<script src="appjs/activebar2.js"></script>
<script src="js/jquery-ui-1.9.2.custom.js"></script>
<link rel="stylesheet" href="kuting/main.css" />
<link rel="stylesheet" href="kuting/fm.css" />
<title>Ting::发现您喜欢的音乐</title>
</head>
<header>
<div id="headerline"></div>
<div id="header">
<div id="i"><a href="index.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">专辑</button></a></div>
<div id="i"><a href="music.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">play</button></a></div>
<div id="i"><a href="tingfm.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">电台</button></a></div>
<div id="i"><a href="group.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">小组</button></a></div>
<% if(user!=null){%>
<div id="i"><a href="<%=basePath%>displaylove?name=<%=user.getName()%>"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">收藏</button></a></div>
<%} else {%>
<div id="i"><a href="collection.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">收藏</button></a></div>
<%}%>
<div id="i"><a href="player.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">有乐</button></a></div>
<div id="i"><button id="opener" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-button-text">关于Ting</button></div>
</header>
<div id="headerlow"></div>
<body>
<div id="artfm">
 <ul>
		     <li>&nbsp <img src="listimage/m6.ico" style="height:60px;width:60px"/></li> 
		     <li><p id="biaoti"> &nbsp  Ting电台 <sub style="font-size:12px">--音乐radio</sub></p></li> <br/>
		   </ul>

</div>
<div id="tabs">
<div id="tip" style="float:right"></div>
  <ul>
    <li><a href="#tabs1">豆瓣电台</a></li>
    <li><a href="#tabs2">虾米电台</a></li>
    <li><a href="#tabs3">酷狗电台</a></li>
  </ul>
  <div id="tabs1">
    <div id="dbfm" style="width: 800px; height: 300px;">
    </div>
  </div>
  <div id="tabs2">
    <div id="xmfm" style="width: 800px; height: 300px;">
   
   </div>
  </div>
  <div id="tabs3" >
   <div id="kgfm" style="width: 800px; height: 400px;" > </div>
  </div>
</div>
</body>
<footer>
<div id="dialog">
<p>Ting是一个基于音乐api的音乐搜索web2.0网站</p>
<p>您可以联系keejunliu@gmail.com</p>
<p>当前日期：
 <div id="datepicker" class="datapicker"></div>	
</p>
</div>
<script type="text/javascript">
$(function() {
	 $('<div></div>').html('在这里，您可以静静地，听电台.....').activebar({
             'font': 'serif',
             'icon': 'kuting/love.ico',  
              fontSize:'20px',
              button:'kuting/closebtn.png',
        });
    $("#tabs" ).tabs();
	$("#dbfm").load('fm/dbfm.html');
	$("#tabs a").click(
    function(){
	var $tabs = $('#tabs').tabs(); 
	var selected = $tabs.tabs('option', 'selected');
	if(selected==0){
	  $("#xmfm").empty();
	  $("#kgfm").empty();
	  $("#dbfm").load("fm/dbfm.html");
	  return false;
	}
	if(selected==1){
	  $("#dbfm").empty();
	  $("#kgfm").empty();
	  $("#xmfm").load("fm/xmfm.html");
	  return false;
	}
	if(selected==2){
	  $("#dbfm").empty();
	  $("#xmfm").empty();
	  $("#kgfm").load("fm/kgfm.html");
	  return false;
	}
    }
  );
	
  }
); 
$(function () {
      
        if ($.browser.msie) { 
            browserTip = "IE ";
        }
        if ($.browser.mozilla) { 
            browserTip = "Mozilla Firefox ";
        }
		if ($.browser.safari) { 
            browserTip = "safari ";
        }
		if ($.browser.chrome) { 
            browserTip = "chrome ";
        }
        browserTip += $.browser.version; 
        $("#tip").html(browserTip);
    });
</script>
</footer>
</html>