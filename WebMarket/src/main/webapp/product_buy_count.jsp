
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
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
	
		String count=request.getParameter("count"); //increase, reduce 받아옴
		String pid=request.getParameter("ids"); 
		String mid=(String)session.getAttribute("UserId");
		
		ResultSet rs = null;	   
	    PreparedStatement pstmt=null;
		
		try{				
			String sql = "select * from cart where pid=? and mid=?";			
	        pstmt= conn.prepareStatement(sql);    
	        pstmt.setString(1,pid);
	        pstmt.setString(2,mid);
	        rs=pstmt.executeQuery();
	        
	        if(rs.next()){	  
	        	if(count.equals("increase")){
		        	int counts = rs.getInt("quantity");
		        	pstmt.close(); 
		        	String upd = "update cart set quantity=? where pid=? and mid=?";
		        	pstmt= conn.prepareStatement(upd);  
		        	pstmt.setInt(1,counts+1);
		        	pstmt.setString(2,pid);
		        	pstmt.setString(3,mid);
		        	pstmt.executeUpdate();	 		        	
	        	} else {
	        		int counts = rs.getInt("quantity");
		        	pstmt.close(); 
		        	String upd = "update cart set quantity=? where pid=? and mid=?";
		        	pstmt= conn.prepareStatement(upd);  
		        	pstmt.setInt(1,counts-1);
		        	pstmt.setString(2,pid);
		        	pstmt.setString(3,mid);
		        	pstmt.executeUpdate();	
	        	}
	        } 
			
		} catch(SQLException ex){
			out.println("넘기는거 실패함");
			out.println("실패<br>");
			out.println("SQLException : " + ex.getMessage());
		} finally{
	
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
		
	%>

	
	<% response.sendRedirect("product_bcase.jsp"); %>
	
	
</body>

</html>