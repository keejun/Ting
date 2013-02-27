//=====google===================================
function search(value) {
  var search = "&query=" + value;
  var fullUri = serviceURI + AppId + search;
  var head = document.getElementsByTagName('head');
  var script = document.createElement('script');            
  script.type = "text/javascript";
  script.src = fullUri;
	head[0].appendChild(script);
}
function searchDone(results) {
   var result = null;
   var parent = document.getElementById('searchcontrol');
   parent.innerHTML = '';
   var child = null;
   var num = results.SearchResponse.Image.Results.length;
   num>8?num=8:num;
   for (var i = 0; i < num; i++) {
       result = results.SearchResponse.Image.Results[i];
       child = document.createElement('li');
       child.className =  "resultlistitem";
       child.innerHTML = '<a href="' + result.Url +'" target="_blank"><img src="' + result.Thumbnail.Url +'" alt="' + result.Title +'" /></a>';
       parent.appendChild(child);
   }
}
var AppId = "&Appid=061EF671815839355066C2165114F5564FB38094";
var serviceURI = "http://api.search.live.net/json.aspx?JsonType=callback&JsonCallback=searchDone&sources=image";
//===Zplayer===========================================
_Zplayer={};
_Zplayer.nowPlay;
_Zplayer.mTyle=[];
_Zplayer.mode = 0;
_Zplayer.addList = function(player,playListUl,playListloop,songInfoName,knowMore){
	var DOM = KISSY.DOM,
	Event = KISSY.Event;
	var node;
	node = DOM.create('<li>'+playListloop.songName+'<i>&nbsp&nbspx</i></li>');
	node.songName = playListloop.songName;
	node.songSize = playListloop.songSize;
	node.songType = playListloop.songType;
	node.songUrl  = playListloop.songUrl;
	Event.on(node,'dblclick',function(){
		_Zplayer.nowPlay = this;
		DOM.addClass(_Zplayer.nowPlay,'now-play');
		DOM.removeClass(DOM.siblings(_Zplayer.nowPlay),'now-play');
		_Zplayer.songChange(_Zplayer.nowPlay,songInfoName,knowMore);
		player.src = this.songUrl;
		player.play();
	})
	Event.on(DOM.children(node,'i')[0],'click',function(){
		DOM.remove(node);
	})
	DOM.append(node,playListUl);
	//====dragAni=========================================================
	var flag = false;
	var dragNode = DOM.create('<b id="drag-node">'+node.songName+'</b>');
	var _offset = {left:0,top:0};
	var timer;
	Event.on(node,'mousedown',function(e){
		timer = setTimeout(function(){
			flag = true;
			DOM.append(dragNode,playListUl);
			DOM.offset(dragNode,DOM.offset(node));
			_offset.top = e.clientY - DOM.offset(node).top;
		},200);	
	})
	Event.on(document,'mousemove',function(e){
		if(flag){
			DOM.offset(dragNode,{
				left: this.left,
				top : e.clientY - _offset.top
			})
		}
	})
	Event.on(document,'mouseup',function(e){
		clearTimeout(timer);
		if(flag){
			var thisTop = DOM.offset(dragNode).top;
			var liSiblings = DOM.siblings(dragNode,'li');
			for(var i=0;i<liSiblings.length;i++){
				if(DOM.offset(liSiblings[i]).top > thisTop) break;
			}
			if(i<liSiblings.length){
				DOM.insertBefore(node,liSiblings[i]);
				DOM.remove(dragNode);
			}
			else{
				DOM.append(node,playListUl);
				DOM.remove(dragNode);
			}
		}
		flag = false;
	})
}
_Zplayer.songChange = function(Newsong,songName,knowMore){
	songName.innerHTML = knowMore.innerHTML = Newsong.songName;
	KISSY.DOM.attr(knowMore,'href','http://www.google.com/search?q='+Newsong.songName);
	search(Newsong.songName);
}
//======document ready==================================================
KISSY.ready(function(S){
	var DOM = S.DOM,
		Event = S.Event;
	//======UA==============================================================
	//switch(S.UA.shell){
	//	case 'chrome' : _Zplayer.mTyle = /.mp3$/;break;
	//	case 'firefox': _Zplayer.mTyle = /.ogg$/;break;
	//	default: DOM.append(DOM.create('<div id="no-sup"></div>'),'body');
	//}
	(function(){
		var audio = document.createElement('audio');
		if((!S.isFunction(audio.canPlayType))||(!FileReader)) DOM.append(DOM.create('<div id="no-sup"></div>'),'body');
		else{
			!!audio.canPlayType('audio/mpeg;').replace(/no/, '')?_Zplayer.mTyle.push('audio/mpeg'):0;
			!!audio.canPlayType('audio/mp3;').replace(/no/, '')?_Zplayer.mTyle.push('audio/mp3'):0;
			!!audio.canPlayType('audio/wav;').replace(/no/, '')?_Zplayer.mTyle.push('audio/wav'):0;
			!!audio.canPlayType('audio/mp4;').replace(/no/, '')?_Zplayer.mTyle.push('audio/mp4'):0;
			!!audio.canPlayType('audio/ogg;').replace(/no/, '')?_Zplayer.mTyle.push('audio/ogg'):0;
			!!audio.canPlayType('video/ogg;').replace(/no/, '')?_Zplayer.mTyle.push('video/ogg'):0;
			!!audio.canPlayType('audio/x-m4a;').replace(/no/, '')?_Zplayer.mTyle.push('audio/x-m4a'):0;
			!!audio.canPlayType('application/ogg;').replace(/no/, '')?_Zplayer.mTyle.push('application/ogg'):0;
		}
	})();
	//====================================================================
	var upLoad = DOM.get('#file-up-load');
	var playListUl = DOM.get('#play-list');
	var player = DOM.get('audio');
	player.volume = 1;
	var outBox = DOM.get('#out-box');
	var showListBtn = DOM.get('#show-list');
	var rangeTimer = DOM.get('#range-timer');
	var songInfoName = DOM.get('#song-info h1');
	var knowMore = DOM.get('#know-more');
	var cover = DOM.get('#cover');
	var firstBox = DOM.get('#first-box');
	var changeBg = DOM.get('#change-bg-file');
	//======bgChange======================================================
	Event.on(changeBg,'change',function(e){
		var reader = new FileReader();
		thisfile = this.files[0];
		reader.onload = (function(thisfile){
			return function(e){
					DOM.css(outBox,'background-image','url('+e.target.result+')');
			}
		})(thisfile);
		reader.readAsDataURL(thisfile);
	})
	//======upLoadEvent===================================================
	Event.on(upLoad,'change',function(){
			DOM.addClass(this,'file-up-load-2');
			cover.style.display = firstBox.style.display = 'none';
			for(var i=0;i<this.files.length;i++){
				var thisfile = this.files[i];
				//if(!_Zplayer.mTyle.test(thisfile.name)) continue;
				if(!S.inArray(thisfile.type,_Zplayer.mTyle)) continue;
				var reader = new FileReader();
				reader.onload = (function(thisfile){
					return function(e){
						_Zplayer.addList(player,playListUl,{
							songName : thisfile.name.replace(_Zplayer.mTyle,''),
							songSize : thisfile.size,
							songType : thisfile.type,
							songUrl  : e.target.result
						},songInfoName,knowMore);					
					}
				})(thisfile);
				reader.readAsDataURL(thisfile);
			}
		if(!_Zplayer.nowPlay){
			var Stimer = setInterval(function(){//给点缓冲时间哈。。。
				_Zplayer.nowPlay = DOM.children(playListUl,'li')[0];
				if(_Zplayer.nowPlay){
					DOM.addClass(_Zplayer.nowPlay,'now-play');
					DOM.removeClass(DOM.siblings(_Zplayer.nowPlay),'now-play');
					player.src = _Zplayer.nowPlay.songUrl;
					
					_Zplayer.songChange(_Zplayer.nowPlay,songInfoName,knowMore);
					player.play();
					clearInterval(Stimer);
				}			
			},1000)
		}
	})
	Event.on(document,'dragenter',function(e){
		e.stopPropagation(); 
		e.preventDefault();
	})
	Event.on(document,'dragover',function(e){
		e.stopPropagation(); 
		e.preventDefault();
	})
	document.addEventListener("drop",function(e){//kissy吧event obj 封装掉了，用kissy的Event.on(drop)是找不到e.dataTransfer的 = =||||
		e.stopPropagation(); 
		e.preventDefault();
		var dt = e.dataTransfer; 
		var files = dt.files;
		DOM.addClass(upLoad,'file-up-load-2');
		cover.style.display = firstBox.style.display = 'none';
		for(var i=0;i<files.length;i++){
				var thisfile = files[i];
				if(!S.inArray(thisfile.type,_Zplayer.mTyle)) continue;
				var reader = new FileReader();
				reader.onload = (function(thisfile){
					return function(e){
						_Zplayer.addList(player,playListUl,{
							songName : thisfile.name.replace(_Zplayer.mTyle,''),
							songSize : thisfile.size,
							songType : thisfile.type,
							songUrl  : e.target.result
						},songInfoName,knowMore);					
					}
				})(thisfile);
				reader.readAsDataURL(thisfile);
			}
		if(!_Zplayer.nowPlay){
			var Stimer = setInterval(function(){//给点缓冲时间哈。。。
				_Zplayer.nowPlay = DOM.children(playListUl,'li')[0];
				if(_Zplayer.nowPlay){
					DOM.addClass(_Zplayer.nowPlay,'now-play');
					DOM.removeClass(DOM.siblings(_Zplayer.nowPlay),'now-play');
					player.src = _Zplayer.nowPlay.songUrl;
					//songInfoName.innerHTML = _Zplayer.nowPlay.songName;
					_Zplayer.songChange(_Zplayer.nowPlay,songInfoName,knowMore);
					player.play();
					clearInterval(Stimer);
				}			
			},1000)
		}
	},false)
	//=====listAni========================================================
	Event.on(showListBtn,'click',function(){
		DOM.css(playListUl,'display') == 'none' ? playListUl.style.display='block' : playListUl.style.display='none';
	})
	//===playBoxControl===================================================
	var playerboxPlay = DOM.get('#playerbox-play');
	var range = DOM.get('#range');
	var playerboxMode1 = DOM.get('#playerbox-mode-1');
	var playerboxModeInorder = DOM.get('#playerbox-mode-inorder');
	var playerboxModeOutorder = DOM.get('#playerbox-mode-outorder');
	Event.on(playerboxPlay,'click',function(){
		if(!player.currentTime){
			_Zplayer.nowPlay = DOM.children(playListUl,'li')[0];
			player.src = _Zplayer.nowPlay.songUrl;
			_Zplayer.songChange(_Zplayer.nowPlay,songInfoName,knowMore);
			DOM.addClass(_Zplayer.nowPlay,'now-play');
			DOM.removeClass(DOM.siblings(_Zplayer.nowPlay),'now-play');
			player.play();
		}else 
			if(player.paused){
				player.play();
			}else{
				player.pause();
			}		
	})
	Event.on(range,'click',function(e){
		if(player.currentTime){
			rangeTimer.style.width = e.offsetX+'px';
			player.currentTime = e.offsetX*player.duration/DOM.width(range);
		}
	})
	Event.on(playerboxMode1,'click',function(){
		_Zplayer.mode = 1;
		DOM.removeClass('.mode','smode')
		DOM.addClass(this,'smode');
	})
	Event.on(playerboxModeInorder,'click',function(){
		_Zplayer.mode = 0;
		DOM.removeClass('.mode','smode')
		DOM.addClass(this,'smode');
	})
	Event.on(playerboxModeOutorder,'click',function(){
		_Zplayer.mode = 2;
		DOM.removeClass('.mode','smode')
		DOM.addClass(this,'smode');
	})
	//===play setInterval=================================================
	var timer = setInterval(function(){
		if(player.currentTime==0||player.paused||player.ended){
			DOM.removeClass(playerboxPlay,'playerbox-play-isplay-true');
			DOM.addClass(playerboxPlay,'playerbox-play-isplay-false');
		}else{
			DOM.removeClass(playerboxPlay,'playerbox-play-isplay-false');
			DOM.addClass(playerboxPlay,'playerbox-play-isplay-true');
		}
		if(player.ended){
			switch(_Zplayer.mode){
				case 0 :_Zplayer.nowPlay = (DOM.next(_Zplayer.nowPlay,'li') == null ? DOM.siblings(_Zplayer.nowPlay,'li')[0] : DOM.next(_Zplayer.nowPlay,'li'));break;
				case 1 :break;
				case 2 :_Zplayer.nowPlay = DOM.siblings(_Zplayer.nowPlay,'li').sort(function(){return Math.random()>0.5? -1 : 1})[0];
			}
			player.src = _Zplayer.nowPlay.songUrl;
			_Zplayer.songChange(_Zplayer.nowPlay,songInfoName,knowMore);
			DOM.addClass(_Zplayer.nowPlay,'now-play');
			DOM.removeClass(DOM.siblings(_Zplayer.nowPlay),'now-play');
			player.play();
		}
		rangeTimer.style.width = player.currentTime * DOM.width(range)/player.duration+'px';
	},1000);
	
})//===document ready over================================================