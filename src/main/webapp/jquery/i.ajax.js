window.I.AJAX = (function(){
  var T = ['GET','POST','HEAD'];
  var W = [
    function(){return new XMLHttpRequest();},
    function(){return new ActiveXObject("Msxml2.XMLHTTP");},
    function(){return new ActiveXObject("Microsoft.XMLHTTP");}
  ];
  var _ = function(){
    for(var i=0;i<W.length;i++){
      try{
        return W[i]();
      }catch(e){}
    }
    return null;
  };
  var hand = function(t,o){
    switch(t){
      case 1:return eval('('+o+')');
    }
    return encodeURIComponent(encodeURIComponent(o));
  };
  var query = function(t,o){
    var r = _();
    r.open(T[t],o[0],t==1?(o.length>3?o[3]:true):(o.length>2?o[2]:true));
    r.onreadystatechange = function(){
      if(4 == r.readyState && 200 == r.status){
        t == 1?o[2](r):o[1](r);
        delete(r);
      }
    };
    r.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    r.setRequestHeader('x-requested-with', 'XMLHttpRequest');
    r.send(1==t?o[1]:null);
    
    // 无聊，兼容FF
    if(0==t){
      if(navigator.userAgent.indexOf('Firefox')>-1){
        if(4 == r.readyState && 200 == r.status){
          t == 1?o[2](r):o[1](r);
          delete(r);
        }
      }
    }
  };
  return {
    'version':'2.1',
    'encode':function(o){return hand(0,o);},
    'json':function(o){return hand(1,o);},
    //url,params,f,asynch
    'post':function(){query(1,arguments);},
    //url,f,asynch
    'get':function(){query(0,arguments);}
  };
})();