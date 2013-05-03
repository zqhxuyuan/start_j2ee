package com.xuyuan.spring3.mvc.autocomplete;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
    private static DummyDB dummyDB = new DummyDB();
    
    //localhost:8888/start_j2ee/autocomplete.html
    @RequestMapping(value = "/autocomplete", method = RequestMethod.GET)
    public ModelAndView index() {
        return new ModelAndView("autocomplete", "userForm", new User());
    }
    
    /**
     * used @ResponseBody annotation in methods getCountryList() and getTechList(). 
     * Spring MVC converts the return type is List into JSON data.
     * 返回的List数据,会自动被SpringMVC转换为JSON格式的数据.
     */
    @RequestMapping(value = "/get_country_list", method = RequestMethod.GET, headers="Accept=*/*")
    public @ResponseBody List<String> getCountryList(@RequestParam("term") String query) {
        return dummyDB.getCountryList(query);
    }
    
    @RequestMapping(value = "/get_tech_list", method = RequestMethod.GET, headers="Accept=*/*")
    public @ResponseBody List<String> getTechList(@RequestParam("term") String query) {
        return dummyDB.getTechList(query);
    }
    
    @RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	public String addContact(@ModelAttribute("userForm")User user, BindingResult result) {
		System.out.println(user.getName() + "\n"+user.getCountry() + "\n"+user.getTechnologies()); 
		return "redirect:autocomplete.html";
	}
    
    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public ModelAndView view(User user) {
        return new ModelAndView("autocomplete", "userForm", user);
    }
}
