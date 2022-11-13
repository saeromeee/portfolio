<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.sql.*"%>
<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// DAO를 생성해 DB에 연결
BoardDAO dao = new BoardDAO();

// 사용자가 입력한 검색 조건을 Map에 저장
Map<String, Object> param = new HashMap<String, Object>(); //사용자가 준 데이터 맵에 담아야되는데 그 데이터는
String searchField = request.getParameter("searchField"); // 내장객체 파라미터 안에 들어있음
String searchWord = request.getParameter("searchWord");// 마찬가지 
if (searchWord != null) {
    param.put("searchField", searchField);
    param.put("searchWord", searchWord);
}

int totalCount = dao.selectCount(param);  // 게시물 수 확인
List<BoardDTO> boardLists = dao.selectList(param);  // 게시물 목록 받기

int mycount=dao.mycount((String)session.getAttribute("UserId"));
String id=(String)session.getAttribute("UserId");
int all=dao.all();
dao.close();  // DB 연결 닫기

String sign=request.getParameter("sign");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원제 게시판</title>
</head>
<body>
    <jsp:include page="Link.jsp" />  <!-- 공통 링크 -->
	<div class="jumbotron" style="display:flex; height:260px;" >
 		<div class = "container">
 			<h3 class="display-3">게시판</h3>	
 		</div>
 		<div class = "container" style="margin-left:20%;">
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
    
    
    <!-- 게시물 목록 테이블(표) --> 
    <table class="table table-striped table-hover table-borderless">
        <!-- 각 칼럼의 이름 -->         
        <thead>
		    <tr align="center">
		      <th scope="col" width="10%">전체<%="("+totalCount+")"%></th>
		      <th scope="col" width="50%">제목</th>
		      <th scope="col" width="15%">작성자</th>
		      <th scope="col" width="10%">조회수</th>
		      <th scope="col" width="15%">작성일</th>
		    </tr>
		</thead>   
		<tbody>     
        <!-- 목록의 내용 --> 
<%
if (boardLists.isEmpty()) {
    // 게시물이 하나도 없을 때 
%>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
<%
}
else {
    // 게시물이 있을 때 
    int virtualNum = 0;  // 화면상에서의 게시물 번호
    for (BoardDTO dto : boardLists)
    {
        virtualNum = totalCount--;  // 전체 게시물 수에서 시작해 1씩 감소
%>
        
	        <tr align="center" onclick="location.href='View.jsp?num=<%= dto.getNum() %>';">
	          <th scope="col"><%= virtualNum %></th>  <!--게시물 번호-->
	            <td align="left" >  <!--제목(+ 하이퍼링크)-->
	                <a href="View.jsp?num=<%= dto.getNum() %>" style="color:black;"><%= dto.getTitle() %></a> 
	            </td>
	            <td align="center"><%= dto.getId() %></td>          <!--작성자 아이디-->
	            <td align="center"><%= dto.getVisitcount() %></td>  <!--조회수-->
	            <td align="center"><%= dto.getPostdate() %></td>    <!--작성일-->
	        </tr>
        
<%
    }
}
%>	</tbody>
    </table>
    <!--목록 하단의 [글쓰기] 버튼-->
    <div style="display:flex;">
    
    	<div style="width:70%">
    		<% if(((String)session.getAttribute("UserId"))!=null&&((String)session.getAttribute("UserId")).equals("admin")){ %>
    		<button type="button" class="btn btn-secondary" onclick="location.href='remove.jsp?remove=board';" style="margin-left:5%;">보드리셋</button>
    		<button type="button" class="btn btn-secondary" onclick="location.href='remove.jsp?remove=set';" >보드세팅</button>
    		<button type="button" class="btn btn-secondary" onclick="location.href='remove.jsp';" >더미생성</button>
<!--     		<button type="button" class="btn btn-secondary" onclick="location.href='remove.jsp?remove=member';">멤버리셋</button> -->
			<!-- 멤버는 보드와 외래키로 묶여있어 리셋 불가함 -->
    		
    		<%} else {}%>
		    <form method="get"  style="margin-left:60%;display:flex; ">
		    		<select class="form-control selectpicker noborder" name="searchField" style="width:100px;"> 
		                <option value="title">제목</option> 
		                <option value="content">내용</option>
		            </select>
					
			            <input type="text" class="form-control" name="searchWord" style="width:300px;"/>
			            <input type="submit" class="btn btn-secondary" value="검색하기" />
		    </form>
		</div >
             
        
        <div align="right" style="width:30%; margin-right:7%;">          	
            <button type="button" class="btn btn-secondary" onclick="location.href='Write.jsp';" style="margin-left:35%;">글쓰기 </button>
            <% if(((String)session.getAttribute("UserId"))!=null&&((String)session.getAttribute("UserId")).equals("admin")){ %>
            <button type="button" class="btn btn-secondary" onclick="location.href='List_edit.jsp';">편집 </button>
            <%} %>
        </div> 
    </div> 
</body>
</html>
