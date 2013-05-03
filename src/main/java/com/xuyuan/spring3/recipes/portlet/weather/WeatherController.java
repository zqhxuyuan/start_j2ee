package com.xuyuan.spring3.recipes.portlet.weather;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("VIEW")
public class WeatherController {

    /**
	 * @uml.property  name="weatherService"
	 * @uml.associationEnd  multiplicity="(1 1)"
	 */
    private WeatherService weatherService;

    @Autowired
    public WeatherController(WeatherService weatherService) {
        this.weatherService = weatherService;
    }

    @RequestMapping
    public String handleRender(Model model) throws Exception {
	model.addAttribute("temperatures", weatherService.getMajorCityTemperatures());
        return "weatherView";
    }
}
