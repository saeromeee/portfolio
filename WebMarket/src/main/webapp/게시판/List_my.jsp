<%@ page import="java.util.*"%>
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

String id=(String)session.getAttribute("UserId");
String myregi=dao.myregi(id);
String myname=dao.myname(id);

int totalCount = dao.mycount(id); // 게시물 수 확인
List<BoardDTO> boardLists = dao.mylist(id);  // 게시물 목록 받기

/////////////////////////////////////////////////////////////////////////////////////////페이징
List<List<BoardDTO>> paged = new ArrayList(); 

if(request.getParameter("pp")!=null){
	session.setAttribute("pp", (String)request.getParameter("pp"));
} else if(request.getParameter("rp")!=null){
	session.setAttribute("pp", null);
}
int tt=session.getAttribute("pp")!=null?Integer.parseInt((String)session.getAttribute("pp")):10;
int total=totalCount; //전체 게시글 수 : 56
int show=tt; //보여줄 게시글 수
int shows=10; //보여줄 페이지 수

int pag=total%show!=0?total/show+1:total/show; //전체 페이지 수
int tens=show; //페이지에 들어갈 게시글 수(show가 적합하지 않은 경우)
int cn=0; //게시글 수 카운트

for(int i=0; i<pag; i++){
	List<BoardDTO> ten=new ArrayList();
	if(i==pag-1){
		tens=total%show!=0?total%show:show;
	}
	for(int e=0; e<tens; e++){
		ten.add(boardLists.get(cn));
		cn++;
		if(cn==total){break;}
	}
	paged.add(ten);
	if(cn==total){break;}
} 
//////////////////////////////////////////////////////////////////////////////////////////

int mycount=dao.mycount((String)session.getAttribute("UserId"));

int all=dao.all();
dao.close();  // DB 연결 닫기

String sign=request.getParameter("sign");
int tennum=0;
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
	<div class="jumbotron" style="display:flex; height:280px;" >
 		<div class = "container"  style="width:50%; height:240px;">
 			<h3 class="display-3">내가 쓴 글(<%=mycount %>)</h3>	
 		</div>
 		
 		<div style="width:50%; height:240px;  margin-right:3%; display:flex;"  >
 			<%if(session.getAttribute("UserId")==null){ %>
 			<jsp:include page="LoginForm.jsp" />
 						
 			<%} else{  		%>	
 			<div style="width:65%;" align="right">
	 			<table class="table" >
				<tr>
					<td align="center" ><h5>아이디</h5></td>
					<td align="center"><p style="font-size:18px;"><%=id%></td>
				</tr>
				<tr>
					<td align="center"><h5>이름</h5></td>
					<%if(request.getParameter("info")!=null){ %>
					<td align="center">
						<form method="post" name="formname" action="editme.jsp"> 				    		
					            <input type="text" class="form-control" name="name" style="width:100px;"/>
					           
		   				 </form>
					</td>
					<%} else { %>
					<td align="center"><p style="font-size:18px;"><%=myname%></td>
					<%} %>
				</tr>
				<tr>
					<td align="center"><h5>가입일</h5></td>
					<td align="center"><p style="font-size:18px;"><%=myregi%></td>
				</tr>
				
				</table>
 			</div>
 			
 			<div style="width:35%;" align="right">
 			
 			<p class ="navbar-brand"  style="font-size:27px;" ><% out.print(myname);%> 					
			
			
			<div align="right" >
			<%if(request.getParameter("info")!=null){ %>
			<script>
				function forname(){
					formname.submit();   //폼네임의 네임값이 넘어가게 됨
				}
			</script>
			
			<input type = "submit" class="btn btn-secondary" value="수정완료"  onclick="forname()">
		 

			
			<button type="button" class="btn btn-secondary" 
			onclick="location.href='List_my.jsp?id=<%=id%>';"
			style="margin-left:3%;">			
			수정취소
			</button>
			<%} else{ %>
<!-- 			//////////////////// -->
			<button type="button" class="btn btn-secondary" 
			onclick="location.href='List_my.jsp?id=<%=id%>&info=info';">
			정보수정		
			</button>
			
			<button type="button" class="btn btn-secondary" 
			onclick="location.href='LoginForm.jsp?outs=outss';"
			style="margin-left:3%;">
			로그아웃
			</button>
			
			<%} %>
			
			</div>
			</div>
			<% } %>
 		</div>
 		
 	</div>
<!--     //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
    <div align="right">
  		<select class="form-control selectpicker noborder" style="margin-right:5.5%; width:100px;" onchange="window.location.href=this.value"> 
   			<option align="center" value="tt">글수</option>
            <option align="center" value="List.jsp?pp=5" >5</option> 
            <option align="center" value="List.jsp?pp=10">10</option>
            <option align="center" value="List.jsp?pp=15">15</option> 
            <option align="center" value="List.jsp?pp=20">20</option>	                
        </select>
	</div>
