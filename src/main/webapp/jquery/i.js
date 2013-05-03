window.I = (function(){
  var ROOT = '';
  var T = ['BREAK','CONTINUE','RETURN'];
  var W = [
    function(o,t){window.attachEvent('onload',o);},
    function(o,t){window.addEventListener('DOMContentLoaded',o,false);}
  ];
  var C = [
    function(o,s){o.style.cssText = s;},
    function(o,s){o.setAttribute('style',s);}
  ];
  var G = {
    'ID':function(o,s){return o.getElementById(s);},
    'NAME':function(o,s){return o.getElementsByName(s);},
    'TAG':function(o,s){return o.getElementsByTagName(s);},
    'CHILD':function(o){
      var c = [];
      each(o.childNodes,function(m,i){if(1 == m.nodeType) c.push(m);});
      return c;
    },
    'CLASS':function(){
      var a = arguments;
      var c = [];
      for(var i=0;i<a[0].childNodes.length;i++){
        m = a[0].childNodes[i];
        if(m.getAttribute){
          if(a[1] == m.getAttribute('class') || a[1] == m.getAttribute('className')) c.push(m);
          var cc = a.callee(m,a[1]);
          for(var j=0;j<cc.length;j++) c.push(cc[j]);
        }
      }
      return c;
    }
  };
  var A = {
    'IN':function(a,b){b.appendChild(a);},
    'BEFORE':function(a,b){b.parentNode.insertBefore(a,b);},
    'AFTER':function(a,b){b.parentNode.lastChild == b?A['IN'](a,b.parentNode):A['BEFORE'](a,b.nextSibling);}
  };
  var fn2 = function(d,o,s){
    each(d,function(f,i){
      try{
        f(o,s);
        return I.RETURN;
      }catch(e){}
    });
  };
  var $ = function(o){
    switch(o.length){
      case 1: return typeof o[0] == 'string'?('*'==o[0]?G['CHILD']($([]).body):G['ID']($([]),o[0])):o[0];
      case 2: return '*'==o[1]?G['CHILD']($([o[0]])):G[o[0].toUpperCase()]($([]),o[1]);
      case 3: return G[o[1].toUpperCase()]($([o[0]]),o[2]);
    }
    return document;
  };
  var insert = function(o){
    if(o.length<1) return null;
    var m = typeof o[0] == 'string'?$([]).createElement(o[0]):o[0];
    switch(o.length){
      case 1: A['IN'](m,$([]).body);break;
      case 2: A['IN'](m,o[1]);break;
      case 3: A[o[1].toUpperCase()](m,o[2]);break;
    }
    return m;
  };
  var region = function(o){
    var x = 0,y = 0,w = 0,h = 0;
    switch(o.length){
      case 1:
        var r = region([]);
        var m = o[0];
        w = m.offsetWidth;
        h = m.offsetHeight;
        if(m.getBoundingClientRect){
          x = m.getBoundingClientRect().left + r.x - $([]).documentElement.clientLeft;
          y = m.getBoundingClientRect().top + r.y - $([]).documentElement.clientTop;
        }else for(;m;x+=m.offsetLeft,y+=m.offsetTop,m=m.offsetParent);
        break;
      default:
        x = Math.max($([]).documentElement.scrollLeft,$([]).body.scrollLeft);
        y = Math.max($([]).documentElement.scrollTop,$([]).body.scrollTop);
        w = $([]).documentElement.clientWidth;
        h = $([]).documentElement.clientHeight;
    }
    return {'x':x,'y':y,'width':w,'height':h};
  };
  var listen = function(o,s,f){
    try{o.attachEvent('on'+s,function(e){f(o,window.event || e);});}catch(e){
      try{o.addEventListener(s,function(e){f(o,window.event || e);},false);}catch(ex){}
    }
  };
  var each = function(o,f){
    a:for(var i=0;i<o.length;i++){
      switch(f(o[i],i)){
        case T[0]:break a;
        case T[1]:continue a;
        case T[2]:return;
      }
    }
  };
  var dir = function(u){
    var r = '';
    if(!ROOT){
      each($(['tag','script']),function(o,i){
        var s = o.getAttribute('src');
        if(!s) return I.CONTINUE;
        var i = s.indexOf('i.js');
        if(i>-1){
          r = s.substr(0,i);
          return I.BREAK;
        }
      });
      ROOT = r;
    }else{
      r = ROOT;
    }
    switch(u.length){
      case 1:r += u[0];break;
    }
    return r;
  };
  return {
    'version':'2.3',
    'BREAK':T[0],
    'CONTINUE':T[1],
    'RETURN':T[2],
    '$':function(){return $(arguments);},
    'ready':function(){each(arguments,function(o,i){fn2(W,o,i);});},
    'region':function(){return region(arguments);},
    'css':function(o,s){
      fn2(C,o,s);
      each(o,function(m,i){
        fn2(C,m,s);
      });
    },
    'insert':function(){return insert(arguments);},
    'listen':function(o,s,f){
      listen(o,s,f);
      each(o,function(m,i){listen(m,s,f);});
      return f;
    },
    'each':function(o,f){each(o,f);},
    'dir':function(){return dir(arguments);}
  };
})();