<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model1.board.BoardDTO" %>
<%@ page import = "model1.board.BoardDAO" %>
<%@ page import ="java.time.LocalDate"%>
<%@ page import ="java.time.format.DateTimeFormatter"%>



<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>게시물 작성</title>
</head>



<body>
<jsp:include page="Link.jsp"/>
<div class="jumbotron" style="display:flex; height:250px;" >
 		<div class = "container">
 			<h3 class="display-3">작성(write)</h3>	
 		</div>
 		<div class = "container" style="margin-left:10%;"  >
 			<%if(session.getAttribute("UserId")==null){ %>
 				<script>
 					alert("로그인 하셈");
 					location.href="List.jsp?log=1";
 				</script>
 			<%  } else{ %>	
 			<p class = "navbar-brand" style="margin-left:67%"> <% out.print(session.getAttribute("UserName")+"님 ㅎㅇ"); %>	</p>
			<% } %>
 		</div>
 		
 	</div>

<form name="writerFrm" action='Write_process.jsp'>
	<input type="hidden" name="num" />
	<table class="table table-hover" align="center" style="width:90%;">
		
		<tr>
			
			<td><h4>작성자</h4></td>
			<td colspan="3"> 
				<h4> <%=session.getAttribute("UserName") %> </h4>
			</td>
			
		</tr>
		<tr>
			<td><h4>작성일</h4></td>
			<td><h4><%=LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd")) %></h4></td>
			
		</tr>
		
		<tr>
			<td><h4>제목</h4></td>
			<td colspan="3"><p><input type="text" name="Title" class="form-control"
			style="border-radius: 7px;"></td>
			
		</tr>
		<tr>
			
			<td><h4>내용</h4></td>
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
