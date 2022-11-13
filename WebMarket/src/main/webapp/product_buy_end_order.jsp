
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
		String addr=request.getParameter("addr");
		String uname=request.getParameter("uname"); 
		String addrNum=request.getParameter("addrNum");
		String pdate=request.getParameter("pdate");		
		String bid=request.getParameter("bid");
		String total=request.getParameter("sum");
		
		out.println("mid :" + mid+ "<br>");
		out.println("addrNum :" + addrNum+ "<br>");
		out.println("pdate :" + pdate+ "<br>");
		out.println("bid :" + bid+ "<br>");
		out.println("total :" + total+ "<br>");
		out.println("unmae : "+ uname+"<br>");

  	%> 
		<% 
		try{	
			
						
				//로그인 한 아이디로 카트 내역 찾아와서 빌 내역에 저장			
				String sql = "select * from cart where mid=?";			
		        pstmt= conn.prepareStatement(sql);    
		        pstmt.setString(1,mid);
		        rs=pstmt.executeQuery();
		        int count=0;
		        int price=0;
		        String pname=null;
		        String pid=null;
				while(rs.next()){
		        	count = rs.getInt("quantity");	        	
		        	pname=rs.getString("pname");
		        	price=rs.getInt("price");	
		        	pid=rs.getString("pid");
		        	
		        	String upd = "insert into bill(pid,pname,price,quantity,total,addr,uname,addrnum,bid,mid) values(?,?,?,?,?,?,?,?,?,?)"; 
		        	pstmt= conn.prepareStatement(upd);  
		        	pstmt.setString(1,pid);
		        	pstmt.setString(2,pname);
		        	pstmt.setInt(3,price);
		        	pstmt.setInt(4,count);	        	
		        	pstmt.setString(5,total);
		        	pstmt.setString(6,addr);
		        	pstmt.setString(7,uname);
		        	pstmt.setString(8,addrNum);
		        	pstmt.setString(9,bid);
		        	pstmt.setString(10,mid);
		        	pstmt.executeUpdate();
		        	
		        	
		        	out.print("주문 성공");
	        	}	  
				pstmt.close();
				String dt = "delete from cart where mid='"+mid+"'";
	        	pstmt= conn.prepareStatement(dt);    		      
		        pstmt.executeUpdate();

			
		} catch(SQLException ex){
			out.println("빌 등록 실패");
			out.println("실패<br>");
			out.println("SQLException : " + ex.getMessage());
		} finally{
	
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
		
		
		
			response.sendRedirect("product_buy_end.jsp?bid="+bid+"&pdate="+pdate);
		
		
	%>
	<%=pdate %>
	
</body>

</html>