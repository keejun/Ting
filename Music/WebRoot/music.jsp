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
<script type="text/javascript"src="appjs/chinesedata.js" charset="gb2312"></script>
<script type="text/javascript"src="appjs/music.js" charset="utf-8"></script>
<script type="text/javascript" src="appjs/musicsearch.js" ></script>
<script type="text/javascript" src="js/jquery.fbmodel.js" ></script>
<link rel="stylesheet" href="kuting/main.css" />
<link rel="stylesheet" href="kuting/music.css" />
<link rel="stylesheet" href="kuting/musica.css" />
<link rel="stylesheet" href="kuting/musicd.css" />
<link rel="stylesheet" href="kuting/search.css"/>
<link rel="stylesheet" href="kuting/named.css"/>
<link rel="stylesheet" href="kuting/fbmodal.css"/>
<title>Ting::发现您喜欢的音乐</title>
</head>
<header>
<div id="headerline"></div>
<div id="header">
<div id="i"><a href="index.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">专辑</button></a></div>
<div id="i"><a href="#"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">play</button></a></div>
<div id="i"><a href="tingfm.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">电台</button></a></div>
<div id="i"><a href="group.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">小组</button></a></div>
<% if(user!=null){%>
<div id="i"><a href="<%=basePath%>displaylove?name=<%=user.getName()%>"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">收藏</button></a></div>
<%} else {%>
<div id="i"><a href="collection.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">收藏</button></a></div>
<%}%>
<div id="i"><a href="player.jsp"><button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">听见</button></a></div>
<div id="i"><button id="opener" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-button-text">关于Ting</button></div>
<% if(user==null) { %>
<div id="right"><a href="signup.jsp" class="named">登录</a></div>
<% }  else { %>
<div id="right"><a href="signup.jsp" style="font-size:14px;float:right" class="named"><%=user.getName() %></a></div>
<% } %>
</header>
<div id="headerlow"></div>
<body onload="document.search_form.search_input.focus();">
<div id="insert">
</div> 
<div id="main" style="border-right:1px solid red">
<div id="artmusics">
        <ul>
		     <li>&nbsp <img src="listimage/m2.ico" style="height:60px;width:60px"/></li> 
		     <li><p id="biaoti"> &nbsp  Ting搜索 <sub style="font-size:12px">--音乐play</sub></p></li> <br/><br/>
		   </ul>
</div>
<div id="searchplaces" >
      
        <div id="WER">
        <form name="search_form" onsubmit="return false;" action="#">
		<div class="tabs"></div>
        <div class="panel_wrapper"><br/>
		<p id="search_zt"></p>
		<input id="search_input" name="" type="text" title="搜索您喜欢的歌曲或艺术家" value="搜索您喜欢的歌曲或艺术家" onblur="if(!trim(this.value)) this.value = this.title;" onclick="if(this.value == this.title) this.value = '';" onkeypress="search_input_onkeypress(event);" onkeydown="search_bt_onclick();"  x-webkit-speech lang="zh-CN" x-webkit-grammar="bUIltin:search"/>
                    <div id="search_result" align="center">
					<ul class="music_list" id="music_list"></ul>  <!-- 显示搜索列表 -->
					<div id="self_set_pager_ui"></div>  <!-- 翻页显示行 -->
			       	</div>
         </div>
        </form>
	 </div>
	 
</div>
<div id="msg"></div>
</div>
</body>
<footer>
<div id="dialog">
<p>Ting是一个基于音乐api的音乐搜索web2.0网站</p>
<p>您可以联系keejunliu@gmail.com</p>
<p>当前日期：
 <div id="datepicker" class="datapicker"></div>	
</p>
</div>
<script  type="text/javascript" >
   var songcount=1;
   var count=1;
  // var flag=0;
   var musicname=null;
   var musicid=null;
   var ii=null;
	var j=1;
 function myrefresh() 
            { 
              window.location.reload(); 
            } 
 function del(){
	  
	    count--;
      }
$(".music_list li").live('click',function(){
	//////
    
	//////
    if(count>8){
	       $("#msg").html("<b> &nbsp tips:一次只能添加8首歌噢！<a href='javascript:myrefresh()'>刷新</a></b>");
	      
	   }
	else{
	////
		 musicname=$(this).attr("name");
		 musicid=$(this).attr("id");
	
    ii="muid"+j;
    var youl = '<div id="song"><p style=" clear:both;float:left">'+songcount+"."+$(this).attr("name")+'</p> &nbsp <embed src="http://www.xiami.com/widget/470304_' +  $(this).attr("id") + '/singlePlayer.swf" type="application/x-shockwave-flash" width="257" height="33" volume="30" style="margin-top:13px" wmode="transparent"></embed><a title="标为喜欢？" href="javascript:lovemusic(musicname,musicid)"  id="'+ii+'" value="0"> <img src="kuting/dislove.ico"/></a> <a href="javascript:del()" onclick="$(this).parent().remove()" title="删除"> x</a><br/></div>';
	songcount++;
	count++;
	j++;
	$("#insert").append(youl);
	}	
});
             function lovemusic(musicname,musicid){
			  <% if (session.getAttribute("user")!=null) { %>
			  $("#"+ii).unbind('click');
			  $("#"+ii).click( function(){
                  if($(this).val()==0){
			        
				     var name="<%=user.getName()%>";
				     var url="<%=basePath%>addlove";
				   $.ajax({
			           type: "post",
			           url: url,
			           data:{ "name":name,"musicname":musicname,"musicid":musicid },  
			           dataType: "text",
			           success: function(){
			        	      // alert("喜欢");
			            	  }
			               });
				   $(this).children("img").attr("src","kuting/love.ico"); 
			       $(this).attr("title","已喜欢");
			       $(this).val(1);
				   //$(this).unbind('click');
				     }
				  else{
					    
					 var name="<%=user.getName()%>";
					 var url="<%=basePath%>deletelove";
				     $.ajax({
				           type: "post",
				           url: url,
				           data:{ "name":name,"musicid":musicid}, 
				           dataType: "text",
				           success: function(){
				        	     // alert("删除");
				               }
				            });
				     $(this).children("img").attr("src","kuting/dislove.ico"); 
				     $(this).attr("title","标为喜欢？");
				     $(this).val(0);
				    // $(this).unbind('click');
				        }
                    
			       });
			
			    <% }  else {%> 
			    $("#"+ii).live("click", function(){
			    	 $("#msg").fbmodal({
				            title: "请您先登录Ting",  
				           cancel: "收藏须登录",
				             okay: "切换登录ing",
				       okaybutton: true,
				     cancelbutton: true,
				          buttons: true,
				          opacity: 0.35,
				          fadeout: true,
				     overlayclose: false,
				         modaltop: "30%",
				       modalwidth: "250" 
				        }); 
			          window.setTimeout(change,3000);
			              function change(){
			    	        window.location.href="signup.jsp" ;
			               }
			           }
			        );
			    <%}%> 
			};
</script>
</footer>
</html>
