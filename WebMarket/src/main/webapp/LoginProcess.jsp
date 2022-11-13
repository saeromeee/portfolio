<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "membership.MemberDTO" %>
<%@ page import = "membership.MemberDAO" %>
<%@ page import = "model1.board.BoardDAO" %>

<%   
	request.setCharacterEncoding("UTF-8");
	BoardDAO daos=new BoardDAO();	
	if(request.getParameter("UserName")!=null){
	String name = request.getParameter("UserName");
	String pwd = request.getParameter("user_pw");
	String id=request.getParameter("user_id");	
	
// 	out.println("이름 : " + name);
// 	out.println("비번 : " + pwd);
// 	out.println("아이디 : " + id);
	if(daos.idcheck(id)==1){ //아이디가 중복되지 않으면 
		daos.sign(id, pwd, name);	
		daos.close();
		
		session.setAttribute("UserId", id);
		session.setAttribute("UserName", name);
		
		response.sendRedirect("product.jsp");
		} else if(daos.idcheck(id)==0) { %>
		
		<script>
			alert("아이디 중복임");
			location.href="product.jsp?sign=1";
		</script>
		
		<%  }
	} else{
		String log=request.getParameter("log"); //로그인으로 인해 글쓰기 못한 경우 체크
		String userId= request.getParameter("user_id");
		String userPwd= request.getParameter("user_pw");
		MemberDAO dao = new MemberDAO(); // 멤버객체 생성하고 빈객체 리턴
		MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd); //빈 멤버객체에 아이디 패스워드 일치하는 멤버 담아서 멤버객체 리턴 
		
		if(memberDTO.getId()!=null && log.equals("1")){ //회원이고 글쓰려 했으면
			session.setAttribute("UserId", memberDTO.getId());
			session.setAttribute("UserName", memberDTO.getName());
			response.sendRedirect("product.jsp");		
		} else if(memberDTO.getId()!=null && log.equals("0")){ //그냥 회원이면
			session.setAttribute("UserId", memberDTO.getId());
			session.setAttribute("UserName", memberDTO.getName());
			response.sendRedirect("product.jsp");		
		}		
		else{
			request.setAttribute("LoginErrMsg", "로그인오류임");
			request.getRequestDispatcher("product.jsp").forward(request,response);
		}
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>