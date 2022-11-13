<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		Statement stmt = null;
		PreparedStatement pstmt=null;

		try{
			String sql = "insert into product values(2,1,1,1,1,1,1,1,1)";
			pstmt= conn.prepareStatement(sql);			
			pstmt.executeUpdate();
			out.println("product 더미 생성 성공");

		} catch(SQLException ex){
			out.println("실패<br>");
			out.println("SQLException : " + ex.getMessage());
		} finally{

			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
	%>
	
</body>
</html>