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
    <link href="<%=basePath%>resources/js/plugins/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>resources/js/plugins/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />    
    <script type="text/javascript" src="<%=basePath%>resources/js/plugins/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugins/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/dateutil.js"></script>
        
    <body>
		<h1>
			Hello, world!
		</h1>
		<p>
			这是一个可视化布局模板, 你可以点击模板里的文字进行修改, 也可以通过点击弹出的编辑框进行富文本修改. 拖动区块能实现排序.
		</p>
		<p>
			<a class="btn btn-primary btn-large" href="#">参看更多 »</a>
		</p>
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
    		    	//$("#weatherDiv").html(data);
    		    	var obj = eval('(' + data + ')');
    		    	if(obj.errNum == 0){
    		    		var airInfo = obj.retData;
    		    		if(airInfo != ""){
    		    			var city = airInfo.city;		//当前城市
    		    			var curTime = airInfo.time;		//更新时间
    		    			var aqiVal = airInfo.aqi;		//空气质量指数
    		    			var airLeval = airInfo.level;	//空气质量级别
    		    			var core = airInfo.core;		//首要污染物
    		    			curTime = dateFormat(curTime,"yyyy-MM-dd hh:mm:ss");
    		    			$("#weatherDiv").attr("class", "col-lg-6 alert alert-success");
    		    			$("#weatherDiv").html("当前城市："+city+"<br>更新时间:"+curTime+"<br>空气质量指数:"+aqiVal+"<br>空气质量级别:"+airLeval+"<br>首要污染物:"+core);
    		    		}else{
    		    			$("#weatherDiv").attr("class", "col-lg-6 alert alert-danger");
    		    			$("#weatherDiv").html("Sorry,我们暂无该区域数据");
    		    			return;
    		    		}
    		    	}else{
    		    		$("#weatherDiv").attr("class", "col-lg-6 alert alert-danger");
    		    		$("#weatherDiv").html("请求失败，失败原因："+obj.retMsg);
    		    		return;
    		    	}
    		    	
    		    },    
    		    error : function() {
    		    	$("#weatherDiv").html("请求超时,请检查当前网络");
    		    	return false;
    		    }
    		});
        }
    	
    </script>
</html>