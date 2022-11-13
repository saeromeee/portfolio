<!-- ? -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>?</title>
</head>
<body>

   <%@include file="dbconn.jsp" %>   
   
   <table width="300" border="1">
      <tr>
         <th>아이디</th>
         <th>비밀번호</th>
         <th>이름</th>
      </tr>
   
<%
      ResultSet rs = null;
      Statement stmt = null;
      
      try {
         String sql = "select * from member";
         stmt = conn.createStatement();
         rs = stmt.executeQuery(sql);
         
         while (rs.next()) {
            String id = rs.getString("id");
            String pw = rs.getString("pw");
            String name = rs.getString("name");
%>
            <tr style="text-align: center;">
               <td><%= id %></td>
               <td><%= pw %></td>
               <td><%= name %></td>
            </tr>
<%
         }
      }
      
      catch(SQLException ex) {
         out.print("member 테이블 호출 실패<br>");
         out.print("SQLException : " + ex.getMessage());
      }
      
      finally {
         if (rs != null) rs.close();
         if (stmt != null) stmt.close();
         if (conn != null) conn.close();
      }
%>


   </table>
   
</body>
</html>