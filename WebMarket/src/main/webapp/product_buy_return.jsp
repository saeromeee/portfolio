
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<!DOCTYPE html>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>

<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
<%@ include file="dbconn.jsp" %>
</head>
<body>
	<%	
		ResultSet rs = null;	   
	    PreparedStatement pstmt=null;

		String mid=(String)session.getAttribute("UserId");
		String ids=request.getParameter("ids");
		String pid=request.getParameter("id"); 
		String pname=request.getParameter("pname");
		int price=Integer.parseInt(request.getParameter("price"));
		String condition=request.getParameter("conditions");
		int quantity=1;
				
  	%> 
		<% 
		try{	
			out.println("try 시작직후");
			String sql = "select * from cart where pid=? and mid=?";			
	        pstmt= conn.prepareStatement(sql);    
	        pstmt.setString(1,pid);
	        pstmt.setString(2,mid);
	        rs=pstmt.executeQuery();
	        out.println("try 넘어옴");
	        if(rs.next()){	  
	        	int count = rs.getInt("quantity");
	        	pstmt.close(); 
	        	String upd = "update cart set quantity=? where pid=?"; //quantity, total 한꺼번에 업데이트 하는거 포기, bcase의 소계에 뜨는 금액을 겟파라미터로 보내서 주문 테이블에 뿌리기
	        	pstmt= conn.prepareStatement(upd);  
	        	pstmt.setInt(1,count+1);

	        	pstmt.setString(2,pid);
	        	pstmt.executeUpdate();	 
	        	out.println("상품있는거로 넘어옴" );
	        } else {	 
	        	pstmt.close();
	        	String sqls = "insert into cart values(?,?,?,?,?,?,?)";
	        	pstmt=conn.prepareStatement(sqls);
	        	pstmt.setString(1,pid);
	        	pstmt.setString(2,pname);
	        	pstmt.setInt(3,price);
	        	pstmt.setString(4,condition);
	        	pstmt.setInt(5,quantity);
	        	pstmt.setInt(6,price);  
	        	pstmt.setString(7,mid); 
	 			pstmt.executeUpdate();
	 			out.println("상품없어서 새로 추가");
	        }
			
		} catch(SQLException ex){
			out.println("넘기는거 실패함");
			out.println("실패<br>");
			out.println("SQLException : " + ex.getMessage());
		} finally{
	
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
		
		
		if (ids!=null){
			response.sendRedirect("product.jsp");
		} else{response.sendRedirect("product_bcase.jsp");}
		
	%>
	
	
</body>

</html>