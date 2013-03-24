<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="play.music.entity.User" %>
<% User user = (User)session.getAttribute("user"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
<link href="css/redmond/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<script src="js/jquery-1.8.3.js"></script>
<script src="js/jquery-ui-1.9.2.custom.js"></script>
<script type="text/javascript" src="appjs/header.js" charset="gb2312"></script>
<script type="text/javascript" src="appjs/newtopic.js" charset="gb2312"></script>
<link rel="stylesheet" href="kuting/main.css" />
<link rel="stylesheet" href="kuting/newtopic.css" />
<link rel="shortcut icon" type="image/x-ico" href="kuting/favicon.ico" />
<title>创建新话题:Ting小组</title>
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
<div id="grouper"> 
<div id="gr">Ting小组<div style="font-size:12px">与您喜欢的音乐话题不期而遇</div></div>
</div>
 <div id="newtopic">
      <% if(user==null){%>
       <%} else {%>
       <form action="addtopic" name="newtopic" method="post" onsubmit="return checkques(newtopic)"><%}%>
       <ul><li><span id="ques1">创建新话题</span> <span id="backtogroup"><a href="<%=basePath%>group.jsp">回到话题组</a></span></li><br/>
            <li><div></div></li><br/>
            <li>
              <input type="text" name="ques" id="question" placeholder="新话题" ></li><span id="tiwen"></span><br/>
            <li>
              <textarea id="ques" name="quesinfo" placeholder="话题内容" ></textarea><span id="tiwentip"></span></li><br/>
              <li><input type="submit" name="submit" id="submit" value="发表"></li>
    <ul>
    </form>
 </div>
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
 $("input:eq(0)").click( 
		  function (){
			  $("input:eq(0)").animate({width:"305px"});
			  $("#tiwen").html("<-话题").css({
			  "width":"100px",
			  "height":"50px",
			  "padding":"6px",
			  "font-size":"14px",
			  "border-radius":"10px",
		      "background":"#B2DFEE",
			  "border":"none",
			  "margin-left":"2px"
			  });
			  $("#tiwentip").html("<-话题内容").css({
				  "width":"100px",
				  "height":"50px",
				  "padding":"6px",
				  "font-size":"14px",
				  "border-radius":"10px",
			      "background":"#B2DFEE",
				  "border":"none",
				  "margin-left":"2px"
				  }); 
			  
		  }
		 )
 </script>
 <footer> 
  <div id="dialog" title="请先登录Ting">
	   <p>正在切换登录至Ting帐户...</p>
  </div>
 </footer>
</body>