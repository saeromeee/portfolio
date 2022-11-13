<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<!DOCTYPE html>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>
<%@include file="dbconn.jsp" %> 
<html>

<head>
<%
	
	if(session.getAttribute("UserId")==null){
		%>
		<script>
			alert("로그인ㄱ ");
			location.href="product.jsp";
		</script>
<%	 } %>

<style>
.buttons{
border:0px; 
color:white;
background:#81BEF7;
}
img{
	width:200px;
	height:200px;
}

</style>

<meta charset="UTF-8">
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title>Welcome</title>

</head>


<body>	
	
	<%@ include file="nav.jsp" %>

 	<%! String greeting = "상품목록"; %> 
 	<% 	
		BoardDAO dao = new BoardDAO();
		String mid=(String)session.getAttribute("UserId");
		int mycount=dao.mybill((String)session.getAttribute("UserId"));	//내 게시글 갯수
 	///////////////////
 	
	 	ResultSet rs = null;
	    Statement stmt = null;
	    PreparedStatement pstmt=null;
	    
	    String sql = "select * from bill where mid = ? group by bid";	    
	    pstmt= conn.prepareStatement(sql);    
	    pstmt.setString(1, mid);
	    rs = pstmt.executeQuery();
 	
	 	Statement stmts =conn.createStatement();
		int blen=0; //상품개수이자 product 테이블의 행 갯수
	    ResultSet rss = stmts.executeQuery("SELECT COUNT(*) FROM cart");
	    if(rss.next()) blen = rss.getInt(1);
	    
     	Statement stm =conn.createStatement();
		int clen=0; //상품개수이자 cart 테이블의 행 갯수
	    ResultSet rsss = stm.executeQuery("SELECT COUNT(*) FROM bill where mid='"+mid+"'");
	    if(rsss.next()) clen = rsss.getInt(1);
	    
	   
 	%>
	<div class="jumbotron" style="display:flex; height:260px; margin-bottom:2px;" >
 		<div class = "container">
 			<h3 class="display-3">주문현황</h3>	
 		</div>
 		<div class = "container" style="margin-left:20%;">
 			<%if(session.getAttribute("UserId")==null){ %>
 			<jsp:include page="LoginForm.jsp" />
 						
 			<%} else{  		%>	
 			
 			<div style="margin-left:70%; display:flex;">
 			<p class ="navbar-brand" style="font-size:27px;" align="center">
 			<% out.print(session.getAttribute("UserName"));%>
 			
 			
			</div>
			
			<div style="margin-left:67%" style="display:flex;">
			<button type="button" class="btn btn-secondary" 
			onclick="location.href='product.jsp?id=<%=mid%>';">
			복귀
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
 	
 
	
	
	<br>
 	<div class="parent" style="width: 95%; margin-left:70px;  margin-bottom:20px; position:relative;">		
 		<div style="display:flex; position:relative;">
			<div>		
			<a href="./product_remove.jsp?id=delete">
			<button class="btn btn-secondary btn-sm" style="border:0px; background-color:#FBA9A5; border-radius: 5%;">비우기</button>
			</a>
			</div>

		</div>
		
 		<hr style="margin-right: 70px; "> 		 		
 		<div class="box" style=" display: flex; margin-right:70px;">
	 		<h4 style="width:35%; margin-left:20px;">주문코드</h4>
	 		<h4 style="width:26%;margin-left:8px;">소계</h4>	 		
	 		<h4 style="width:26%;margin-left:15px;">주문날짜</h4>
	 		<h4 >비고</h4>
 		</div>
 		<hr style="margin-right: 70px;">	

 		<%	 			 			
 		 	int sum = 0;
  			while(rs.next()){   	  
  				
  				String bid=rs.getString("bid");
  				int total=rs.getInt("total");
  				String bdate=rs.getString("regidate");
  				
  				
				out.println("<div class=\"child\"  onclick=\"location.href='product_order_info.jsp?bid="+bid+"';\" style=\"display: flex; margin-right:70px;\">");
				
	  			out.println("<h5 style=\"width:35%; \">"+bid+"</h5>");	  			
	  			
	 			out.println("<h5 style=\"width:28%; \">"+total+"원</h5>");
	 				 			
	 			out.println("<h5 style=\"width:25%; \">"+bdate+"</h5>");	
	 				 			
	 			out.println("<p style=\" padding-left:25px;\"><a href=\"./product_remove.jsp?bid="+
	 				rs.getString("bid")+
	 		 		"\"><button class=\"btn btn-secondary btn-sm\" style=\"border:0px; background-color:#FBA9A5; border-radius: 5%;\">주문취소</button></a>"); //삭제
	 			
	 			 		 			
	 			out.println("</div>");	 
	 			out.println("<hr style=\"margin-right: 70px;\">");
	 			sum+=total;
 			 }
  			out.println("<div style=\"margin-right:90px;\"><h5 style=\"margin-left:35%;\">총액 : " + sum + "</h5></div>"); 	
  				
 		%> 	 
 		<a href="./product.jsp"><button class="btn btn-secondary btn-sm" style="border:0px; background-color:#A1C7E0; border-radius: 5%;">쇼핑 계속</button></a>
	 	</div>
	 	
	 	
	
	
	
	<br>
	<br>
	
	<%@ include file="footer.jsp" %>
	
</body>
</html>