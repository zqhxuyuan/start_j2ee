package com.xuyuan.spring3.recipes.ws.ejb3;

//import javax.ejb.Remote; 
//import javax.ejb.Stateless; 
// 
//@Stateless 
//@Remote( { PostageService.class }) 
public class PostageServiceBean implements PostageService { 
 
   public double calculatePostage(String country, double weight) { 
      return 1.0; 
   } 
}
