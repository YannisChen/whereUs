/*========================================================================
 * - COPYRIGHT NOTICE -  
 *                                                *
 * Project Name:WhereUs 
 * File Name:IService.java 
 * Package Name:com.yannis.whereus.service 
 * Date:Jun 24, 20156:03:49 PM 
 * Copyright (c) 2015, piggachen@163.com All Rights Reserved.                                     
 *
 *                                                                       *
 ========================================================================*/

package com.yannis.whereus.service;

public interface IService {
	String request(String httpUrl, String httpArg,String apiKey,int requestType);
}
