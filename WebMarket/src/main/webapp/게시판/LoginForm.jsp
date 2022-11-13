<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>

	
	
	
	
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
	<%} 
		String sign=request.getParameter("sign"); 
		String log=request.getParameter("log");
	%>
<!-- 	//이거 ㅅㅂ 게시판 안에서는 되는데 장바구니에서는 ./게시판/LoginProcess.jsp로 주소잡아야됨 -->
	<form action = "LoginProcess.jsp?log=<%  
		if(log!=null){
			out.print("1");
		} else {out.print("0");}
	%>"	
	 method="post" name="LoginFrm" onsubmit="return validateForm(this);" style="margin-left:50%;" >		
		<div >	
			<div class="form-floating" style="display:flex; width:350px;" align="right">
				<div align="right" style="width:80px; margin-top:1%;">
					<%if(sign!=null){%>
					<p align="right">이름 : 
					<%}%>
					<p align="right">아이디 :  
					<p align="right">패스워드 :  
				</div>
	
				<div class="form-floating" style="width:210px; margin-left:2%;" align="right">
					<%if(sign!=null){%>
					<input type="text" class="form-control" id="floatingInput" name="UserName" placeholder="name"/>
					<%}%>
			  		<input type="text" class="form-control" id="floatingInput" name="user_id" placeholder="ID"/>
			  		<input type="text" class="form-control" id="floatingPassword" name="user_pw" placeholder="Password"/> <br/>
			  	</div>
		  	</div>
		  	
		  	<div class="form-floating" style="width:350px; margin-left:125px; display:flex;"  >	 
		  	 	<%if(sign!=null){%>
		  	 	<p style="margin-left:80px;"><input type="submit" class="btn btn-secondary" value="회원 등록" />
		  	 	<%} else {%>
			  	<p><input type="button" class="btn btn-secondary" onclick="location.href='List.jsp?sign=1';" value="회원가입" />	
			  	<p style="margin-left:5px;"><input type="submit" class="btn btn-secondary" value="로그인" />	
			  	<%}%>
		  	</div>
		  	
		  	<div class="form-floating" style="color:red; width:350px; font-size:1.2em;">
				<p align="right" style="margin-right:60px;"><%= request.getAttribute("LoginErrMsg")==null?
					"" : request.getAttribute("LoginErrMsg") %>
			</div>	  	
		</div>
	</form>
	
	
	
	
	
	
</body>
</html>