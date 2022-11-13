<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model1.board.BoardDTO" %>
<%@ page import = "model1.board.BoardDAO" %>
<%@ page import = "membership.MemberDTO" %>
<%@ page import = "membership.MemberDAO" %>

<%
	request.setCharacterEncoding("UTF-8");
	out.println("넘어오기전");
	String id = (String)session.getAttribute("UserId");
	String name= request.getParameter("name");
	
	out.println(name+": 폼에서 넘어오 이름");
	
	MemberDAO dao=new MemberDAO();
	MemberDTO dto=new MemberDTO();
	
	
	dto.setName(name);
	dto.setId(id);
	
	
	
	dao.insertme(dto);
	dao.close();
	
	session.setAttribute("UserName", name);
	response.sendRedirect("List_my.jsp?id="+id);	
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
