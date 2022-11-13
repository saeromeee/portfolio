<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model1.board.BoardDTO" %>
<%@ page import = "model1.board.BoardDAO" %>

<%
	String num = request.getParameter("num"); 
	
	BoardDAO dao = new BoardDAO();
	dao.updateVisitCount(num); //조회수 +1
	
	int mycount=dao.mycount((String)session.getAttribute("UserId"));
	String id=(String)session.getAttribute("UserId");
	BoardDTO dto = dao.selectView(num);
	dao.close();

%>



<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원 게시판</title>
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<script>
	function deletePost(){		
		if(confirm("삭제?")){
			location.href="DeleteProcess.jsp?num=<%=num%>"		
		}
	}
</script>


<body>
<jsp:include page="Link.jsp"/>

	<div class="jumbotron" style="display:flex; height:250px;" >
 		<div class = "container">
 			<h3 class="display-3">상세보기</h3>	
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

<form name="writerFrm">
	<input type="hidden" name="num" value="<%=num %>"/>
	<table class="table table-hover" align="center" style="width:90%;">
		<tr>
			<td><h4>번호</h4></td>
			<td><p style="font-size:24px;"><%=dto.getNum()%></td>
			<td><h4>작성자</h4></td>
			<td><p style="font-size:24px;"><%=dto.getName() %></td>
		</tr>
			
		<tr>
			<td><h4>작성일</h4></td>
			<td><p style="font-size:24px;"><%=dto.getPostdate() %></td>
			<td><h4>조회수</h4></td>
			<td><p style="font-size:24px;"><%=dto.getVisitcount() %></td>
		</tr>
		
		<tr>
			<td><h4>제목</h4></td>
			<td colspan="3"><p style="font-size:24px;"><%=dto.getTitle() %></td>
			
		</tr>
		<tr>
			
			<td><h4>내용</h4></td>
			<td colspan="3" height="100"><p style="font-size:24px;"><%=dto.getContent().replace("\r\n","<br/>") %></td>
		</tr>
	
		<tr>
			<td colspan="4" align="center">
				<%if(session.getAttribute("UserId")!=null &&session.getAttribute("UserId").toString().equals(dto.getId())) { %> <%-- 로그인 페이지 만들기 --%>
				
				 <%-- Edit.jsp 만들기 --%>
				<button type="button" class="btn btn-secondary" onclick="location.href='Edit.jsp?num=<%=dto.getNum()%>';">수정하기</button>
				
				
				<button type="button" class="btn btn-secondary" onclick="deletePost();">삭제하기</button>
				<% } else { %>
				<button type="button" class="btn btn-secondary" onclick="location.href='List.jsp';">목록보기</button>
				<% } %>
			</td>
	
		</tr>
	
	</table>
</form>












   
</body>
</html>
