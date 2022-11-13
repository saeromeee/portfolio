<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<% String id=(String)session.getAttribute("UserId"); %>
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
 <jsp:include page="Link.jsp" />
 <div class="jumbotron" style="display:flex; height:250px;" >
 		<div class = "container">
 			<h3 class="display-3">회원정보 수정</h3>	
 		</div>
 		<div class = "container" style="margin-left:10%;"  >
 			<%if(session.getAttribute("UserId")==null){ %>
 			<jsp:include page="LoginForm.jsp" />
 						
 			<%} else{  		%>	
 			
 			<div style="margin-left:73%">
 			<p class ="navbar-brand" style="font-size:27px;" ><% out.print(session.getAttribute("UserName"));%> 					
			</div>
			
			<div style="margin-left:67%" style="display:flex;">
			<button type="button" class="btn btn-secondary" 
			onclick="location.href='List_my.jsp?id=<%=id%>&info=info';">
			수정취소
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
	
	
	
	<%		
		if(request.getParameter("outs")!=null){
		session.setAttribute("UserId", null);
		session.setAttribute("UserName",null);
		response.sendRedirect("List.jsp");
	}
		if(session.getAttribute("UserId")==null){			
	%>
	<script>
		fucntion validateForm(form){ //사용자가 폼 제대로 양식 맞게 입력했는지 체크
			if(!form.user_id.value){
				alert("아디 입력 ㄱ");
				return false;
			}	
			if(form.user_pw.value=""){
				alert("비번 입력 ㄱ");
				return false;
			}
		}
	</script>
	<%} %>
	
	<form action = "LoginProcess.jsp" method="post" name="LoginFrm" onsubmit="return validateForm(this);" style="margin-left:50%;" >		
		
		<div style="display:flex;">
		<div class="form-floating" style="margin-left:2%;" align="right">
		
	  		<p align="right">아이디 : login
	  		
	  		<p align="right">패스워드 : <input type="password" 
	  		class="form-control" id="floatingPassword" name="user_pw" placeholder="Password"/> <br/>
	  		
	  	<p><input type="submit" class="btn btn-secondary" value="로그인하기"/>	
	  	<div  style="flex-direction:column; color:red; font - size:1.2em;">
		<p align="right"><%= request.getAttribute("LoginErrMsg")==null?
			"" : request.getAttribute("LoginErrMsg") %>
		</div>
	  	
		</div>		
		</div>
		
		
		
	</form>
	
	
	
	
	
	
</body>
</html>