<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>
<%@include file="dbconn.jsp" %> 
<html>

<head>

<style>
.buttons{
border:0px; 
color:white; 
background:#81BEF7;\"
}
</style>

<meta charset="UTF-8">
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>

</head>
<body>
	<%	String mid=(String)session.getAttribute("UserId");
		String pid=request.getParameter("id"); 
		
   		Statement stm =conn.createStatement();
	  	int clen=0; //상품개수이자 cart 테이블의 행 갯수
   		ResultSet rsss = stm.executeQuery("SELECT COUNT(*) FROM cart where mid='"+mid+"'");
    	if(rsss.next()) clen = rsss.getInt(1);
	%>
	
	<%@ include file="nav.jsp" %>
 
  	  	  	
	<div class="jumbotron" style="display:flex; height:260px; margin-bottom:2px;" >
 		<div class = "container">
 			<h3 class="display-3">상품정보</h3>	
 		</div>
 		<div class = "container" style="margin-left:20%;">
 			<%if(session.getAttribute("UserId")==null){ %>
 			<jsp:include page="LoginForm.jsp" />
 						
 			<% session.setAttribute("pd",1);} else{  		%>	
 			
 			<div style="margin-left:60%; display:flex;">
 			<p class ="navbar-brand" style="font-size:27px;" align="center"><% out.print(session.getAttribute("UserName")+
 					" : ");%>장바구니(<%=clen %>)
 			
 			
			</div>
			
			<div style="margin-left:67%" style="display:flex;">
			<button type="button" class="btn btn-secondary" 
			onclick="location.href='product_bcase.jsp?id=<%=mid%>';">
			카트
			</button>
			
			<button type="button" class="btn btn-secondary" 
			onclick="location.href='LoginForm.jsp?outs=outss';"
			style="margin-left:3%;">
			로그아웃
			</button>
			</div>
			<% } %>
 		</div> 		
 	</div>
 		
 		
 	<div class="parent" style="width: 100%; left:70px; margin-bottom:20px; position:relative; display:flex;">	
 		<div>
 			<%
	 			ResultSet rs = null;	 		   
	 		    PreparedStatement pstmt=null;
	 		    
	 		    String sql = "select * from product where pid='" + pid + "'";
	 		    pstmt= conn.prepareStatement(sql);    
	 		    rs = pstmt.executeQuery(sql);
 			%>
 		
 			<%
 				
	 			if(rs.next()){
	 				out.println("<img src=\""+
	 				rs.getString("filename")+
	 				"\" style=\"width:400px; height:400px; margin-right:5%;\"></img>");
	 				out.println("</div> <div style=\"margin-left:2%;\">");
	 							
				 	out.println("<h3>"+rs.getString("pname")+"</h3><br>");	 	
				 	out.println("<p>"+rs.getString("info")+"<br>");
				 	out.println("<p>상품코드 : <button class=\"btn btn-secondary btn-sm\""+
				 			"style=\"border:0px; background-color:#FB654A; border-radius: 5%;\">"+
				 			rs.getString("pid")+
				 			"</button><br>");
				 	out.println("<p>제조사 : "+rs.getString("manufacturer")+"<br>");
				 	out.println("<p>분류 : "+rs.getString("category")+"<br>");
				 	out.println("<p>재고 수 : "+rs.getInt("stock")+"<br>");
				 	out.println("<p> 컨디션 : "+rs.getString("conditions")+"<br>");
				 	out.println("<h4>"+rs.getInt("price")+"원</h4>"+"<br>");
			%>
			
				 	<a href="./product_buy_return.jsp?id=<%= pid %>&pname=
	 			<%=rs.getString("pname") %>&price=<%=rs.getInt("price")%>&conditions=<%=rs.getString("conditions") %>">
	 			<button class="btn btn-secondary btn-sm" style="border:0px; background-color:#A1C7E0; border-radius: 5%;">주문</button></a>
			<%
				 	out.println("<a href=\"./product.jsp\"><button class=\"btn btn-secondary btn-sm\" style=\"border:0px; background-color:#A1C7E0; border-radius: 5%;\">상품목록</button></a><br>"); 
				
	 			}
 						
	 			
 			%>
 		</div>
 		
	 	
	</div>	
	<hr>

	
	
 	<footer class = "container" style="position:relative; bottom:0; left:0;" > 	
	<p style="left:0;">&copy;WebMarket </p>
	</footer>
	
	</div>
</body>

<%-- <%@ include file="footer.jsp" %> --%>
</html>