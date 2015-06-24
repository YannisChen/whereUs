/*========================================================================
 * - COPYRIGHT NOTICE -  
 *                                                *
 * Project Name:WhereUs 
 * File Name:SerService.java 
 * Package Name:com.yannis.whereus.service.imp 
 * Date:Jun 24, 20156:04:16 PM 
 * Copyright (c) 2015, piggachen@163.com All Rights Reserved.                                     
 *
 *                                                                       *
 ========================================================================*/

package com.yannis.whereus.service.imp;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.yannis.whereus.service.IService;

@Service("serService")
public class SerService implements IService {

	private Logger log = Logger.getLogger(SerService.class);
	
	public String request(String httpUrl, String httpArg, String apiKey,int requestType) {
		BufferedReader reader = null;
	    String result = null;
	    StringBuffer sbf = new StringBuffer();
	    if(null != httpArg){
	    	httpUrl = httpUrl + "?" + httpArg;
	    }

	    try {
	        URL url = new URL(httpUrl);
	        HttpURLConnection connection = (HttpURLConnection) url
	                .openConnection();
	        if(0 == requestType){
	        	connection.setRequestMethod("GET");
	        }else{
	        	connection.setRequestMethod("POST");
	        }
	        if(null != apiKey){
	        	// 填入apikey到HTTP header
		        connection.setRequestProperty("apikey",  apiKey);
	        }
	        connection.connect();
	        InputStream is = connection.getInputStream();
	        reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
	        String strRead = null;
	        while ((strRead = reader.readLine()) != null) {
	            sbf.append(strRead);
	            sbf.append("\r\n");
	        }
	        reader.close();
	        result = sbf.toString();
	        log.info("query result---->"+result);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return result;
	}

}
