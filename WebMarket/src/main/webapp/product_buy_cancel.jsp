<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
    
<!DOCTYPE html>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>

<html>

<head>

<style>
.buttons{
border:0px; 
color:white;
background:#81BEF7;
}
img{
	width:200px;
	height:200px;
}

</style>

<meta charset="UTF-8">
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title>Welcome</title>

</head>


<body>

	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%String id=request.getParameter("id"); %>
	<%int len=productDAO.getAllProducts().size();%>
	<%@ include file="nav.jsp" %>

 	<%! String greeting = "주문정보"; %> 
 	
 	
 	<div class="jumbotron">
 		<div class = "container">
 			<h1 class="display-3">주문취소</h1>	
 		</div>
 	</div>
 	
 
		
	
<div style="margin-left:10%; margin-right:10%; background-color:#FADEDC; border-radius: 5%;">
<h1 style="color:#A0413C;">주문이 취소되었습니다.</h1></div>
	
		
	<a href="./product.jsp" style="margin-left:7%;">
	<button class="btn btn-secondary btn-sm" 
	style="border:0px; background-color:#A1C7E0; margin-left:3%; border-radius: 5%;">상품목록
	</button></a>
	
	<br>
	<br>
	
	
	
</body>
</html>