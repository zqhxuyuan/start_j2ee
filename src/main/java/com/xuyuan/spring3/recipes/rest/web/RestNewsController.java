package com.xuyuan.spring3.recipes.rest.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

@Controller 
public class RestNewsController { 
 
    /**
	 * @uml.property  name="restTemplate"
	 * @uml.associationEnd  readOnly="true"
	 */
    @Autowired 
    protected RestTemplate restTemplate; 
    
    // http://localhost:8888/start_j2ee/sportsnews.html
    @RequestMapping("/sportsnews") 
    public String getYahooNews(Model model) { 
        String result = restTemplate.getForObject(
        	"http://search.yahooapis.com/NewsSearchService/V1/newsSearch?appid={appid}&query={query}&results={results}&language={language}",
        	String.class, "YahooDemo","sports","2","en"); 
       model.addAttribute("newsfeed", result); 
       return "sportnews"; 
    } 
}
