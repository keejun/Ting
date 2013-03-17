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
<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
<link href='http://fonts.googleapis.com/css?family=The+Girl+Next+Door' rel='stylesheet' type='text/css'>
<link href="css/redmond/jquery-ui-1.9.2.custom.css" rel="stylesheet">
<script src="js/jquery-ui-1.9.2.custom.js"></script>
<script src="js/jquery.jrumble.1.3.min.js"></script>
<script type="text/javascript" src="appjs/header.js" ></script>
<script type="text/javascript" src="js/jquery.sticky.js" ></script>
<script type="text/javascript" src="js/realshadow.js" ></script>
<script type="text/javascript"src="appjs/chinesedata.js" charset="gb2312"></script>
<script type="text/javascript"src="appjs/autocom.js" charset="gb2312"></script>
<script src="js/jquery.scrollUp.min.js" type="text/javascript" charset="gb2312" ></script>
<link rel="stylesheet" href="kuting/main.css" />
<link rel="stylesheet" href="kuting/searchtip.css"/>
<link rel="stylesheet" href="kuting/search.css"/>
<link rel="stylesheet" href="kuting/object.css"/>
<link rel="stylesheet" href="kuting/named.css"/>
<link rel="stylesheet" href="kuting/hr.css"/>
<title>Ting::发现您喜欢的音乐</title>
<script>
$(function () {
	$.scrollUp();
	$("#submit").realshadow({
		pageY: 190
	});
});
</script>
<script>
#right{
  float:right;
  font-family:Microsoft YaHei;
  padding:4px;
 }
hr{
	border:none;
	border-top:1px solid red;
	height:0;
}
 </script>
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
<% if(user==null) { %>
<div id="right"><a href="signup.jsp" class="named">Ting帐户</a></div>
<% }  else { %>
<div id="right"><a href="signup.jsp" style="font-size:14px;float:right" class="named"> <%=user.getName() %></a></div>
<% } %>
<div id="searchafter">
<div id="right"><button id="topsubmit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">搜索一下</button></div>
<div id="right"><input type="text" name="aftersearch" placeholder="搜索您想欣赏的音乐或艺术家" id="aftersearch" autocomplete="on" title="搜索音乐或艺术家/enter->"/></div>
</div>
</div>
</header>
<div id="headerlow"></div>
<body>
<span id="error2" style="display:none">--请您输入搜索条件--</span>
<span id="neterror"></span>
<span id="musictips"></span>
<div id="main">
  <div id="artpic">
		   <ul>
		     <li>&nbsp <img src="listimage/m2.ico" style="height:60px;width:60px"/></li> 
		     <li><p id="biaoti"> &nbsp  <b>Ting搜索 <sub style="font-size:12px">--音乐Album</sub></b></p></li> <br/>
		   </ul>
  </div><br/>
 <div id="searchplace">
          <ul>
		     <li><a href="#">歌手</a> &nbsp &nbsp &nbsp </li> 
			 <li><a href="#">地区</a> &nbsp &nbsp &nbsp </li>
			 <li><a href="#">风格</a> &nbsp &nbsp &nbsp </li>
			 <li><a href="tingfm.jsp">随心听</a></li>
           </ul>	
  <input type="text" name="search" placeholder="搜索您想欣赏的音乐或艺术家" id="search" autocomplete="on" title="搜索音乐或艺术家" />
  <button id="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only"><span class="ui-button-text">搜索一下</span></button>
  <span id="error"></span>
  <!-- JiaThis Button BEGIN -->
<div class="jiathis_style">
	<span class="jiathis_txt">分享到：</span>
	<a class="jiathis_button_tsina">新浪微博</a>
	<a class="jiathis_button_renren">人人网</a>
	<a class="jiathis_button_douban">豆瓣</a>
	<a class="jiathis_button_kaixin001">开心网</a>
	<a class="jiathis_button_gmail">Gmail</a>
</div>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1351688919812642" charset="utf-8"></script>
<!-- JiaThis Button END -->
</div>
<div id="tingfm" style="float:right;display:none"><a href="tingfm.jsp"><img src="images/tingfm.png" title="点我:快速听歌.." style="width:80px;height:100px"/></a></div>
</div>
<div id="display">
<div id="info"  style="background:#FFE7BA" >
<div id="infos"></div>
</div>
</div>
<div id="content" style="display:none">对不起，暂无记录！</div>
<div id="progressbar" class="ui-progressbar-value" style="display:none;"></div>
<span id="load" style="left:30%; font-size:40px; position: absolute; top:38%;">
</span>
<footer>
<div id="dialog">
<p>Ting是一个基于音乐api的音乐搜索web2.0网站</p>
<p>您可以联系keejunliu@gmail.com</p>
<p>当前日期：
 <div id="datepicker" class="datapicker"></div>	
</p>
</div>
<script type="text/javascript">
$("#submit").jrumble({
	x: 3,
	y: 0,
	rotation:2
	});
$("#submit").hover(function(){
	$(this).trigger('startRumble');
	}, function(){
	$(this).trigger('stopRumble');
	});	
</script>
 <script>
    $(window).load(function(){
      $("#searchafter").sticky({ topSpacing:1 });
       window.setTimeout(changeme,1000);
       function changeme(){
    	 $("#tingfm").fadeIn();  
       }
    });
  </script>
</footer>
</body>
</html>