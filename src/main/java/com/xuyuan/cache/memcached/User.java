package com.xuyuan.cache.memcached;

import java.io.Serializable;  

public class User implements Serializable{   
    private static final long serialVersionUID = -372274003834027815L;  
  
    /**
	 * @uml.property  name="userId"
	 */
    private String userId;  
      
    public User(String userId) {   
        this.userId = userId;   
    }  
      
    /**
	 * @return
	 * @uml.property  name="userId"
	 */
    public String getUserId() {   
        return userId;   
    }   
      
    /**
	 * @param userId
	 * @uml.property  name="userId"
	 */
    public void setUserId(String userId) {   
        this.userId = userId;   
    }   
          
    @Override   
    public String toString() {   
        return "userId="+this.userId;   
    }   
}  