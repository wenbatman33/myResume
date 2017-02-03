/*!
 * VERSION: beta 1.24
 * DATE: 2012-05-17
 * JavaScript 
 * UPDATES AND DOCS AT: http://www.greensock.com
 *
 * Copyright (c) 2008-2012, GreenSock. All rights reserved. 
 * This work is subject to the terms in http://www.greensock.com/terms_of_use.html or for 
 * corporate Club GreenSock members, the software agreement that was issued with the corporate 
 * membership.
 * 
 * @author: Jack Doyle, jack@greensock.com
 */
(window._gsQueue||(window._gsQueue=[])).push(function(){_gsDefine("plugins.CSSPlugin",["plugins.TweenPlugin","TweenLite"],function(x){var n=function(){x.call(this,"css");this._overwriteProps.pop()},o=n.prototype=new x("css");o.constructor=n;n.API=2;n.suffixMap={top:"px",right:"px",bottom:"px",left:"px",width:"px",height:"px",fontSize:"px",padding:"px",margin:"px"};var u=/[^\d\-\.]/g,D=/(\d|\-|\+|=|#|\.)*/g,P=/\d+/g,E=/opacity=([^)]*)/,Q=/opacity:([^;]*)/,R=/([A-Z])/g,H=/-([a-z])/gi,I=function(b,a){return a.toUpperCase()}, S=/(Left|Right|width|Width)/,T=/(M11|M12|M21|M22)=[\d\-\.e]+/gi,U=/progid\:DXImageTransform\.Microsoft\.Matrix\(.+?\)/i,v=Math.PI/180,J=180/Math.PI,r=document.createElement("div"),y=function(){var b=document.createElement("div"),a;b.innerHTML="<a style='top:1px;opacity:.55;'>a</a>";return!(a=b.getElementsByTagName("a")[0])?!1:/^0.55/.test(a.style.opacity)}(),K=function(b){return!b||""===b?z.black:z[b]?z[b]:"#"===b.charAt(0)?(4===b.length&&(b="#"+b.charAt(1)+b.charAt(1)+b.charAt(2)+b.charAt(2)+b.charAt(3)+ b.charAt(3)),b=parseInt(b.substr(1),16),[b>>16,b>>8&255,b&255]):b.match(P)||z.transparent},L=function(b){return E.test("string"===typeof b?b:(b.currentStyle?b.currentStyle.filter:b.style.filter)||"")?parseFloat(RegExp.$1)/100:1},w=document.defaultView?document.defaultView.getComputedStyle:function(){},s=function(b,a,c,e){return!y&&"opacity"===a?L(b):!e&&b.style[a]?b.style[a]:(c=c||w(b,null))?(b=c.getPropertyValue(a.replace(R,"-$1").toLowerCase()))||c.length?b:c[a]:b.currentStyle?b.currentStyle[a]: null},A=function(b,a){var c={},e;if(a=a||w(b,null))if(e=a.length)for(;-1<--e;)c[a[e].replace(H,I)]=a.getPropertyValue(a[e]);else for(e in a)c[e]=a[e];else if(a=b.currentStyle||b.style)for(e in a)c[e.replace(H,I)]=a[e];y||(c.opacity=L(b));e=F(b,a,!1);c.rotation=e.rotation*J;c.skewX=e.skewX*J;c.scaleX=e.scaleX;c.scaleY=e.scaleY;c.x=e.x;c.y=e.y;null!=c.filters&&delete c.filters;return c},M=function(b,a,c,e){var i={},d,g;for(g in a)if("cssText"!==g&&"length"!==g&&isNaN(g)&&d!==m&&b[g]!=(d=a[g]))if("number"=== typeof d||"string"===typeof d)i[g]=d,e&&e.props.push(g);if(c)for(g in c)"className"!==g&&(i[g]=c[g]);return i},N={scaleX:1,scaleY:1,x:1,y:1,rotation:1,shortRotation:1,skewX:1,skewY:1,scale:1},O,m=function(){for(var b=document.body||document.documentElement,a=w(b,""),c="O -o- Moz -moz- ms -ms- Webkit -webkit-".split(" "),e=9;-1<(e-=2)&&!s(b,c[e]+"transform",a););return 0<e?(O=c[e]+"transform",c[e-1]+"Transform"):null}(),F=function(b,a,c){var e;m?e=s(b,O,a,!0):b.currentStyle&&(e=(e=b.currentStyle.filter.match(T))&& 4===e.length?e[0].substr(4)+","+Number(e[2].substr(4))+","+Number(e[1].substr(4))+","+e[3].substr(4)+",0,0":null);var a=(e||"").replace(/[^\d\-\.e,]/g,"").split(","),i=(e=6<=a.length)?Number(a[0]):1,d=e?Number(a[1]):0,g=e?Number(a[2]):0,f=e?Number(a[3]):1,h=c?b._gsTransform||{skewY:0}:{skewY:0},k=0>h.scaleX;h.x=e?Number(a[4]):0;h.y=e?Number(a[5]):0;h.rotation=Math.atan2(d,i);h.scaleX=Math.sqrt(i*i+d*d);h.scaleY=Math.sqrt(f*f+g*g);h.skewX=Math.atan2(g,f)+h.rotation;if(0>i&&0<=f||0<i&&0>=f)k?(h.scaleX*= -1,h.skewX+=0>=h.rotation?Math.PI:-Math.PI,h.rotation+=0>=h.rotation?Math.PI:-Math.PI):(h.scaleY*=-1,h.skewX+=0>=h.skewX?Math.PI:-Math.PI);1.0E-8>h.rotation&&-1.0E-8<h.rotation&&(h.rotation=0);1.0E-8>h.skewX&&-1.0E-8<h.skewX&&(h.skewX=0);c&&(b._gsTransform=h);return h},V={width:["Left","Right"],height:["Top","Bottom"]},W=["marginLeft","marginRight","marginTop","marginBottom"],t=function(b,a,c,e,i){if("px"===e)return c;if("auto"===e)return 0;var d=S.test(a),g=b;r.style.cssText="border-style:solid; border-width:0; position:absolute; line-height:0;"; "%"===e||"em"===e?(g=b.parentNode||document.body,r.style[d?"width":"height"]=c+e):r.style[d?"borderLeftWidth":"borderTopWidth"]=c+e;g.appendChild(r);d=parseFloat(r[d?"offsetWidth":"offsetHeight"]);g.removeChild(r);0===d&&!i&&(d=t(b,a,c,e,!0));return d},G=function(b,a){if(null==b||""===b||"auto"===b)b="0 0";var a=a||{},c=-1!==b.indexOf("left")?"0%":-1!==b.indexOf("right")?"100%":b.split(" ")[0],e=-1!==b.indexOf("top")?"0%":-1!==b.indexOf("bottom")?"100%":b.split(" ")[1];null==e?e="0":"center"===e&& (e="50%");"center"===c&&(c="50%");a.oxp=-1!==c.indexOf("%");a.oyp=-1!==e.indexOf("%");a.oxr="="===c.charAt(1);a.oyr="="===e.charAt(1);a.ox=parseFloat(c.replace(u,""));a.oy=parseFloat(e.replace(u,""));return a},B=function(b,a){return null==b?a:"string"===typeof b&&1===b.indexOf("=")?Number(b.split("=").join(""))+a:Number(b)},C=function(b,a){var c=-1===b.indexOf("rad")?v:1,e=1===b.indexOf("="),b=Number(b.replace(u,""))*c;return e?b+a:b},z={aqua:[0,255,255],lime:[0,255,0],silver:[192,192,192],black:[0, 0,0],maroon:[128,0,0],teal:[0,128,128],blue:[0,0,255],navy:[0,0,128],white:[255,255,255],fuchsia:[255,0,255],olive:[128,128,0],yellow:[255,255,0],orange:[255,165,0],gray:[128,128,128],purple:[128,0,128],green:[0,128,0],red:[255,0,0],pink:[255,192,203],cyan:[0,255,255],transparent:[255,255,255,0]};o._onInitTween=function(b,a,c){if(!b.nodeType)return!1;this._target=b;this._tween=c;this._classData=this._transform=null;var c=this._style=b.style,e=w(b,""),i,d;"string"===typeof a?(i=c.cssText,d=A(b,e), c.cssText=i+";"+a,d=M(d,A(b)),!y&&Q.test(a)&&(val.opacity=parseFloat(RegExp.$1)),a=d,c.cssText=i):a.className&&(i=b.className,d=A(b,e),b.className="="!==a.className.charAt(1)?a.className:"+"===a.className.charAt(0)?b.className+" "+a.className.substr(2):b.className.split(a.className.substr(2)).join(""),a=M(d,A(b),a,this._classData={b:i,e:b.className,props:[]}),b.className=i);this._parseVars(a,b,e,a.suffixMap||n.suffixMap);return!0};o._parseVars=function(b,a,c,e){var i=this._style,d,g,f,h,k,l,j;for(d in b)if(g= b[d],"transform"===d||d===m)this._parseTransform(a,g,c,e);else if(N[d]||"transformOrigin"===d)this._parseTransform(a,b,c,e);else{if("alpha"===d||"autoAlpha"===d)d="opacity";else if("margin"===d||"padding"===d){g=(g+"").split(" ");h=g.length;f={};f[d+"Top"]=g[0];f[d+"Right"]=1<h?g[1]:g[0];f[d+"Bottom"]=4===h?g[2]:g[0];f[d+"Left"]=4===h?g[3]:2===h?g[1]:g[0];this._parseVars(f,a,c,e);continue}else if("backgroundPosition"===d||"backgroundSize"===d){f=G(g);j=G(h=s(a,d,c));this._firstPT=f={_next:this._firstPT, t:i,p:d,b:h,f:!1,n:"css_"+d,type:3,s:j.ox,c:f.oxr?f.ox:f.ox-j.ox,ys:j.oy,yc:f.oyr?f.oy:f.oy-j.oy,sfx:f.oxp?"%":"px",ysfx:f.oyp?"%":"px",r:!f.oxp&&!1!==b.autoRound};f.e=f.s+f.c+f.sfx+" "+(f.ys+f.yc)+f.ysfx;continue}else if("border"===d){g=(g+"").split(" ");this._parseVars({borderWidth:g[0],borderStyle:g[1]||"none",borderColor:g[2]||"#000000"},a,c,e);continue}else if("autoRound"===d)continue;h=s(a,d,c);h=null!=h?h+"":"";this._firstPT=f={_next:this._firstPT,t:i,p:d,b:h,f:!1,n:"css_"+d,sfx:"",r:!1,type:0}; "opacity"===d&&null!=b.autoAlpha&&(this._firstPT=f._prev={_next:f,t:i,p:"visibility",f:!1,n:"css_visibility",r:!1,type:-1,b:0!==Number(h)?"visible":"hidden",i:"visible",e:0===Number(g)?"hidden":"visible"},this._overwriteProps.push("css_visibility"));if("color"===d||"fill"===d||"stroke"===d||-1!==d.indexOf("Color")||"string"===typeof g&&!g.indexOf("rgb("))k=K(h),h=K(g),f.e=g,f.s=Number(k[0]),f.c=Number(h[0])-f.s,f.gs=Number(k[1]),f.gc=Number(h[1])-f.gs,f.bs=Number(k[2]),f.bc=Number(h[2])-f.bs,3<k.length|| 3<h.length?(f.as=4>k.length?1:Number(k[3]),f.ac=(4>h.length?1:Number(h[3]))-f.as,f.type=f.c||f.gc||f.bc||f.ac?2:-1):f.type=f.c||f.gc||f.bc?1:-1;else{k=h.replace(D,"");if(""===h||"auto"===h)if("width"===d||"height"===d){l=d;k=a;h=c;j=parseFloat("width"===l?k.offsetWidth:k.offsetHeight);l=V[l];var n=l.length;for(h=h||w(k,null);-1<--n;)j-=parseFloat(s(k,"padding"+l[n],h,!0))||0,j-=parseFloat(s(k,"border"+l[n]+"Width",h,!0))||0;k="px"}else j="opacity"!==d?0:1;else j=-1===h.indexOf(" ")?parseFloat(h.replace(u, "")):NaN;"string"===typeof g?(h="="===g.charAt(1),l=g.replace(D,""),g=-1===g.indexOf(" ")?parseFloat(g.replace(u,"")):NaN):(h=!1,l="");""===l&&(l=e[d]||k);f.e=g||0===g?(h?g+j:g)+l:b[d];if(k!==l&&""!==l&&(g||0===g))if(j||0===j)if(j=t(a,d,j,k),"%"===l?(j/=t(a,d,100,"%")/100,100<j&&(j=100)):"em"===l?j/=t(a,d,1,"em"):(g=t(a,d,g,l),l="px"),h&&(g||0===g))f.e=g+j+l;if((j||0===j)&&(g||0===g)&&(f.c=h?g:g-j))if(f.s=j,f.sfx=l,"opacity"===d)y||(f.type=4,f.p="filter",f.b="alpha(opacity="+100*f.s+")",f.e="alpha(opacity="+ 100*(f.s+f.c)+")",f.dup=null!=b.autoAlpha,this._style.zoom=1);else{if(!1!==b.autoRound&&("px"===l||"zIndex"===d))f.r=!0}else f.type=-1,f.i=f.e,f.s=f.c=0}this._overwriteProps.push("css_"+d);f._next&&(f._next._prev=f)}};o._parseTransform=function(b,a,c){if(!this._transform){var c=this._transform=F(b,c,!0),e=this._style,i,d;if("object"===typeof a){b={scaleX:B(null!=a.scaleX?a.scaleX:a.scale,c.scaleX),scaleY:B(null!=a.scaleY?a.scaleY:a.scale,c.scaleY),x:B(a.x,c.x),y:B(a.y,c.y)};null!=a.shortRotation? (b.rotation="number"===typeof a.shortRotation?a.shortRotation*v:C(a.shortRotation,c.rotation),i=(b.rotation-c.rotation)%(2*Math.PI),i!==i%Math.PI&&(i+=Math.PI*(0>i?2:-2)),b.rotation=c.rotation+i):b.rotation=null==a.rotation?c.rotation:"number"===typeof a.rotation?a.rotation*v:C(a.rotation,c.rotation);b.skewX=null==a.skewX?c.skewX:"number"===typeof a.skewX?a.skewX*v:C(a.skewX,c.skewX);b.skewY=null==a.skewY?c.skewY:"number"===typeof a.skewY?a.skewY*v:C(a.skewY,c.skewY);if(i=b.skewY-c.skewY)b.skewX+= i,b.rotation+=i;if(null!=(a=a.transformOrigin))m?(d=m+"Origin",this._firstPT=a={_next:this._firstPT,t:e,p:d,s:0,c:0,n:d,f:!1,r:!1,b:e[d],e:a,i:a,type:-1,sfx:""},a._next&&(a._next._prev=a)):G(a,c)}else if("string"===typeof a&&m)i=e[m],e[m]=a,b=F(b,null,!1),e[m]=i;else return;m?"WebkitTransform"===m&&(e[m+"Style"]="preserve-3d"):e.zoom=1;for(d in N)c[d]!==b[d]&&("shortRotation"!==d&&"scale"!==d)&&(this._firstPT=a={_next:this._firstPT,t:c,p:d,s:c[d],c:b[d]-c[d],n:d,f:!1,r:!1,b:c[d],e:b[d],type:0,sfx:0}, a._next&&(a._next._prev=a),this._overwriteProps.push("css_"+d))}};o.setRatio=function(b){var a=this._firstPT,c,e;if(1===b&&(this._tween._time===this._tween._duration||0===this._tween._time))for(;a;)a.t[a.p]=a.e,4===a.type&&1===a.s+a.c&&this._style.removeAttribute("filter"),a=a._next;else if(b||!(this._tween._time===this._tween._duration||0===this._tween._time))for(;a;)c=a.c*b+a.s,a.r&&(c=0<c?c+0.5>>0:c-0.5>>0),a.type?1===a.type?a.t[a.p]="rgb("+(c>>0)+", "+(a.gs+b*a.gc>>0)+", "+(a.bs+b*a.bc>>0)+")": 2===a.type?a.t[a.p]="rgba("+(c>>0)+", "+(a.gs+b*a.gc>>0)+", "+(a.bs+b*a.bc>>0)+", "+(a.as+b*a.ac)+")":-1===a.type?a.t[a.p]=a.i:3===a.type?(e=a.ys+b*a.yc,a.r&&(e=0<e?e+0.5>>0:e-0.5>>0),a.t[a.p]=c+a.sfx+" "+e+a.ysfx):(a.dup&&(a.t.filter=a.t.filter||"alpha(opacity=100)"),a.t.filter=-1===a.t.filter.indexOf("opacity=")?a.t.filter+(" alpha(opacity="+(100*c>>0)+")"):a.t.filter.replace(E,"opacity="+(100*c>>0))):a.t[a.p]=c+a.sfx,a=a._next;else for(;a;)a.t[a.p]=a.b,4===a.type&&1===a.s&&this._style.removeAttribute("filter"), a=a._next;if(this._transform)if(a=this._transform,m&&!a.rotation)this._style[m]=(a.x||a.y?"translate("+a.x+"px,"+a.y+"px) ":"")+(a.skewX?"skewX("+a.skewX+"rad) ":"")+(1!==a.scaleX||1!==a.scaleY?"scale("+a.scaleX+","+Math.cos(a.skewX)*a.scaleY+")":"")||"translate(0px,0px)";else{var i=m?a.rotation:-a.rotation,d=m?i-a.skewX:i+a.skewX;e=Math.cos(i)*a.scaleX;var i=Math.sin(i)*a.scaleX,g=Math.sin(d)*-a.scaleY,d=Math.cos(d)*a.scaleY,f=1.0E-8,h;i<f&&i>-f&&(i=0);g<f&&g>-f&&(g=0);if(m)this._style[m]="matrix("+ e+","+i+","+g+","+d+","+a.x+","+a.y+")";else if(h=this._target.currentStyle){f=i;i=-g;g=-f;f=this._style.filter;this._style.filter="";c=this._target.offsetWidth;var k=this._target.offsetHeight,l="absolute"!==h.position,j="progid:DXImageTransform.Microsoft.Matrix(M11="+e+", M12="+i+", M21="+g+", M22="+d,n=a.x,o=a.y,p,q;null!=a.ox&&(p=(a.oxp?0.01*c*a.ox:a.ox)-c/2,q=(a.oyp?0.01*k*a.oy:a.oy)-k/2,n=p-(p*e+q*i)+a.x,o=q-(p*g+q*d)+a.y);if(l)p=c/2,q=k/2,j+=", Dx="+(p-(p*e+q*i)+n)+", Dy="+(q-(p*g+q*d)+o)+")"; else{l=4;p=a.ieOffsetX||0;q=a.ieOffsetY||0;a.ieOffsetX=Math.round((c-((0>e?-e:e)*c+(0>i?-i:i)*k))/2+n);for(a.ieOffsetY=Math.round((k-((0>d?-d:d)*k+(0>g?-g:g)*c))/2+o);-1<--l;)k=W[l],c=h[k],c=-1!==c.indexOf("px")?parseFloat(c):t(this._target,k,parseFloat(c),c.replace(D,""))||0,this._style[k]=Math.round(c-(2>l?p-a.ieOffsetX:q-a.ieOffsetY))+"px";j+=",sizingMethod='auto expand')"}this._style.filter=-1!==f.indexOf("progid:DXImageTransform.Microsoft.Matrix(")?f.replace(U,j):f+" "+j;if(0===b||1===b)1=== e&&0===i&&0===g&&1===d&&(!E.test(f)||100===parseFloat(RegExp.$1))&&this._style.removeAttribute("filter")}}if(this._classData)if(a=this._classData,1===b&&(this._tween._time===this._tween._duration||0===this._tween._time)){for(l=a.props.length;-1<--l;)this._style[a.props[l]]="";this._target.className=a.e}else this._target.className!==a.b&&(this._target.className=a.b)};o._kill=function(b){var a=b,c;if(b.autoAlpha||b.alpha){a={};for(c in b)a[c]=b[c];a.opacity=1;a.autoAlpha&&(a.visibility=1)}return x.prototype._kill.call(this, a)};x.activate([n]);return n},!0)});window._gsDefine&&_gsQueue.pop()();