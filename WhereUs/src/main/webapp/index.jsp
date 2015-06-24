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
        <title>WhereUs</title>    
    </head>
    <link href="<%=basePath%>resources/js/plugins/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>resources/js/plugins/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=basePath%>resources/js/plugins/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/js/plugins/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
        
    <body>
        <nav class="navbar navbar-default">
          <!-- head begin -->
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <a class="navbar-brand" href="#">WhereUs</a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li class="active"><a href="#">首页<span class="sr-only">(current)</span></a></li>
		        <li><a href="javascript:checkWeather();" id="queryWeather">天气查询 </a></li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		    
		    <div class="hero-unit" id="innerPage">
				
			</div>
			
		  </div><!-- /.container-fluid -->
		 
		</nav>  
		
    </body>
    <script>
    	$(document).ready( function() { 
    			$("#innerPage").load("<%=basePath %>web/home");
    		}
    	);
    	
    	function checkWeather(){
    		removeClass($(this));
    		$(this).parent().addClass("active"); 
    		$("#innerPage").load("<%=basePath %>web/weatherQuery");
    	}
    	
    	function removeClass(obj){
    		var lichilds = $(obj).parent().parent().children("li");
    		$.each(lichilds,function() {
    			$(this).removeClass();
            });
    	}
    </script>
</html>