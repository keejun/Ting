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
<link rel="stylesheet" href="kuting/lore.css"/>
<link rel="shortcut icon" type="image/x-ico" href="kuting/favicon.ico" />
<title>Ting帐户</title>
</head>
<header>
<div id="headerline"></div>
<div id="header">
<div id="i"><a href="index.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">专辑</button></a></div>
<div id="i"><a href="music.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">play</button></a></div>
<div id="i"><a href="tingfm.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">电台</button></a></div>
<div id="i"><a href="<%=basePath%>displaytopic"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">小组</button></a></div>
<% if(user!=null){%>
<div id="i"><a href="<%=basePath%>displaylove?name=<%=user.getName()%>"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">收藏</button></a></div>
<%} else {%>
<div id="i"><a href="collection.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">收藏</button></a></div>
<%}%>
<div id="i"><a href="player.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">有乐</button></a></div>
</header>
<div id="headerlow"></div>
<body>
<div id="loginbox" style="float:left">
<div style="float:left">
<form action="findpassword" method="post" name="login" onsubmit="">
         <span style="width:45%; height:8%; background:#e5ebe4"><label>找回密码:</label><br/></span>
          <div>-----------------------------</div>
         <input type="text" name="nickname" class="loginna" placeholder="昵称" id="loginemail" autocomplete="off" title="您的昵称" class="ui-autocomplete-input"> <br/>
          <div>-----------------------------</div>
         <input type="email" name="email" placeholder="邮箱帐号" id="loginemail" autocomplete="off" title="登录帐号" class="ui-autocomplete-input"> <br/>
         <input type="submit" name="submit" id="loginaction" value="寻找" title="找回密码"/><br/>
         <span><% if(session.getAttribute("findpass")!=null){%>
         <%=session.getAttribute("findpass") %>
         <% } %>
         </span>
</form>
</div>
<div style="float:right; background:#eee" >
  
  <p>注意：当您输入查询后有误后，为了帐号安全，会自动注销当前帐户</p>
  <p>请谨防以下方面:</p>
  <ul>
  <li>1.收集或分享您的相关信息的网站<br/></li>
  <li>2.跟踪您所访问网页的互联网服务提供商<br/></li>
  <li>3.跟踪按键记录的恶意软件<br/></li>
  <li>4.不怀好意的监视者<br/></li>
  <li>5.他人的窥视<br/></li>
  <ul>
</div>
<% if (session.getAttribute("user")!=null) {%>
<a href="signup.jsp" title="已经注销当前帐户"><button onclick="<%session.removeAttribute("user");%>">切换帐户</button></a>
<%}%>
</div>
</body>
</html>