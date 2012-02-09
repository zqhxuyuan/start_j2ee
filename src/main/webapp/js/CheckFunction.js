function Trim(m){  
  while((m.length>0)&&(m.charAt(0)==' '))  
  m   =   m.substring(1, m.length);  
  while((m.length>0)&&(m.charAt(m.length-1)==' '))  
  m = m.substring(0, m.length-1);  
  return m;  
  }

function ltrim(s){
    return s.replace( /^\s*/, "");
}

function rtrim(s){
    return s.replace( /\s*$/, "");
}

function trim(s){
    return rtrim(ltrim(s));
} 