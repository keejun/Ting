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
<link type="image/x-ico" rel="shortcut icon" href="listimage/favicon.ico" />
<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
<link href="css/redmond/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<script src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui-1.9.2.custom.js"></script>
<link href='http://fonts.googleapis.com/css?family=Rancho' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="appjs/header.js" charset="gb2312"></script>
<script type="text/javascript" src="appjs/list.js" charset="gb2312"></script>
<script type="text/javascript"src="appjs/chinesedata.js" charset="gb2312"></script>
<script type="text/javascript" src="appjs/yanzhengma.js" ></script>
<script type="text/javascript" src="appjs/checkaccount.js" ></script>
<link rel="stylesheet" href="kuting/main.css" />
<%--<link rel="stylesheet" href="kuting/searchtip.css"/>--%>
<link rel="stylesheet" href="kuting/search.css"/>
<link rel="stylesheet" href="kuting/object.css"/>
<link rel="stylesheet" href="kuting/collection.css"/>
<link rel="stylesheet" href="kuting/lore.css"/>
<link rel="stylesheet" href="kuting/named.css"/>
<link rel="shortcut icon" type="image/x-ico" href="kuting/favicon.ico" />
<style type="text/css">
   #musicdisplay{ margin-left:14% ;}
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
<div id="i"><a href="group.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">小组</button></a></div>
<% if(user!=null){%>
<div id="i"><a href="<%=basePath%>displaylove?name=<%=user.getName()%>"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">收藏</button></a></div>
<%} else {%>
<div id="i"><a href="collection.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">收藏</button></a></div>
<%}%>
<div id="i"><a href="photo.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">photo</button></a></div>
<% if(user==null) { %>
<div id="right"><a href="signup.jsp" class="named">登录</a></div>
<% }  else { %>
<div id="right"><a href="signup.jsp" style="font-size:14px" class="named"><%=user.getName() %></a></div>
<% } %>
</header>
<div id="headerlow"></div>
<div id="collection"> 
<div id="co">Ting collection <sub style="font-size:12px">集中您喜欢的音乐</sub></div>
 
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
         <input type="email" name="email" placeholder="邮箱帐号" id="loginemail" autocomplete="off" title="登录帐号" class="ui-autocomplete-input"><br/><hr/>
         <input type="password" name="password" placeholder="密码" id="loginemail" autocomplete="off" title="密码" class="ui-autocomplete-input">  <br/><hr/>
         <span  id="yanzhengma" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" style="width:25%; height:4%; background:#e5ebe4"></span>
         <input type="text" name="yanzheng" placeholder="输入验证码" title="输入验证码" autocomplete="off" class="ui-autocomplete-input" style="width:22%;height:4%"/><br/>
         <input type="submit" name="submit" id="loginaction" value="登录"/>
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
    <div id="musicdisplay">
    <% if(musics.size()==0) {
          out.print("<b>对不起，你还没有收藏记录</b>");
          } 
      else {
          int i=1;
          for(int j=0;j<musics.size();j++){
        	  Music music =(Music)musics.get(j);
        	  %>
        	<div id="song<%=i%>" style="float:left"><%=i%>.<embed src="http://www.xiami.com/widget/470304_<%=music.getMusicid()%>/singlePlayer.swf" type="application/x-shockwave-flash" width="257" height="33" volume="30" style="margin-top:13px" wmode="transparent"></embed><a href="#" onclick="$(this).parent().remove()" title="删除"> x</a> &nbsp&nbsp </div>  
             <% i++;}
          }%>
          
  <% } %>
  </div>
</body>
<footer>
</footer>
</html>