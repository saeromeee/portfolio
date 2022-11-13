<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%
LocalTime now = LocalTime.now();
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
	
	<%@ include file="nav.jsp" %>

 	<%! 
 	String greeting = "Welcome to Web Shopping Mall" ;
 	String tagline = "Welcome to Web Market!" ; 	
 	%>
 	
 	<div class="jumbotron">
 		<div class = "container">
 			<h1 class="display-3">
 			 	<%= greeting %>
 			</h1>
 		</div>
 	</div>
 	
 	<div class="container">
 		<div class = "text-center">
 			<h3>
 				<%= tagline %>
 			</h3>
 			<br>
 			<h5>
 				현재시각 <% 
 						if (now.getHour()>=12){out.println(now.getHour()+":"+now.getMinute() + " PM");} 
 						else { out.println(now.getHour()+":"+now.getMinute() + " AM");}
 				       %>
 			</h5> 			
 		</div>
 		<hr>
 	</div>

 	
 	
	<%@ include file="footer.jsp" %>
 		
 	
</body>
</html>

