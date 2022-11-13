<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>


<html>
<head>

<%
if((String)session.getAttribute("UserId")!=null){
	%>
	<script>
		alert("이미 회원");
		location.href="product.jsp";
	</script>
	<%
}
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

 	<%! 
 	String greeting = "회원가입" ; 		
  	%> 
 	
 	<div class="jumbotron">
 		<div class = "container">
 			<h1 class="display-3">
 			 	<%= greeting %>
 			</h1>
 		</div>
 	</div>
 	
 	

 	<div class="parent" style="width: 100%; height: 200px; position:relative;">		
 	
		<script type="text/javascript">
			function CheckAddProduct(){
				formA.submit();
			}		
		</script>
	
		<div class="child" style="margin-left:11%;">
			<p> 아이디
			<p> 비밀번호
			<p> 비밀번호 확인
			<p> 본명		
			<p> 성별
			<p> 생일
			<p> 이메일
			<p> 전화번호
			<p> 주소 : 	
			<p><input type = "submit" value="등록"  onclick="CheckAddProduct();"
				class="btn btn-secondary" style="border:0px;"> 
			<input type = "submit" value="취소"  onclick="location.href='product.jsp';"
				class="btn btn-secondary" style="border:0px;"> 
		</div>
		<div class="form-floating">
	    <form   name="formA"  action = "signup_process.jsp" method="post">
		    <p> <input type = "text" class="form-control" id="floatingInput" name = "mid"/> 
		    <p> <input type = "text" class="form-control" id="floatingInput" name = "pwd"/>
		    <p> <input type = "text" class="form-control" id="floatingInput" name = "pwd2"/>     
		    <p> <input type = "text" class="form-control" id="floatingInput" name = "name"/>
		    <p> <input type = "radio" name = "gen" value = "man" >남자 	
		    	<input type = "radio" name = "gen" value = "woman">여자
		    <p> <input type = "text" class="form-control" id="floatingInput" name = "birth">
		    <p> <input type = "text" class="form-control" id="floatingInput" name = "email">
		    <p> <input type = "text" class="form-control" id="floatingInput" name = "phone">
		    <p> <input type = "text" class="form-control" id="floatingInput" name = "addr">             
	    </form>
   		</div>
   </div>
	
	
	

	
</body>
</html>