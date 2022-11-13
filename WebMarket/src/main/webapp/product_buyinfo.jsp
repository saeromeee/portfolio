<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
    <%@page import="java.sql.*" %>    
<!DOCTYPE html>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>
<%@include file="dbconn.jsp" %> 
<html>

<head>

<%
	int clen=request.getParameter("clen")!=null?Integer.parseInt(request.getParameter("clen")):0;
 	String pdate=request.getParameter("pdate"); 
	String addr=request.getParameter("addr");
	String addrNum=request.getParameter("addrNum");
	String name=request.getParameter("name");
	
	if(pdate==""||addr==""||addrNum==""||name==""){
		%>
		<script>
			alert("배송정보를 전부 입력하세요");
			location.href="product_post.jsp?clen="+<%=clen%>;
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

	<%
	Statement stmts =conn.createStatement();
	int blen=0; //상품개수이자 cart 테이블의 행 갯수
    ResultSet rss = stmts.executeQuery("SELECT COUNT(*) FROM cart");
    if(rss.next()) blen = rss.getInt(1);
    

   
    
    ResultSet rs = null;
    Statement stmt = null;
    PreparedStatement pstmt=null;
    String mid=(String)session.getAttribute("UserId");
    
    Statement stm =conn.createStatement();
    clen=0; //상품개수이자 cart 테이블의 행 갯수
    ResultSet rsss = stm.executeQuery("SELECT COUNT(*) FROM cart where mid='"+mid+"'");
    if(rsss.next()) clen = rsss.getInt(1);
    
    
    String sql = "select * from cart where mid=?";
    pstmt= conn.prepareStatement(sql); 
    pstmt.setString(1, mid);
    rs = pstmt.executeQuery();
	%>

	<%@ include file="nav.jsp" %>

 	
	<div class="jumbotron" style="display:flex; height:260px; margin-bottom:2px;" >
 		<div class = "container">
 			<h3 class="display-3">주문내역</h3>	
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
<!--  영수증 폼정보 전송 -->
 	<div>
	    <form name="bill"  action = "product_buy_end_order.jsp" method="post" style="margin-left:5%; width:90%; background:#F0FAFD;">
			<div style="width: 90%; left:70px; margin-bottom:20px; position:relative;">	
			 
			 
				<div style="margin-left:45%; margin-top:3%;"><h2 style="margin-top:3%;">영수증</h2></div>
				
				<div style="">
				<p style="float:right;"> 배송일 : <%= pdate %>
				<p >배송 주소 : <%=addr%>
				<p> 성명 : <%=name%>
				<p> 우편번호 : <%=addrNum%>	
				<p> (한국)
				</div>	
				
			</div>
	
	
	
			<div class="parent" style="width: 95%; margin-left:70px;  margin-bottom:20px; position:relative;">		
		 		
				
		 		<hr style="margin-right: 70px; "> 		 		
		 		<div class="box" style=" display: flex; margin-right:70px;">
			 		<h4 style="width:30%; margin-left:20px;">상품</h4>
			 		<h4 style="width:30%;margin-left:8px;">가격</h4>
			 		<h4 style="width:30%;margin-left:-20px;">수량</h4>
			 		<h4 style="width:10%;margin-left:15px;">소계</h4>
			 		
		 		</div>
		 		<hr style="margin-right: 70px;">	
		 		
		 		<%	 			 			
		 			int sum = 0;
		  			while(rs.next()){   	  				
						out.println("<div class=\"child\" style=\"display: flex; margin-right:70px;\">");
						
			  			out.println("<h5 style=\"width:30%; \">"+
			  				rs.getString("pname")+"</h5>");	  			
			  			
			 			out.println("<h5 style=\"width:30%; \">"+
			 					rs.getInt("price")+"원</h5>");
			 			
			 			out.println("<h5 style=\"width:30%;\">"+					
			 					rs.getInt("quantity")+		 				
			 				"</h5>"); 	
			 			
			 			out.println("<h5 style=\"width:10%; \">"+
			 					rs.getInt("price")*rs.getInt("quantity")+"원</h5>");	
			 			
			 			out.println("</div>");	 
			 			out.println("<hr style=\"margin-right: 70px;\">");
			 			sum+=rs.getInt("price")*rs.getInt("quantity");
			 			
			 			String pid=rs.getString("pid");
			 			productDAO.setbuy(pid);
		 			 }
		  			 	
		  				
		 		%> 	 
					<div style="margin-left:0; width:100%; display : flex;">
					
						<a href="./product_buy_end_order.jsp?pdate=<%= pdate %>"><button class="btn btn-secondary btn-sm" 
						style="border:0px; background-color:#A1C7E0; border-radius: 5%;">주문완료</button></a>
						
						<a href="./product.jsp"><button class="btn btn-secondary btn-sm" 
							style="margin-left:14%; border:0px; background-color:#A1C7E0; border-radius: 5%;">이전</button></a>
							
						<a href="./product_buy_cancel.jsp"><button type="button" class="btn btn-secondary btn-sm" 
							style="margin-left:25%; border:0px; background-color:#A1C7E0; border-radius: 5%;">취소</button></a>
							
						<h5 style="margin-left: 65%;">총액 : <%= sum %> </h5>
						
					</div>
			</div>
			
	 		<input type="hidden" name="addr" value="<%=request.getParameter("addr")%>">
			<input type="hidden" name="uname" value="<%=request.getParameter("name")%>">
			<input type="hidden" name="addrNum" value="<%=request.getParameter("addrNum")%>">
			<input type="hidden" name="pdate" value="<%=pdate%>"> 
			<input type="hidden" name="sum" value="<%=sum%>"> 
			<input type="hidden" name="bid" value="<%=productDAO.ran(25)%>"> 

			 
		 </form>
	 </div>
	 			
	 	
	
	
	<br>
	<br>
	
	<%@ include file="footer.jsp" %>
	
</body>
</html>