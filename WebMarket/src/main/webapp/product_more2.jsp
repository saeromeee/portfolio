
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<!DOCTYPE html>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>

<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>
	<%	
		String re=request.getParameter("re");
		if(re!=null){
			session.setAttribute("w", null);
		}else {session.setAttribute("w", 1);}
	%>
	
	<%	
		response.sendRedirect("product.jsp");
	%>
	
	
</body>

</html>