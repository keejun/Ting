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
<head> 
<link type="image/x-ico" rel="shortcut icon" href="listimage/favicon.ico" />
<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
<link href="css/redmond/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<script src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui-1.9.2.custom.js"></script>
<script type="text/javascript" src="appjs/header.js" charset="gb2312"></script>
<script type="text/javascript"src="appjs/chinesedata.js"  charset="gb2312"></script>
<script type="text/javascript"src="appjs/qdway.js" charset="gb2312"></script>
<link rel="stylesheet" href="kuting/main.css" />
 <style type="text/css">
   	 *{margin:0;padding:0;}
	  ul,li{list-style:none;}
	#div1{width:700px;height:450px;margin:40px auto;position:relative;}	
	#div1 li{position:absolute;width:700px;height:450px;left:0;top:0;overflow:hidden;}
   </style>
<link rel="stylesheet" href="kuting/searchtip.css"/>
<link rel="stylesheet" href="kuting/search.css"/>
<link rel="stylesheet" href="kuting/object.css"/>
<link rel="shortcut icon" type="image/x-ico" href="kuting/favicon.ico" />
<title>404,出错了</title>
</head>
<header>
<div id="headerline"></div>
<div id="header">
<div id="i"><a href="<%=basePath%>index.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">专辑</button></a></div>
<div id="i"><a href="<%=basePath%>music.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">play</button></a></div>
<div id="i"><a href="<%=basePath%>tingfm.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">电台</button></a></div>
<div id="i"><a href="<%=basePath%>displaytopic"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">小组</button></a></div>
<% if(user!=null){%>
<div id="i"><a href="<%=basePath%>displaylove?name=<%=user.getName()%>"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">收藏</button></a></div>
<%} else {%>
<div id="i"><a href="<%=basePath%>collection.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">收藏</button></a></div>
<%}%>
<div id="i"><a href="<%=basePath%>player.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">有乐</button></a></div>
</header>
<div id="headerlow"></div>
<body>
 <div style="margin-top:5%;margin-left:22%"><img src="<%=basePath%>listimage/404.jpg" style="height:500px;width:600px"/></div>
</body>