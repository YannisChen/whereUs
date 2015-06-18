<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">    
<html>    
    <head>    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
        <title>Weather Query</title>    
    </head>    
    <script type="text/javascript" src="<%=basePath%>resources/js/plugins/jquery-1.11.1.min.js"></script>
    
        
    <body>
        <input type="text" name="cityName" id="cityName" placeholder="请输入你要查询的城市名" value="" />
        <input type="button" name="submitBut" id="submitBut" value="查询" />
        <div id="weatherDiv">
        	
        </div> 
    </body>
    <script type="text/javascript"charset="utf-8">
    	$(document).ready(function() {
    		$('#submitBut').bind('click', function(event) {
    	        queryweather($("#cityName").val());
    	    });
      	});
    	
    	function queryweather(cityName){
        	$.ajax( {
    			url:'<%= basePath %>web/doWeatherQuery',// 跳转到 action    
    		    data:{    
    		    	cityName : cityName
    		    },
    		    type:'get',    
    		    cache:false,    
    		    dataType:'',    
    		    success:function(data) {
    		    	$("#weatherDiv").html(data);
    		    },    
    		    error : function() {    
    		    	return false;
    		    }
    		});
        }
    </script>
</html>