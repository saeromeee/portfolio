
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model1.board.BoardDAO" %>
    

    
<!DOCTYPE html>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>
<%@include file="dbconn.jsp" %>   
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title> 
</head>
<body>

		<%
			request.setCharacterEncoding("UTF-8");
			BoardDAO daos=new BoardDAO();	
			
			
			Statement stmt = null;
			PreparedStatement pstmt=null;
			
			String mid=(String)session.getAttribute("UserId");
			String pwd=request.getParameter("pwd");
			String pwd2=request.getParameter("pwd2");
			String name=request.getParameter("name");
			String gen=request.getParameter("gen");
			String birth=request.getParameter("birth");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String addr=request.getParameter("addr");
			
			out.println("mid : " + mid+"<br>");
			out.println("pwd : " + pwd+"<br>");
			out.println("pwd2 : " + pwd2+"<br>");
			out.println("name : " + name+"<br>");
			out.println("gen : " + gen+"<br>");
			out.println("birth : " + birth+"<br>");
			out.println("email : " + email+"<br>");
			out.println("phone : " + phone+"<br>");
			out.println("addr : " + addr+"<br>");
			
			if(pwd!=null){
			
			} else { out.println("파라미터 못받아옴 ㅅㅂ");}
			
			if(pwd.equals(pwd2)){ //비번이 일치하면
				daos.edit(pwd,name,gen,birth,email,phone,addr,mid);	
				daos.close();
				
				session.setAttribute("UserId", mid);
				session.setAttribute("UserName", name);
				
				response.sendRedirect("product.jsp");
			} else if(!pwd.equals(pwd2)) { 	
			%>	<script>
					alert("ㅂ번이 같이 아놔요 ㅠ^^*");
					location.href="edit_profile.jsp?sign=1";
				</script>		
	<%	} %>

	
	
</body>

</html>