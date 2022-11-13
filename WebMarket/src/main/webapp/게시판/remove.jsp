<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model1.board.BoardDTO" %>
<%@ page import = "model1.board.BoardDAO" %>


<%

	

	String remove = request.getParameter("remove");	
	String num = request.getParameter("num");
	BoardDAO dao=new BoardDAO();
	int count=dao.all()+1; //전체 게시글 수 +1
	
	if(remove!=null&&remove.equals("board")){	
		dao.reset(1);
		dao.close();
		response.sendRedirect("List.jsp");	
		
	} 
	
	else if(remove!=null&&remove.equals("set")){
		dao.boardset();
		dao.close();
		response.sendRedirect("List.jsp");	
	} 
	
	else if(remove!=null&&remove.equals("1")){
		dao.delete(num);
		dao.close();
		response.sendRedirect("List_edit.jsp");
	} 
	
	else if(count>=0){
		dao.dummy(count);
		dao.close();
		response.sendRedirect("List.jsp");	
	}
	
	
	
	

		
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
