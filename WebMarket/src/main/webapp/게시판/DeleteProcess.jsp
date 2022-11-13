<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model1.board.BoardDTO" %>
<%@ page import = "model1.board.BoardDAO" %>

<%
	String num = request.getParameter("num"); 
	
	BoardDAO dao = new BoardDAO();	 // 기능 메서드
	BoardDTO dto = dao.selectView(num);  // num의 아이디를 가진 게시물 담는 객체 메서드
	dao.deletePost(dto);
	dao.close();
	response.sendRedirect("List.jsp");
%>
