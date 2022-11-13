<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    

    
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>
	<%	
		Connection conn=null;
	try{
		String url = "jdbc:mysql://localhost:3306/jspWebMarket";
		String user = "root";
		String password="1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,user,password);
		out.println("데이터베이스 연결 성공");
	} catch(SQLException ex){
		out.println("데베 연결실패<br>");
		out.println("SQLException: "+ex.getMessage());
	}finally{
		if(conn!=null) conn.close();
	}
	%>
	
	
</body>

</html>