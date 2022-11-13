<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>

<head>
<style>
<%@ include file="style.jsp" %>
</style>
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>

<body>
	<%
		ProductRepository dao=new ProductRepository();
		request.setAttribute("dao",dao);  
		String path=request.getContextPath();
	%>
	
	<c:set var="mid" value="${UserId}"/>
	<c:set var="pro" value="${dao.pro()}"/>
	<c:set var="len" value="${dao.pro().size()}"/>
	<c:set var="clen" value="${dao.clen(UserId)}"/>

	<%@ include file="nav.jsp" %>
 	
	<div class="jumbotron" style="display:flex; height:260px; margin-bottom:2px;" >
 		<div class = "container">
 			<h3 class="display-3" style="float:left;">상품목록</h3>	
 			<c:choose>
 				<c:when test="${UserId eq null }">
 					<jsp:include page="LoginForm.jsp" />
 					<%session.setAttribute("pd",1); %>
 				</c:when>
 				<c:otherwise>
		 			<div style="margin-left:75%; display:flex;">
			 			<p class ="navbar-brand" style="font-size:27px;" align="center">
			 			<% out.print(session.getAttribute("UserName")+" : ");%>장바구니(${clen })
					</div>
					
					<div style="margin-left:75%" style="display:flex;">
						<a id="login" href="product_bcase.jsp?id=${mid}">카트</a>
						<a id="login" href="product_order.jsp">주문</a>
						<a id="login" href="LoginForm.jsp?outs=outss">로그아웃</a>						
					</div> 					
 				</c:otherwise>
 			</c:choose> 			
 		</div> 		
 	</div>
 	
	<div class="container"  >
		<br>
		<form style="float:left; margin-right:1%;">
			<select name='products' style="margin-left:2%;">
				<option>상품목록</option>
				<c:if test="${len>0 }">
					<c:forEach var="i" begin="0" end="${len-1}">
						<option> ${pro.get(i).getPname()}</option>
					</c:forEach>
				</c:if>
			</select>
		</form>
		
		<a id="pmenu" href="./product_set.jsp">상품 등록</a>		
		<a id="pmenu" href="<%=path%>/servlet/controller.do?m=dummy&i=${len}">더미생성</a>		
		<a id="pmenu" href="<%=path%>/servlet/controller.do?m=set">기초세팅</a>		
		<a id="pmenu" href="<%=path%>/servlet/controller.do?m=reset">전체삭제</a>
		
	</div><br>
	
 	<div class="container" >		
 		<c:if test="${len>0 }">
		 	<c:set var="arr" value="${(len%3>0) ? len/3+1 : len/3}"/>
		 	<c:set var="count" value="0"/>	 	
		 	<c:forEach var="k" begin="0" end="${arr-1}">
		 		<c:set var="count" value="0"/>
		 		<c:set var="a" value="${(len%3!=0)?(k<=len/3-1) ? 3:(len%3==1)?1:2 : 3}"/>
		 		<c:set var="loop_flag" value="false" />
		 		
		 		<div class="childs"> 		
			 		<c:forEach var="i" begin="${0}" end="${a-1}">
			 			<div class="child">
			 				<img src="${pro.get(i+k*3).getFilename()}"/>
			 				<h3>${pro.get(i+k*3).getPname()}</h3>
			 				<p>${pro.get(i+k*3).getDescription()}</p>
			 				<p>${pro.get(i+k*3).getUnitPrice()}</p>
			 				<a id="pro" href="./product_info.jsp?id=${pro.get(i+k*3).getProductID()}">상세정보</a>				 			
				 			<a id="pro" href="./product_buy_return.jsp?id=${pro.get(i+k*3).getProductID() }&ids=1&pname=${pro.get(i+k*3).getPname()}&price=${pro.get(i+k*3).getUnitPrice()}&conditions=${pro.get(i+k*3).getCondition()}">담기</a>
				 		</div>
				 		<c:set var="count" value="${count+1}"/>
			 		</c:forEach>
				</div><hr>				
			</c:forEach>
		</c:if>
		<c:if test="${len==0 }">
			
			<h3 style="text-align:center; margin-top:10%; margin-bottom:10%;">게시글이 존재하지 않습니다.</h3>
			
		</c:if>
		
	</div><br><br>
	
	<%@ include file="footer.jsp" %>
	<div class = "container">
	
	</div>
	
</body>
</html>