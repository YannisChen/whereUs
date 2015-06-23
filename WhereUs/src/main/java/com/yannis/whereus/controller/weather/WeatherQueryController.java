/*========================================================================
 * - COPYRIGHT NOTICE -  
 *                                                *
 * Project Name:WhereUs 
 * File Name:WeatherQueryController.java 
 * Package Name:com.yannis.whereus.controller.weather 
 * Date:Jun 18, 20154:03:33 PM 
 * Copyright (c) 2015, piggachen@163.com All Rights Reserved.                                     
 *
 *                                                                       *
 ========================================================================*/

package com.yannis.whereus.controller.weather;

import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yannis.utils.PropertyUtils;
import com.yannis.whereus.service.IWeatherService;

@Controller 
public class WeatherQueryController {
	
	@Resource(name = "weatherService")
	private IWeatherService weatherService; 
	
	@RequestMapping(value="weatherQuery")    
    public ModelAndView weatherQueryJSP(HttpServletRequest request,ModelAndView model){
		
		model.setViewName("weather/weatherquery");
		return model;
    }
	
	@RequestMapping(value="doWeatherQuery", method = RequestMethod.GET) 
    public @ResponseBody String doWeatherQuery(HttpServletRequest request){
		String cityName = request.getParameter("cityName");
		
		Properties prop = PropertyUtils.getPropertyFile(WeatherQueryController.class, "configfile.properties");
		String apiKey = prop.getProperty("apikey");
		String httpUrl = prop.getProperty("weatherqueryurl");
		String httpArg = "city="+cityName;
		
	    return weatherService.request(httpUrl, httpArg, apiKey);
    }
	
}
