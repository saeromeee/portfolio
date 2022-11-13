
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
		
	
		String bid=request.getParameter("bid");
		if(bid!=null){
			ResultSet rss = null;	   
		    PreparedStatement pstmts=null;
		    String sqls = null;
		    try{		    	
	    		sqls = "DELETE FROM bill WHERE bid = ?";
	    		pstmts= conn.prepareStatement(sqls);    
		        pstmts.setString(1,bid);
		        pstmts.executeUpdate();	    	
				
			} catch(SQLException ex){			
				out.println("주문취소 실패<br>");
				out.println("SQLException : " + ex.getMessage());
			} finally{
		
				if(pstmts!=null) pstmts.close();
				if(conn!=null) conn.close();
			}
		    response.sendRedirect("product_order.jsp");
		}
	
	
	
	
		String pid=request.getParameter("id");
		if(pid!=null){
			ResultSet rs = null;	   
		    PreparedStatement pstmt=null;
		    String sql = null;
		    try{	
		    	if(pid.equals("delete")){
		    		sql = "DELETE FROM cart";
		    		pstmt= conn.prepareStatement(sql);    		       
			        pstmt.executeUpdate();
		    	} else if(pid.equals("pdelete")){
		    		sql = "DELETE FROM product";
		    		pstmt= conn.prepareStatement(sql);    		        
			        pstmt.executeUpdate();
		    	} else {
		    		sql = "DELETE FROM cart WHERE pid = ?";
		    		pstmt= conn.prepareStatement(sql);    
			        pstmt.setString(1,pid);
			        pstmt.executeUpdate();
		    	}
				
			} catch(SQLException ex){			
				out.println("실패<br>");
				out.println("SQLException : " + ex.getMessage());
			} finally{
		
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}
		    
		    if(pid.equals("pdelete")){
				response.sendRedirect("product.jsp");
			} else{response.sendRedirect("product_bcase.jsp");}
		}
	%>

	
	
</body>

</html>