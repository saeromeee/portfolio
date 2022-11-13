<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>


<html>
<head>
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
 	String greeting = "상품등록" ; 		
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
// 		var form = document.formA;		
// 		var a =/^p[p\d]{5,12}/g;	
// 		var b =/^.{1,12}$/;  
// 		var c = /^[+-]?\d*(\.?\d*)?$/;
// 		var d = /\d/;

// 		if(a.test(form.productID.value)==false){
// 			alert("양식에 맞는 코드 입력하시오(P,5~12)");
// 			return false;
// 		}
		
// 		if(b.test(form.pname.value)==false){
// 			alert("4-12자리 문자 입력");		
// 			return false;
// 		} 
		
// 		if(c.test(form.unitPrice.value)==false){
// 			alert("숫자(음수입력 불가, 소수점 둘째자리)");
// 			return false;
// 		}
		
// 		if(d.test(form.unitsInStock.value)==false){
// 			alert("숫자만");		
// 			return false;
// 		}			
		
// 		else {form.submit()}
		formA.submit();
	}
		
	</script>
	
	<div class="child" style="margin-left:11%;">
	<p> 상품코드
	<p> 상품명
	<p> 가격
	<p style="height:75px; margin:16px;"> 상세정보 : 
	<p> 제조사
	<p> 분류
	<p> 재고 수
	<p> 상태
	<p> 이미지
	<p> <input type = "submit" value="등록"  onclick="CheckAddProduct()"
		style="border:0px; background-color:#A1C7E0; color:white; border-radius: 5%;"> 

	</div>
	
	
    <form name="formA"  action = "<%=request.getContextPath()%>/servlet/controller.do?m=pset" method="post" enctype="multipart/form-data">
     <p> <input type = "text" class="form-control" id="floatingInput" name = "productID"/> 
     <p> <input type = "text" class="form-control" id="floatingInput" name ="pname"/>
     <p> <input type = "text" class="form-control" id="floatingInput" name = "unitPrice"/>
     <p style="height:75px; margin:16px;">     
     <input type = "text" name = "description" class="form-control" id="floatingInput" style="width:258.44px; height:78.14px;"/>
     <p> <input type="text" class="form-control" id="floatingInput" name = "manufacturer" value ="">
     <p> <input type="text" class="form-control" id="floatingInput" name = "category" value ="">
     <p> <input type="text" class="form-control" id="floatingInput" name = "unitsInStock" value ="">
     <p> <input type = "radio" name = "condition" value = "new" > 신규 제품
      	 <input type = "radio" name = "condition" value = "old"> 중고 제품
     	 <input type = "radio" name = "condition" value = "re"> 재생 제품   
     <p> <input type="file" name = "filename">             
   </form>
   
	
   </div>
	
	
	

	
</body>
</html>