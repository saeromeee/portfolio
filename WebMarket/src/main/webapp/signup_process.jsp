
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
			
			String mid=request.getParameter("mid");
			String pwd=request.getParameter("pwd");
			String pwd2=request.getParameter("pwd2");
			String name=request.getParameter("name");
			String gen=request.getParameter("gen");
			String birth=request.getParameter("birth");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String addr=request.getParameter("addr");
			
			if(pwd!=null){
			out.println(pwd);
			} else { out.println("파라미터 못받아옴 ㅅㅂ");}
			
			if(daos.idcheck(mid)==1 && pwd.equals(pwd2) ){ //아이디가 중복되지 않으면 
				daos.signs(mid,pwd,name,gen,birth,email,phone,addr);	
				daos.close();
				
				session.setAttribute("UserId", mid);
				session.setAttribute("UserName", name);
				
				response.sendRedirect("product.jsp");
			} else if(daos.idcheck(mid)==0) { 	
			%>	<script>
					alert("아이디 중복임");
					location.href="signup.jsp?sign=1";
				</script>		
		<%	} else if(!pwd.equals(pwd2)) { 	
			%>	<script>
					alert("ㅂ번이 같이 아놔요 ㅠ^^*");
					location.href="signup.jsp?sign=1";
				</script>		
	<%	} %>

	
	
</body>

</html>