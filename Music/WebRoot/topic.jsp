<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="play.music.entity.User" %>
<%@page import="play.music.entity.Topic" %>
<% User user = (User)session.getAttribute("user"); %>
<% List<Topic> replys= (List<Topic>)session.getAttribute("replys"); %>
<% Topic question= (Topic)session.getAttribute("question"); %>
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
<script type="text/javascript"src="appjs/checkreply.js" charset="gb2312"></script>
<link rel="stylesheet" href="kuting/main.css" />
<link rel="stylesheet" href="kuting/search.css"/>
<link rel="stylesheet" href="kuting/group.css" />
<link rel="stylesheet" href="kuting/grouper.css" />
<link rel="stylesheet" href="kuting/topics.css"/>
<link rel="stylesheet" href="kuting/hrs.css"/>
<link rel="stylesheet" href="kuting/newtopic.css"/>
<link rel="stylesheet" href="kuting/topicplay.css"/>
<link rel="shortcut icon" type="image/x-ico" href="kuting/favicon.ico" />
<title><%=question.getQues()%>:Ting</title>
</head>
<header>
<div id="headerline"></div>
<div id="header">
<div id="i"><a href="index.jsp"><span class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">专辑</span></a></div>
<div id="i"><a href="music.jsp"><span class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">play</span></a></div>
<div id="i"><a href="tingfm.jsp"><span class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">电台</span></a></div>
<div id="i"><a href="<%=basePath%>displaytopic"><span class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">小组</span></a></div>
<% if(user!=null){%>
<div id="i"><a href="<%=basePath%>displaylove?name=<%=user.getName()%>"><span class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">收藏</span></a></div>
<%} else {%>
<div id="i"><a href="collection.jsp"><span class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">收藏</span></a></div>
<%}%>
<div id="i"><a href="player.jsp"><span class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">有乐</span></a></div>
<div id="i"><span id="opener" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-button-text">关于Ting</span></div>
</header>
<div id="headerlow"></div>
<body>
 <div id="grouper"> 
 <div id="gr">Ting小组<div style="font-size:12px">与您喜欢的音乐话题不期而遇</div></div>
 </div>
 <div id="placepause"></div>
   <div id="topicplay">
       <div><b><%=question.getQues()%></b></div>
       <div><p><%=question.getQuesinfo()%></p></div>
       <p class="fatieren"><%=question.getPubren() %>于<%=question.getPubtime()%>发起 <span id="backtogroup"><a href="<%=basePath%>displaytopic">回到话题组</a></span> </p>
       
   <div id="hrdiv" style="width:100%"> <hr class="at2" style="border-top:2px dotted #FF7F00"> </div>
   <% if(replys!=null){ %>
  <% for(int j=0 ;j<replys.size();j++) {
    Topic reply = (Topic)replys.get(j); %>
    <div><span style="color:#7EC0EE"><a href="displaylove?name=<%=reply.getReplyren()%>"><%=reply.getReplyren()%></a>:</span>
         <span> <%=reply.getReply()%></span>
    </div>
    <div id="timereply">回复于<%=reply.getReplytime()%></div>
    <div id="hrdiv" style="width:100%"><hr class="at" style="border-top:1px dotted #7CCD7C"> </div>
  <%}%>
  <%}%><br/>
   <% if(user==null){%>
       <%} else {%>
       <form action="reply" name="newreply" method="post" onsubmit="return checkreply(newreply)"><%}%>
             <textarea id="replycontent" name="replyinfo" placeholder="话题内容" ></textarea>
             <br/><input type="submit" name="submit" id="submit" value="回复">
             <div id="replytips"></div>
       </form>
  </div>
  <footer> 
  <div id="dialog" title="请先登录Ting">
	   <p>正在切换登录至Ting帐户...</p>
  </div>

 </footer>
  <script>
 <% if(user==null){%>
 $( "#dialog" ).dialog({
     autoOpen: false,
     show: {
       effect: "blind",
       duration: 1000
     },
     hide: {
       effect: "clip",
       duration: 1000
     }
   });
   $("#submit").click(function() { 
	   $("#dialog").dialog("open");
	   setTimeout(displayone,3000);
	   function displayone(){
	   window.location.href="signup.jsp" ;
	   }
	 });
 <%}%>
 </script>
</body>