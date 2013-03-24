<%@page import="java.net.URLEncoder"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="play.music.action.Login" %>
<%@page import="play.music.action.Register" %>
<%@page import="play.music.entity.User" %>
<%@page import="play.music.entity.Music" %>
<% User user = (User)session.getAttribute("user"); %>
<% List<Music> musics = (List<Music>)request.getAttribute("musics"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
<head> 
<link type="image/x-ico" rel="icon" href="listimage/favicon.ico" />
<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
<link href="css/redmond/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<script src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui-1.9.2.custom.js"></script>
<script src="js/quickpager.jquery.js"></script>
<script src="js/float.js"></script>
<link href='http://fonts.googleapis.com/css?family=Rancho' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="appjs/header.js" charset="gb2312"></script>
<script type="text/javascript" src="appjs/yanzhengma.js" ></script>
<script type="text/javascript" src="appjs/checkaccount.js" ></script>
<link rel="stylesheet" href="kuting/main.css" />
<link rel="stylesheet" href="kuting/object.css"/>
<link rel="stylesheet" href="kuting/collection.css"/>
<link rel="stylesheet" href="kuting/lore.css"/>
<link rel="stylesheet" href="kuting/named.css"/>
<link rel="stylesheet" href="kuting/hrs.css"/>
<link rel="shortcut icon" type="image/x-ico" href="kuting/favicon.ico" />
<script type="text/javascript">
$(document).ready(function() {
	$("ul.paging2").quickPager({pagerLocation:"both"});
	 $('.cloud').each(function() {
		  $(this).jqFloat({
			width:Math.floor(Math.random()*10)*10,
			height:10,
			speed:Math.floor(Math.random()*10)*100
		  });
	   });	
	 
});
  
</script>
<style type="text/css">
   #musicdisplay{ margin-left:24% ;}
   ul {
	clear: both;
    }
   ul.paging2 li {
    padding: 10px;
    background: #83bd63;
    font-family: georgia;
    font-size: 24px;
    color: #fff;
    line-height: 1;
    width: 350px;
    height:44px;
    margin-bottom: 1px;
   
}

ul.red {
	outline:10px solid red;
}

ul.simplePagerNav li{
    display:block;
    floaT: left;
    padding: 3px;
    margin-bottom: 10px;
    font-family: georgia;
}

ul.simplePagerNav li a{
    color: #333;
    text-decoration: none;
}

li.currentPage {
	    background: red;
        background: #83bd63;	
}

ul.simplePagerNav li.currentPage a {
	color: #fff;	
}

table.pageme {
    border-collapse: collapse;
    border: 1px solid #ccc;
}  

table.pageme td {
    border-collapse: collapse;
    border: 1px solid #ccc;
}  
#cloud2{
	top:14%;
	left:16%;
}
#cloud3{
	top:65%;
	right:37%;
}
#cloud4{
	top:70%;
	right:32%;
	z-index:5;
}   
.cloud{
	width:104px;
	height:66px;
	background:url(kuting/sprite.png) no-repeat 0 0;
	position:absolute;
	z-index:10;
}
</style>
<% if(user!=null){ %>
<title><%=user.getName()%>::发现您喜欢的音乐</title>
<%} else{%>
<title>Ting::发现您喜欢的音乐</title>
<%} %>
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
<% if(user==null) { %>
<div id="right"><a href="signup.jsp" class="named">登录</a></div>
<% }  else { %>
<div id="right"><a href="signup.jsp" style="font-size:14px" class="named"><%=user.getName() %></a></div>
<% } %>
</header>
<div id="headerlow"></div>
<div id="collection"> 
<div id="co">Ting cloud <sub style="font-size:12px">集中您喜欢的音乐</sub></div>   
  <% if(user!=null){
      String name =request.getParameter("name");
      String realname =new String(name.getBytes("ISO8859_1"),"utf-8");
       %>
      <span style="background:#04B486;color:white"><b><%= realname %>喜欢的音乐</b></span>
    <%}%>
    
</div>
<% if (user==null) {%>
<body onload="createcode()">
   <div id="loginbox">
   <div id="login">
        <p><b>请先登录</b></p>
        <form action="login" method="post" name="login" onsubmit="return checklogin(login)">
         <input type="email" name="email" placeholder="邮箱帐号" id="loginemail" autocomplete="off" title="登录帐号" class="ui-autocomplete-input">
         <div id="hrdiv"></div>
         <input type="password" name="password" placeholder="密码" id="loginemail" autocomplete="off" title="密码" class="ui-autocomplete-input">
         <div id="hrdiv"></div>
         <span  id="yanzhengma" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" style="width:104px; height:4%; background:#e5ebe4"></span>
         <input type="text" name="yanzheng" placeholder="输入验证码" title="输入验证码" autocomplete="off" class="ui-autocomplete-input" style="width:20%;height:4%"/><br/>
         <input type="submit" name="submit" id="loginaction" value="登录"/>
         <div id="hrdiv"><hr class='alt2' /></div>
        </form>
         <span id="error1">
         <% if (session.getAttribute("errorlogins")!=null) {%>
         <%=session.getAttribute("errorlogins") %>
         <% } %></span>
        <br/>
         <a href="signup.jsp#register" title="没有帐号">没有帐号？</a>
    </div> 
    </div>
  <% } else {%>
   <body>
    <div id="sky">
		<div id="cloud2" class="cloud"></div>
		<div id="cloud3" class="cloud"></div>
		<div id="cloud4" class="cloud"></div>
    </div> 
    <div id="musicdisplay">
    <ul class="paging2">
    <% if(musics.size()==0) {
    	  String name =request.getParameter("name");
          String realname =new String(name.getBytes("ISO8859_1"),"utf-8");
          out.print("<b>对不起，" +realname+"还没有收藏记录</b>");
          } 
      else {
          int i=1;
          for(int j=0;j<musics.size();j++){
        	  Music music =(Music)musics.get(j);
        	  %>
        	<li><div id="song<%=i%>" style="float:left;"><%=i%>.<embed src="http://www.xiami.com/widget/470304_<%=music.getMusicid()%>/singlePlayer.swf" type="application/x-shockwave-flash" width="257" height="33" volume="30"  wmode="transparent"></embed> &nbsp <a href="#" onclick="$(this).parent().parent().remove()" title="删除"> x</a> &nbsp&nbsp </div></li> 
             <% i++;}
          }%>
          
  <% } %>
  </ul>
  </div>
</body>
<footer>
</footer>
</html>