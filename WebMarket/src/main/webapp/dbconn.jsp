
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%	
		Connection conn=null;
	
		String url = "jdbc:mysql://localhost:3306/jspWebMarket";
		String user = "root";
		String password="1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,user,password);
// 		out.println("데이터베이스 연결 성공");
	
	
	%>
