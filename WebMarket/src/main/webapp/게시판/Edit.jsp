<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model1.board.BoardDTO" %>
<%@ page import = "model1.board.BoardDAO" %>

<%
	String num = request.getParameter("num"); 
	
	
	BoardDAO dao = new BoardDAO();		
	BoardDTO dto = dao.selectView(num);
	int mycount=dao.mycount((String)session.getAttribute("UserId"));
	String id=(String)session.getAttribute("UserId");
	dao.close();

%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>게시물 수정</title>
</head>



<body>
<jsp:include page="Link.jsp"/>

	<div class="jumbotron" style="display:flex; height:250px;" >
 		<div class = "container">
 			<h3 class="display-3">수정</h3>	
 		</div>
 		<div class = "container" style="margin-left:10%;"  >
 			<%if(session.getAttribute("UserId")==null){ %>
 			<jsp:include page="LoginForm.jsp" />
 						
 			<%} else{  		%>	
 			
 			<div style="margin-left:60%; display:flex;">
 			<p class ="navbar-brand" style="font-size:27px;" align="center"><% out.print(session.getAttribute("UserName")+
 					" : ");%>내가 쓴 글(<%=mycount %>)
 			
 			
			</div>
			
			<div style="margin-left:67%" style="display:flex;">
			<button type="button" class="btn btn-secondary" 
			onclick="location.href='List_my.jsp?id=<%=id%>';">
			내정보
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

<form name="writerFrm" action='Edit_process.jsp?num=<%=dto.getNum()%>'>
	<input type="hidden" name="num" value="<%=num %>"/>
	<table class="table table-hover" align="center" style="width:90%;">
		
		<tr>
			<td><p style="font-size:24px;">번호</td>
			<td><p style="font-size:24px;"><%=dto.getNum() %></td>
			<td><p style="font-size:24px;">작성자</td>
			<td><p style="font-size:24px;"><%=dto.getName() %></td>
		</tr>
			
		<tr>
			<td><p style="font-size:24px;">작성일</td>
			<td><p style="font-size:24px;"><%=dto.getPostdate() %></td>
			<td><p style="font-size:24px;">조회수</td>
			<td><p style="font-size:24px;"><%=dto.getVisitcount() %></td>
		</tr>
		
		<tr>
			<td><p style="font-size:24px;">제목</td>
			<td colspan="3"><p><input type="text" name="Title" class="form-control"
			style="border-radius: 7px;"></td>
			
		</tr>
		<tr>
			
			<td><p style="font-size:24px;">내용</td>
			<td colspan="3" height="100"><p><input type="text" class="form-control"
			style="border-radius: 7px; height:200px;font-size:30px;" name="Content"></td>
		</tr>
	
		<tr>
			<td colspan="4" align="center">
				<input type="submit" class="btn btn-secondary" value="등록하기">
			</td>
	
		</tr>
	
	</table>
</form>

</body>
</html>
