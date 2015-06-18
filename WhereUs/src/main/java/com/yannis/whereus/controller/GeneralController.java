/*========================================================================
 * - COPYRIGHT NOTICE -  
 *                                                *
 * Project Name:WhereUs 
 * File Name:GeneralController.java 
 * Package Name:com.yannis.whereus.controller 
 * Date:Jun 18, 201510:36:00 AM 
 * Copyright (c) 2015, piggachen@163.com All Rights Reserved.                                     
 *
 *                                                                       *
 ========================================================================*/

package com.yannis.whereus.controller;

import org.springframework.stereotype.Controller;    
import org.springframework.ui.Model;    
import org.springframework.web.bind.annotation.RequestMapping;    
    
@Controller    
public class GeneralController {    
    
    @RequestMapping(value="index.do")    
    public void index_jsp(Model model){    
        model.addAttribute("hello", "Hello world");    
        System.out.println("index.jsp");    
    }    
}  