<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<!DOCTYPE html>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>
<%@include file="dbconn.jsp" %> 

<html>
<head>

<%	
	int clen=request.getParameter("clen")!=null?Integer.parseInt(request.getParameter("clen")):0;
	if(Integer.parseInt(request.getParameter("clen"))==0){
		%>
		<script>
			alert("상품이 없습니다!");
			location.href="product_bcase.jsp";
		</script>
<%	 }
String mid=(String)session.getAttribute("UserId");
Statement stm =conn.createStatement();
clen=0; //상품개수이자 cart 테이블의 행 갯수
ResultSet rsss = stm.executeQuery("SELECT COUNT(*) FROM cart where mid='"+mid+"'");
if(rsss.next()) clen = rsss.getInt(1);

%>

<style>
.buttons{
border:0px; 
color:white;
background:#81BEF7;
}
.parent {
    display: flex;
}
.child {
       
    padding : 
}
input{
	
}
p{
height:30px;
margin:16px;
}

</style>
<meta charset="UTF-8">
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>


<body>
	
	<%@ include file="nav.jsp" %>


 	
	<div class="jumbotron" style="display:flex; height:260px; margin-bottom:2px;" >
 		<div class = "container">
 			<h3 class="display-3">배송정보</h3>	
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
 	
 	

 	<div class="parent" style="padding-top:2%; position:relative;">		
 	
	<script type="text/javascript">

	function submit(){
		formA.submit();
	}
		
	</script>
	
	<div class="child" style="margin-left:150px;">
	<p> 성명
	<p> 배송일
	<p> 국가명
	<p> 우편번호 
	<p> 주소
	
	</div>
	
	
    <form name="formA"  action = "product_buyinfo.jsp?clen=<%=clen %>" method="post">
     <p> <input type = "text" class="form-control" id="floatingInput" name = "name" /> 
     <p> <input type = "text" class="form-control" id="floatingInput" name ="pdate" />
     <p> <input type = "text" class="form-control" id="floatingInput" name = "country" />
     <p> <input type = "text" class="form-control" id="floatingInput" name = "addrNum" />
     <p> <input type = "text" class="form-control" id="floatingInput" name = "addr" />
               
   </form>
   
	
   </div>
   	<div style = "margin-left: 150px; ">
	<p style="float:left;"> <input type = "button" value="이전" onclick="location.href='product_bcase.jsp';" class="btn btn-secondary"
		style="border:0px; background-color:#A1C7E0; color:white; border-radius: 5%;"> 
	<p style="float:left;"> <input type = "submit" value="등록"  onclick="submit()" class="btn btn-secondary"
		style="border:0px; background-color:#A1C7E0; color:white; border-radius: 5%;"> 
	<p style="float:left;"> <input type = "button" value="취소" onclick="location.href='product.jsp';" class="btn btn-secondary "
		style="border:0px; background-color:#A1C7E0; color:white; border-radius: 5%;"> 
	</div>
	

	
</body>
</html>