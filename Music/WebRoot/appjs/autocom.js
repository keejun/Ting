
 $(document).ready(function(){
  $("#submit").button().click(function(){
     //////�Ա�ֵ����jquery�ַ������룬�����ֵò������
	 var search=encodeURIComponent($("#search").val());
	 ////������ֵ�ж�
	 if($("#search").val()=="")
	 {  var data="<br/> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <font color=#FF3030>--����������������--</font>";
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
	 var loadtxt="����Ŭ��Ϊ��������........";
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
	        var searchtips=" <span style='background:#63B8FF;color:white'><b>����Album����:</b> "+$("#search").val()+"</span>";
		    $("#musictips").html(searchtips);
	       $.each(data.musics, function(i,item){
			$('#infos').append((i+1)+".&nbsp"+"<img  src ="+item.image+">");
			$("#infos").append("<br/>");
			$("#infos").append("<b>ר��:</b>"+item.title);
			$("#infos").append("<br/>");
			$("#infos").append("<b>���ֻ���:</b>");
		    for(var j=0;j<item.tags.length;j++){
		    $("#infos").append(" ["+item.tags[j].name+"] ");
			 }
			$("#infos").append("<br/>");
			$("#infos").append("<b>����ʱ��:</b>"+item.attrs.pubdate);
			$("#infos").append("<br/>");
			$("#infos").append("<b>����:</b>"+item.rating.average+",���ڶ�����"+item.rating.numRaters+"��ͶƱ");
		    $("#infos").append("<br/>");
		 	$("#infos").append("<b>����:</b>"+item.attrs.singer); 
			$("#infos").append("<br/>");
			$("#infos").append("<b>ר������:</b>"+item.attrs.tracks);
			$("#infos").append("<br/>");
			$("#infos").append("<b>��Ƭ��˾:</b>"+item.attrs.publisher); 
			 if ( i>4 ){
			    if(i%2!=0){
			      $("#infos").append("<a href='#top' style='float:right;font-size:10px' title='�ص�����'><img src='kuting/top.png' style='width:20px;height:20px'/></a>");
			     }
			 }
           	$("#infos").append("<div><hr/></div>");
        
			 });
		    
	  },
	  error:function(jqXHR, textStatus, errorThrown){
	          var netinfo="hoho!������δ����?!���³���һ��<br/>�ϸ����������ְɣ�";
	         // $("#neterror").css("color:red");
	          document.getElementById("neterror").innerHTML=netinfo;
	        }
	    

	   }); 
	
 }
});
 /*�ڱ���������ѯ����*/
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
	 var loadtxt="����Ŭ��Ϊ��������........";
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
	      var searchtips=" <span style='background:#63B8FF;color:white'><b>����Album����:</b> "+$("#search").val()+"</span>";
		 $("#musictips").html(searchtips);
		  $("#musictips").show();
	     $.each(data.musics, function(i,item){
           $('#info').append((i+1)+".&nbsp"+"<img  src ="+item.image+">");
			$("#info").append("<br/>");
			$("#info").append("<b>ר��:</b>"+item.title);
			$("#info").append("<br/>");
			$("#info").append("<b>���ֻ���:</b>");
		    for(var j=0;j<item.tags.length;j++){
		    $("#info").append(" ["+item.tags[j].name+"] ");
			 }
			$("#info").append("<br/>");
			$("#info").append("<b>����ʱ��:</b>"+item.attrs.pubdate);
			$("#info").append("<br/>");
			$("#info").append("<b>����:</b>"+item.rating.average+",���ڶ�����"+item.rating.numRaters+"��ͶƱ");
		    $("#info").append("<br/>");
		 	$("#info").append("<b>����:</b>"+item.attrs.singer); 
			$("#info").append("<br/>");
			$("#info").append("<b>ר������:</b>"+item.attrs.tracks);
			$("#info").append("<br/>");
			$("#info").append("<b>��Ƭ��˾:</b>"+item.attrs.publisher); 
			 if ( i>4 ){
			    if(i%2!=0){
			      $("#info").append("<a href='#top' style='float:right;font-size:10px' title='�ص�����'><img src='kuting/top.png' style='width:20px;height:20px'/></a>");
			     }
			 }
			$("#info").append("<div><hr/></div>");
            });
	  },
	   error:function(jqXHR, textStatus, errorThrown){
	          var netinfo="hoho!������δ����?!<br/>�ϸ����������ְɣ�";
	          document.getElementById("neterror").innerHTML=netinfo;
	        }
	   }); 
	 }
 	 
     } 
	 )
  






})