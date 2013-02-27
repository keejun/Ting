<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="play.music.action.Login" %>
<%@page import="play.music.action.Register" %>
<%@page import="play.music.entity.User" %>
<% User user = (User)session.getAttribute("user"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html"/>
<head> 
<link type="image/x-ico" rel="shortcut icon" href="listimage/favicon.ico" />
<link href='http://fonts.googleapis.com/css?family=The+Girl+Next+Door' rel='stylesheet' type='text/css'>
<link href="css/redmond/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<script src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui-1.9.2.custom.js"></script>
<script src="js/mailsuggest.js"></script>
<script type="text/javascript" src="appjs/checkaccount.js" ></script>
<script type="text/javascript" src="appjs/yanzhengma.js" ></script>
<script type="text/javascript" src="appjs/yanzhengma1.js" ></script>
<script type="text/javascript" src="appjs/header.js" ></script>
<script type="text/javascript" src="appjs/list.js" charset="gb2312"></script>
<script type="text/javascript"src="appjs/chinesedata.js" charset="gb2312"></script>
<link rel="stylesheet" href="kuting/main.css" />
<link rel="stylesheet" href="kuting/searchtip.css"/>
<link rel="stylesheet" href="kuting/search.css"/>
<link rel="stylesheet" href="kuting/object.css"/>
<link rel="stylesheet" href="kuting/lore.css"/>
<link rel="stylesheet" href="kuting/named.css"/>
<title>Ting::发现您喜欢的音乐</title>
<script type="text/javascript">
$(function() {
    $("#tabs" ).tabs();
  });
</script>
<script type="text/javascript">

window.onload = function(){				
	var Suggest = new InputSuggest({
		input: document.getElementById('loemail'),
		data: ['sina.cn','sina.com','vip.sina.com.cn','qq.com','163.com']
	});
	var Suggest1 = new InputSuggest({
		width: 300,
		opacity: 0.9,
		input: document.getElementById('loemail1'),
		data: ['sohu.com','sogou.com','chinaren.com','vip.sohu.com','sohu.net','qq.com','sms.sohu.com']
	});	
} 
</script>
<script>
#i{
 font-family:Microsoft YaHei;
}
#right{
  float:right;
  font-family:Microsoft YaHei;
  padding:4px;
 }
.suggest-container {
    border: 1px solid #C1C1C1;
    visibility: hidden;
    background: #FFFFFF;
}

.suggest-item, .suggest-active {
    padding: 5px;
}

.suggest-active {
    background: #222;
    color: white;
} 
</script>
</head>
<header>
<div id="headerline"><a name="top"></a></div>
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
<div id="i"><a href="player.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">自乐</button></a></div>
<% if(user==null) { %>
<div id="right"><a href="signup.jsp" class="named">Ting帐户</a></div>
<% }  else { %>
<div id="right"><a href="signup.jsp" style="font-size:14px" class="named"><%=user.getName() %></a></div>
<% } %>
</div>
</header>
<div id="headerlow"></div>
  <body onload="createcode()&createcode1()">
    <div id="loginbox">
    <div id="tabs">
    <div id="tip" style="float:right"></div>
     <ul>
     <% if (session.getAttribute("user")==null) { %> <li><a href="#login">登录到帐户</a></li><% } %>
    <li><a href="#register">注册Ting帐户</a></li>
     </ul>
     <% if (session.getAttribute("user")==null) { %>
     <div id="login">
        <form action="login" method="post" name="login" onsubmit="return checklogin(login)">
         <input type="email" name="email" placeholder="帐户" id="loemail" autocomplete="on" title="登录帐号" class="ui-autocomplete-input"/><br/><hr/>
         <input type="password" name="password" placeholder="密码" id="loginemail" autocomplete="off" title="密码" class="ui-autocomplete-input"/>  <br/><hr/>
         <span  id="yanzhengma1" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" style="width:25%; height:4%; background:#e5ebe4"></span>
         <input type="text" name="yanzheng1" placeholder="输入验证码" title="输入验证码" autocomplete="off" class="ui-autocomplete-input" style="width:22%"/><br/>
         <input type="submit" name="submit" id="loginaction" value="登录"/>
        </form>
         <span id="error1">
         <% if (session.getAttribute("errorlogins")!=null) {%>
         <%=session.getAttribute("errorlogins") %>
         <% } %></span>
        <br/><a href="mycount.jsp" title="忘记密码">忘记密码？</a>
    </div>  <% } %>
   <div id="register">
         <% if(user!=null) {%>
          <span>您又想来一注册?!</span><%} %>
        <form action="register" method="post" name="regi"onsubmit="return checkregi(regi)">
         <input type="text" name="nickname" class="loginna" placeholder="昵称" id="loginemail" autocomplete="off" title="您的昵称" class="ui-autocomplete-input"/> <br/> <hr/>
         <input type="email" name="email" id="loemail1" placeholder="帐户" autocomplete="on" title="登录帐号" class="ui-autocomplete-input"/> <br/> <hr/>
         <input type="password" name="password" placeholder="密码" id="loginemail" autocomplete="off" title="密码" class="ui-autocomplete-input"/> <br/><hr/>
         <input type="password" name="password1" placeholder="确认密码" id="loginemail" autocomplete="off" title="确认密码" class="ui-autocomplete-input"/>  <br/><hr/>
         <span  id="yanzhengma" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" style="width:25%; height:4%; background:#e5ebe4"></span>
         <input type="text" name="yanzheng" placeholder="输入验证码" title="输入验证码" autocomplete="off" class="ui-autocomplete-input" style="width:22%"/><br/>
         <input type="submit" name="submit" id="loginaction" value="注册"/>
        </form>
         <span id="error3">
         <% if (session.getAttribute("errorlogin")!=null) {%>
         <%=session.getAttribute("errorlogin")%> <% } %>
          </span>
   </div>
    </div>
   </div>
  </body>
</html>
