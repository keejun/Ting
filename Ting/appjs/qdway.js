var move={
	//模拟window.onload,可重复调用
	load:function(func){
			var oLoad=window.onload;
			if(typeof window.onload!='function'){window.onload=func;}
			else{window.onload=function(){oLoad();func();};}
	},
	//document.getElementById()的缩写
	_$:function(){
			var elements=new Array();
			for(var i=0;i<arguments.length;i++)
			{
				var element=arguments[i];
				if(typeof element=="string")
				{
					element=document.getElementById(element);
				}
				if(arguments.length==1)return element;
				elements.push(element);
			}
			return elements;
	},
	//document.getElementsByTagName()
	getTagName:function(tagName,elem){
			if(!document.getElementsByTagName) return false;
			return (elem||document).getElementsByTagName(name);
	},
	//获取下一个节点
	nextElem:function(node){
			var x=node.nextSibling;
			while (x.nodeType!=1)
			{
				x=x.nextSibling;
			}
			return x;
	},
	//获取上一个节点
	prevElem:function(node){
			var x=node.previousSibling;
			while (x.nodeType!=1)
			{
				x=x.previousSibling;
			}
			return x;
	},
	//为元素增加className
	addClass:function(elem,value){
			if(!elem.className)
			{
				elem.className=value;
			}
			else
			{
				var oValue=elem.className;
				oValue +=" ";
				oValue +=value;
				elem.className=oValue;
			}
	},
	//为元素删除className
	removeClass:function(element, className){
			if (hasClass(element, className)) {
				var reg = new RegExp('(\\s|^)' + className + '(\\s|$)');
				element.className = element.className.replace(reg, ' ');
			}
	},
	startMove:function(obj,attrs,fnCallBack,Index,fnIn,divNum){
			if(fnIn=="in"){obj.style.zIndex=Index-divNum;}
			if(obj.timer)clearInterval(obj.timer);
			obj.timer=setInterval(function (){
				move.doMove(obj, attrs, fnCallBack,fnIn);
			}, 30);
		},
	//运动函数
	doMove:function(obj,attrs,fnCallBack,fnIn){
			var now=0;
			var iSpeed=0;
			var attr='';
			var bStop=true;	//这一次运动就是最后一次
			for(attr in attrs)
			{
				if(attr=='opacity')
				{
					now=parseInt(parseFloat(move.getStyle(obj, attr))*100);
				}
				else
				{
					now=parseInt(move.getStyle(obj, attr));
				}
				if(now!=attrs[attr])
				{
					bStop=false;
				}
				iSpeed=(attrs[attr]-now)/3;
				iSpeed=iSpeed>0?Math.ceil(iSpeed):Math.floor(iSpeed);
				if(attr=='opacity')
				{
					obj.style.filter="alpha(opacity:"+(now+iSpeed)+")";
					obj.style.opacity=(now+iSpeed)/100;
				}
				else
				{
					obj.style[attr]=now+iSpeed+'px';
				}
			}
			if(bStop)
			{
				clearInterval(obj.timer);
				obj.timer=null;
				if(fnCallBack)fnCallBack();
			}
		},
	//获取元素的样式值
	getStyle:function(obj, attr){
			return obj.currentStyle?obj.currentStyle[attr]:document.defaultView.getComputedStyle(obj, false)[attr];
		},
	//动态加载js
	loadJS:function(url,load){
			var _script = document.createElement('script');
			_script.setAttribute('type','text/javascript');
			_script.setAttribute('src',url);
			document.getElementsByTagName('head')[0].appendChild(_script);
			if(!load)	return;
			if(document.all){
				_script.onreadystatechange = function(){
					if (this.readyState=='loaded' || this.readyState=='complete')
					{
						load();
					}
				};
			}else{
				_script.onload = function(){
					load();
				};
			}
		}
}


