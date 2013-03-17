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
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
<head> 
<link type="image/x-ico" rel="shortcut icon" href="listimage/favicon.ico" />
<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
<link href="css/redmond/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<script src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui-1.9.2.custom.js"></script>
<script type="text/javascript" src="appjs/header.js" charset="gb2312"></script>
<script type="text/javascript"src="appjs/chinesedata.js" charset="gb2312"></script>
<link rel="stylesheet" href="kuting/main.css" />
<link rel="stylesheet" href="kuting/object.css"/>
<link rel="stylesheet" href="kuting/group.css"/>
<link rel="stylesheet" href="kuting/named.css"/>
<link rel="stylesheet" href="kuting/grouper.css" />
<link rel="stylesheet" href="kuting/topics.css"/>
<link rel="stylesheet" href="kuting/hrs.css"/>
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
<body>
<div id="grouper"> 
<div id="gr">Ting小组<div style="font-size:12px">与您喜欢的音乐话题不期而遇</div></div>
</div>
<div id="placepause"></div>
 <div id="wapper">
	<div id="contents">
		<div id="leftcontents">
		    <div id="hrdiv" style="width:100%"> <hr class="at2" style="border-top:2px dotted #7CCD7C"> </div>
			<div id="leftside" class="leftside">
			        <div class ="keejun_title"><a id="question" href="#">你最喜欢的歌手?</a></div>
           			<div class="keejun_back">
           				<span id="scanumber">浏览数:1223</span><span id="replynumber">回复数:58</span>
              		</div>
              		<div class ="keejun_time"><span>更新:2013/09/04</span> <span>发起:2013/08/04</span></div>
              		
          	</div>
          	<div id="leftside" class="leftside">
          			<div class ="keejun_title"><a id="question" href="#">最近上海有什么明星的演出///////////////////////////////////////////////////////////////////?</a></div>
           			<div class="keejun_back">
           				<span id="scanumber">浏览数:1223</span><span id="replynumber">回复数:58</span>
              		</div>
              		<div class ="keejun_time"><span>更新:2013/09/04</span> <span>发起:2013/08/04</span></div>
      
          	</div>
           <div id="leftside" class="leftside">
		
          			<div class ="keejun_title"><a id="question" href="#">你最喜欢的歌手?</a></div>
           			<div class="keejun_back">
           				<span id="scanumber">浏览数:1223</span><span id="replynumber">回复数:58</span>
              		</div>
              		<div class ="keejun_time"><span>更新:2013/09/04</span> <span>发起:2013/08/04</span></div>	
          
          	</div>
           <div id="leftside" class="leftside">
				<div class='title_back'>
          			<div class ="keejun_title"><a id="question" href="#">你最喜欢的歌手?</a></div>
           			<div class="keejun_back">
           				<span id="scanumber">浏览数:1223</span><span id="replynumber">回复数:58</span>
              		</div>
              		<div class ="keejun_time"><span>更新:2013/09/04</span> <span>发起:2013/08/04</span></div>
       			</div>
          	</div>		
		</div>
        <div id="rightcontents"> 
         <ul>
         <li class="ontitle">&nbsp 我的小组话题</li>
         <li><a href="/myques"> &nbsp 我发起的话题</a></li>
         <li><a href="/myreply">&nbsp 我回应的话题</a></li>
         <li><a href="<%=basePath%>newtopic.jsp"> &nbsp &nbsp 发起新话题</a></li>
         </ul> 
        </div>
    </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
$(".leftside:even").css("background-color","#e5ebe4");
$(".leftside").mouseenter(function(){
	  $(this).css("background-color","#FFE7BA");
	});
$(".leftside").mouseleave(function(){
	$(".leftside:even").css("background-color","#e5ebe4");
	$(".leftside:odd").css("background-color","");
	});
})
</script>
</body>