<!--     //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
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
else {////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // 게시물이 있을 때 
      // 화면상에서의 게시물 번호
    tens=show;
    cn=0; //게시글 수 카운트
    String tm=request.getParameter("tennum"); //tennum번째 페이지
    
    tennum=tm!=null?Integer.parseInt(tm)-1:0;
//     out.println(" tennum : "+tennum);
//     for (int i=0; i<pag; i++){ 
   	if(tennum==pag-1){
   	   		tens=total%show!=0?total%show:show;
   	   	}  
   	int virtualNum =totalCount-(tennum)*show+1;
   	for(int e=0; e<tens; e++){  		 	
       	
       	virtualNum--;// 전체 게시물 수에서 시작해 1씩 감소
       	BoardDTO dto=paged.get(tennum).get(e);
       	cn++;
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
    		if(cn==total){break;}

    }
}
%>	</tbody>
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
    </table>
   
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->   
    
    
    <div align="center">
    <% 
    
    	//pag=전체페이지 수 
    	    	
    	if(request.getParameter("rp")!=null){
    		session.setAttribute("page", null);
    	}
    	String go=request.getParameter("go");  
    	
    	if(go!=null){session.setAttribute("page", go);}    	
    	String gos=(String)session.getAttribute("page");
    	int z=gos!=null?Integer.parseInt(gos):0; //페이지 시작값 //tennum은 리퀘스트로 위로 올려보내서 tennum번째 게시글 리스트
    	
    	
//     	out.println("z : " +z +"<br>");    //// &
    	out.println("<a href=\"List_my.jsp?tennum="+1+
    	"&go="+0+"\" style= \" color:#666565;border:0; background-color:#E7E7E7; margin-right:10px; font-size:1.5px;\"class=\"btn btn-secondary\">"+"◀"+"</a>");
    	if(z!=0){out.println("<a href=\"List_my.jsp?tennum="+(z)+
    			"&go="+(z-shows)+"\" style=\"color:#666565;border:0; background-color:#E7E7E7;\" class=\"btn btn-secondary\">"+"<b><</b>"+"</a>");}
    	else{out.println("<a class=\"btn btn-secondary\" style=\"color:#666565;border:0; background-color:#E7E7E7;\" >"+"<b>"+"<"+"</b>"+"</a>");}
    	for(int i=0; i<shows; i++){ 
    		z++;    
    		if(z==tennum+1){out.println("<a href=\"List_my.jsp?tennum="+z+
    				"\"  class=\"btn btn-secondary\"><b>"+z+"</b></a>");}
    		else{out.println("<a href=\"List_my.jsp?tennum="+z+
    				"\" style=\"color:#666565;border:0; background-color:#E7E7E7;\" class=\"btn btn-secondary\"><b>"+z+"</b></a>");}    		
    		if(z==pag){break;}
    	}
    	int last=pag%shows!=0?pag-pag%shows:pag-shows;//마지막 페이지
    	
    	if(z<pag){out.println("<a href=\"List_my.jsp?tennum="+(z+1)+"&go="+z+"\" style=\"color:#666565;border:0; background-color:#E7E7E7;\" class=\"btn btn-secondary\">"+">"+"</a>");}
    	else{out.println("<a style=\"color:#666565;border:0; background-color:#E7E7E7;\"  class=\"btn btn-secondary\">"+"<b>"+">"+"</b>"+"</a>");}
    	out.println("<a href=\"List_my.jsp?tennum="+pag+"&go="+last+"\" style= \" color:#666565;border:0; background-color:#E7E7E7; margin-left:10px; font-size:1.5px;\" class=\"btn btn-secondary\">"+"▶"+"</a>");
//     	out.println("<br> last : " + last);
    %>
    </div> <br>
    
<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->    
     <!--목록 하단의 [글쓰기] 버튼-->
    <div style="display:flex;">
    	<div style="width:70%">
    		<% if(((String)session.getAttribute("UserId"))!=null&&((String)session.getAttribute("UserId")).equals("admin")){ %>
    		<button type="button" class="btn btn-secondary" onclick="location.href='remove.jsp?remove=board';" style="margin-left:5%;">보드리셋</button>
    		<button type="button" class="btn btn-secondary" onclick="location.href='remove.jsp?remove=set';" >보드세팅</button>
    		<button type="button" class="btn btn-secondary" onclick="location.href='remove.jsp';" >더미생성</button>
<!--     		<button type="button" class="btn btn-secondary" onclick="location.href='remove.jsp?remove=member';">멤버리셋</button> -->
			<!-- 멤버는 보드와 외래키로 묶여있어 리셋 불가함 -->
    		
    		<%} %>
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
