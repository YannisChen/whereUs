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
    	<div class="container-fluid">
			<div class="span12">
				<h2 class="text-center text-info" id="contentInner">
				</h2>
			</div>
			
			<div class="span4">
				<ul class="list-group">
				  <li class="list-group-item list-group-item-success">分类:<span id="catname"></span></li>
				  <li class="list-group-item list-group-item-info">出处:<span id="source"></span></li>
				  <li class="list-group-item list-group-item-warning">作者:<span id="author"></span></li>
				</ul>
			</div>
		</div>
		

    </body>
    <script type="text/javascript" charset="utf-8">
    	$(document).ready(function() {
    		$.ajax( {
    			url:'<%= basePath %>web/zyRequest',// 跳转到 action 
    			data:{ },
    		    type:'get',    
    		    cache:false,    
    		    dataType:'',    
    		    success:function(data) {
    		    	//$("#weatherDiv").html(data);
    		    	var zyInfo = eval('(' + data + ')');
    		    	if(zyInfo != ""){
   		    			var content = zyInfo.zhaiyan;		//内容
   		    			var catname = zyInfo.catname ;		//类型
   		    			var author = zyInfo.author ;		//作者
   		    			var source = zyInfo.source ;		//来源
   		    			$("#contentInner").html("『"+content+"』");
   		    			$("#catname").html(catname);
   		    			$("#author").html(author);
   		    			$("#source").html(source);
    		    	}else{
    		    		$("#contentInner").attr("class", "col-lg-6 list-group-item-danger");
    		    		$("#contentInner").html("请求失败");
    		    		return;
    		    	}
    		    	
    		    },    
    		    error : function() {
    		    	$("#contentInner").attr("class", "col-lg-6 list-group-item-danger");
    		    	$("#contentInner").html("请求超时,请检查当前网络");
    		    	return false;
    		    }
    		});
      	});
    	
    </script>
</html>