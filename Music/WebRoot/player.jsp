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
<script type="text/javascript" src="appjs/kissy-min.js"></script>
<script type="text/javascript" src="appjs/tinglo.js"></script>
<script src="http://www.google.com/jsapi?key=ABQIAAAAkPXkHB2m5IG0qt6_uuW3eRReSNJ-1Pcny_Bt2FJf_TLE7LWQ7BQKHo8jbp7-Pq0aEE0o_4Pe5hIZ-g"type="text/javascript"></script>
<link rel="stylesheet" href="kuting/main.css" />
<link rel="stylesheet" href="kuting/search.css"/>
<link rel="stylesheet" href="kuting/object.css"/>
<link rel="stylesheet" href="kuting/tinglo.css"  media="all" />
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
<% if(user!=null){%>
<div id="i"><a href="<%=basePath%>displaylove?name=<%=user.getName()%>"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">收藏</button></a></div>
<%} else {
  %>
<div id="i"><a href="collection.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">收藏</button></a></div>
<%}%>
<div id="i"><a href="player.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">有乐</button></a></div>
</header>
<div id="headerlow"></div>
<body>
<div id="out-box">
		<input type="file"  multiple="multiple" name="" id="file-up-load" class="file-up-load-1" title="添加至歌单"/>
		<div id="playerbox">
			<audio src=""></audio>
			<a href="#play" id="playerbox-play" title="播放/暂停"></a>
			<div id="range">
				<div id="range-timer"><b></b></div>
			</div>
			<a href="#mode-inorder" class="mode smode" id="playerbox-mode-inorder" title="顺序"></a>
			<a href="#mode-1" class="mode" id="playerbox-mode-1" title="单曲"></a>
			<a href="#mode-outorder" class="mode" id="playerbox-mode-outorder" title="随机"></a>
		</div>
		<div id="song-info">
			<img src="images/player.gif" style="height:20px;width:26px"/><h1></h1>
		</div>
		<ul id="searchcontrol"></ul>
		<span id="change-bg-txt">更改背景</span>
		<input type="file" name="" id="change-bg-file"/>
		<a id="know-more" target="_blank" href=""></a>
		<div id="listbox" onselectstart="return false">
			<ul id="play-list">
			</ul>
			<a id="show-list" href="#show-list" title="显示/隐藏歌单">自选歌曲集</a>
			<a id="add-list" href="#addlist" title="添加入歌单">+</a>
		</div>
		<div id="cover"></div>
		<div id="first-box">
			<p>
			 如您现在的浏览器不是很好地支持html5，对不起，升级您的浏览器。<br/>
	               关于音频格式：<br/>
	         chrome用户请选择aac(mp4/m4a), mp3, ogg, wav, webm<br/>
			 opera10+/firefox用户选择ogg, wav, webm。<br />
			 tips:可以多首歌曲一次性添加。
			</p>
			<div>浏览/Browser...</div>
		</div>
	</div>
</body>
</html>
