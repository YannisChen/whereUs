package com.yannis.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**  
 * create time:Feb 10, 2015--5:47:52 PM
 * @author Yannis  
 * @version 1.0   
 * @since JDK 1.8 
 * filename：PropertyUtils.java  
 * desc:
 */

public class PropertyUtils {
	
	/**
	 * @see 根据clazz的物理路径，获取propertyFileName名称的属性文件的Properties对象
	 * @param clazz
	 * @param propertyFileName
	 * @return
	 */
	public static Properties getPropertyFile(Class clazz,String propertyFileName){
    	InputStream inputStream = clazz.getClassLoader().getResourceAsStream(propertyFileName);   
		Properties p = new Properties();  
		try {
			p.load(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return p;
    }
}

