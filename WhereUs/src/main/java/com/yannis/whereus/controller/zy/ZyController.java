/*========================================================================
 * - COPYRIGHT NOTICE -  
 *                                                *
 * Project Name:WhereUs 
 * File Name:ZyController.java 
 * Package Name:com.yannis.whereus.controller.zy 
 * Date:Jun 18, 20154:03:33 PM 
 * Copyright (c) 2015, piggachen@163.com All Rights Reserved.                                     
 *
 *                                                                       *
 ========================================================================*/

package com.yannis.whereus.controller.zy;

import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yannis.utils.PropertyUtils;
import com.yannis.whereus.service.IService;

@Controller 
public class ZyController {
	
	@Resource(name = "serService")
	private IService serService;
	
	@RequestMapping(value="home")    
    public ModelAndView homeJSP(HttpServletRequest request,ModelAndView model){
		
		model.setViewName("zhaiyan/zhaiyan");
		return model;
    }
	
	@RequestMapping(value="zyRequest", method = RequestMethod.GET) 
    public @ResponseBody String zyRequest(HttpServletRequest request,HttpServletResponse response){
		
		Properties prop = PropertyUtils.getPropertyFile(ZyController.class, "configfile.properties");
		String httpUrl = prop.getProperty("zyurl");
		
	    return serService.request(httpUrl, null, null,0);
    }
	
}
