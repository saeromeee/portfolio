<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model1.board.BoardDTO" %>
<%@ page import = "model1.board.BoardDAO" %>


<%
	String title = request.getParameter("Title");
	String content = request.getParameter("Content");
	String id=(String)session.getAttribute("UserId");
	out.println("title");
	out.println("content");
	out.println("id");
	
	BoardDAO dao=new BoardDAO();
	BoardDTO dto=new BoardDTO();
	
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId(id);
	
	dao.insertWrite(dto);
	dao.close();

		response.sendRedirect("List.jsp");	
%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>

<body>

</body>
</html>
