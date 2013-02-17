
 $(document).ready(function(){
  $("#submit").button().click(function(){
     //////对表单值进行jquery字符表单编码，否则汉字得不到结果
	 var search=encodeURIComponent($("#search").val());
	 ////对输入值判断
	 if($("#search").val()=="")
	 {  var data="<br/> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <font color=#FF3030>--请您输入搜索条件--</font>";
	    document.getElementById("error").innerHTML=data;
		$("#search").focus();
		$("#neterror").html("");
	         }
	else {
	 var url ="https://api.douban.com/v2/music/search?q="+search;
	 var options = {};
     $("#main").hide('clip',options,500); 
     $("#right").hide();
	 $("#searchafter").show(1000); 
	 var loadtxt="正在努力为您检索中........";
	 document.getElementById("load").innerHTML=loadtxt;
	 $( "#progressbar" ).progressbar({
			value: 100
		});
	 $("#progressbar").show();
     $.ajax({
	   url:url,
	   context:this,
	   dataType:'jsonp',
	   timeout:6000,
	   complete:function(){
	         $("#load").hide();
	         $("#progressbar").hide(); 
		
	          },
	   success:function(data){
	         $("#neterror").html("");
	        var searchtips="<b>音乐Album搜索:</b> "+$("#search").val();
		    $("#musictips").html(searchtips);
	       $.each(data.musics, function(i,item){
		  
			$('#info').append((i+1)+".&nbsp"+"<img  src ="+item.image+">");
			$("#info").append("<br/>");
			$("#info").append("<b>专辑:</b>"+item.title);
			$("#info").append("<br/>");
			$("#info").append("<b>音乐基因:</b>");
		    for(var j=0;j<item.tags.length;j++){
		    $("#info").append(" ["+item.tags[j].name+"] ");
			 }
			$("#info").append("<br/>");
			$("#info").append("<b>发行时间:</b>"+item.attrs.pubdate);
			$("#info").append("<br/>");
			$("#info").append("<b>评分:</b>"+item.rating.average+",基于豆瓣网"+item.rating.numRaters+"人投票");
		    $("#info").append("<br/>");
		 	$("#info").append("<b>歌手:</b>"+item.attrs.singer); 
			$("#info").append("<br/>");
			$("#info").append("<b>专辑歌曲:</b>"+item.attrs.tracks);
			$("#info").append("<br/>");
			$("#info").append("<b>唱片公司:</b>"+item.attrs.publisher); 
			 if ( i>4 ){
			    if(i%2!=0){
			      $("#info").append("<a href='#top' style='float:right;font-size:10px' title='回到顶部'><img src='kuting/top.png' style='width:20px;height:20px'/></a>");
			     }
			 }
           	$("#info").append("<div><hr/></div>");
			
			
			 });
		    
	  },
	  error:function(jqXHR, textStatus, errorThrown){
	          var netinfo="hoho!您可能未联网?!重新尝试一下<br/>上个网享受音乐吧！";
	          document.getElementById("neterror").innerHTML=netinfo;
	        }
	    

	   }); 
	
 }
});
 /*在本机上做查询有用*/
	 /* $(document).ready(function(){
	  var url="https://api.douban.com/v2/music/search?q=%22%E4%B8%80%E5%8D%83%E5%B9%B4%E4%BB%A5%E5%90%8E%22&&count=2";
     $.getJSON(url+"?&alt=xd&callbak=?", function(data){
     $.each(data.musics, function(i,item){
            $("<img/>").attr("src", item.image).appendTo("#image");
            if ( i == 3 ) return false;
            });
            });
     }); */

 $("#topsubmit").button().click(function(){
	 var search=encodeURIComponent($("#aftersearch").val());
	 if(search==""){
	    $("#error2").show();
		$("#musictips").hide();
		$("#aftersearch").focus();
	    $("#neterror").html("");
	      }
	 else{
	  
	 var url ="https://api.douban.com/v2/music/search?q="+search;
	  $("#info").empty();
	 $("#error2").hide();
	 var loadtxt="正在努力为您检索中........";
	 document.getElementById("load").innerHTML=loadtxt;
	 $("#load").show();
	  $( "#progressbar" ).progressbar({
			value: 100
		});
	 $("#progressbar").show();
	
	$.ajax({
	   url:url,
	   context:this,
	   timeout:6000,
	   dataType:'jsonp',
	   complete:function(){$("#load").hide(); $("#progressbar").hide();},
	   success:function(data){
	      $("#neterror").html("");
	     var searchtips="<b>音乐Album搜索:</b> "+$("#aftersearch").val();
		 $("#musictips").html(searchtips);
		  $("#musictips").show();
	     $.each(data.musics, function(i,item){
           $('#info').append((i+1)+".&nbsp"+"<img  src ="+item.image+">");
			$("#info").append("<br/>");
			$("#info").append("<b>专辑:</b>"+item.title);
			$("#info").append("<br/>");
			$("#info").append("<b>音乐基因:</b>");
		    for(var j=0;j<item.tags.length;j++){
		    $("#info").append(" ["+item.tags[j].name+"] ");
			 }
			$("#info").append("<br/>");
			$("#info").append("<b>发行时间:</b>"+item.attrs.pubdate);
			$("#info").append("<br/>");
			$("#info").append("<b>评分:</b>"+item.rating.average+",基于豆瓣网"+item.rating.numRaters+"人投票");
		    $("#info").append("<br/>");
		 	$("#info").append("<b>歌手:</b>"+item.attrs.singer); 
			$("#info").append("<br/>");
			$("#info").append("<b>专辑歌曲:</b>"+item.attrs.tracks);
			$("#info").append("<br/>");
			$("#info").append("<b>唱片公司:</b>"+item.attrs.publisher); 
			 if ( i>4 ){
			    if(i%2!=0){
			      $("#info").append("<a href='#top' style='float:right;font-size:10px' title='回到顶部'><img src='kuting/top.png' style='width:20px;height:20px'/></a>");
			     }
			 }
			$("#info").append("<div><hr/></div>");
            });
	  },
	   error:function(jqXHR, textStatus, errorThrown){
	          var netinfo="hoho!您可能未联网?!<br/>上个网享受音乐吧！";
	          document.getElementById("neterror").innerHTML=netinfo;
	        }
	   }); 
	 }
 	 
     } 
	 )
  






})