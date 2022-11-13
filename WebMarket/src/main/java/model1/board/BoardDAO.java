package model1.board;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import javax.servlet.ServletContext;
import common.JDBConnect;

public class BoardDAO extends JDBConnect {
    public BoardDAO() {
        super();
    }
    //전체 게시글 담은 리스트
    public List<BoardDTO> board() {            
        String sql = "select * from product";
        List<BoardDTO> board=new ArrayList<BoardDTO>();
        try {
        	ResultSet rs = null;    	  
    	    PreparedStatement pstmt=null;    	    
    	    
    	    pstmt= con.prepareStatement(sql);    
    	    rs = pstmt.executeQuery();
    	    while(rs.next()) {
    	    	BoardDTO dto=new BoardDTO();
    	    	dto.setNum(rs.getString(0));
    	    	dto.setTitle(rs.getString(1));
    	    	dto.setContent(rs.getString(2));
    	    	dto.setId(rs.getString(3));
    	    	   
    	    	board.add(dto);
    	    }
        }
        catch (Exception e) {
            System.out.println("전체 게시물 구하는 중 예외 발생");
            e.printStackTrace();
        }

        return board; 
    }
    

    // 검색 조건에 맞는 게시물의 개수를 반환합니다.
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0; // 결과(게시물 수)를 담을 변수

        // 게시물 수를 얻어오는 쿼리문 작성
        String query = "SELECT COUNT(*) FROM board";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }

        try {
        	           
			stmt = con.createStatement();   // 쿼리문 생성
            rs = stmt.executeQuery(query);  // 쿼리 실행
            rs.next();  // 커서를 첫 번째 행으로 이동
            totalCount = rs.getInt(1);  // 첫 번째 칼럼 값을 가져옴
        }
        catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount; 
    }
    
 // 내 게시글 갯수
    public int mycount(String id) {
        int myCount = 0; // 결과(게시물 수)를 담을 변수
        PreparedStatement pstmt=null;
        try {
        	String query = "SELECT count(*) FROM board where id=?";      
 	
        	pstmt= con.prepareStatement(query);   // 쿼리문 생성
        	pstmt.setString(1, id);        	
        	rs = pstmt.executeQuery(); // 쿼리 실행
        	
             // 커서를 첫 번째 행으로 이동
        	if(rs.next()) {System.out.println("뀨");}
        	
        	myCount = rs.getInt(1);  
        }
        catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        } 
        System.out.println(myCount);
        return myCount; 
    }
    //내 주문갯수
    public int mybill(String id) {
        int myCount = 0; // 결과(게시물 수)를 담을 변수
        PreparedStatement pstmt=null;
        try {
        	String query = "SELECT count(*) FROM bill where id=?";      
 	
        	pstmt= con.prepareStatement(query);   // 쿼리문 생성
        	pstmt.setString(1, id);        	
        	rs = pstmt.executeQuery(); // 쿼리 실행
        	
             // 커서를 첫 번째 행으로 이동
        	if(rs.next()) {System.out.println("뀨");}
        	
        	myCount = rs.getInt(1);  
        }
        catch (Exception e) {
            System.out.println("주문 수를 구하는 중 예외 발생");
            e.printStackTrace();
        } 

        return myCount; 
    }
    
  //게시글 전체갯수 
    public int all() {
        int all = 0; // 결과(게시물 수)를 담을 변수
        PreparedStatement pstmt=null;
        try {
        	String query = "SELECT count(*) FROM board"; 
        	pstmt= con.prepareStatement(query);   
        	rs = pstmt.executeQuery(); 
        	if(rs.next()) {System.out.println("뀨");}
        	all = rs.getInt(1);  
        }
        catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        } 
        return all; 
    }
    //내 가입
    public String myregi(String id) {
        String myregi = null; // 결과(게시물 수)를 담을 변수
        PreparedStatement pstmt=null;
        try {
        	String query = "SELECT regidate FROM member where id=?";      
 	
        	pstmt= con.prepareStatement(query);   // 쿼리문 생성
        	pstmt.setString(1, id);        	
        	rs = pstmt.executeQuery(); // 쿼리 실행
        	
             // 커서를 첫 번째 행으로 이동
        	if(rs.next()) {System.out.println("뀨");}        	
        	myregi = rs.getString(1);  
        }
        catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        } 

        return myregi; 
    }
    
    public String myname(String id) {
        String myname = null; // 결과(게시물 수)를 담을 변수
        PreparedStatement pstmt=null;
        try {
        	String query = "SELECT name FROM member where id=?";      
 	
        	pstmt= con.prepareStatement(query);   // 쿼리문 생성
        	pstmt.setString(1, id);        	
        	rs = pstmt.executeQuery(); // 쿼리 실행
        	
             // 커서를 첫 번째 행으로 이동
        	if(rs.next()) {System.out.println("");}        	
        	myname = rs.getString(1);  
        }
        catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        } 

        return myname; 
    }
    
    // 검색 조건에 맞는 게시물 목록을 반환합니다./////////////오류
    public List<BoardDTO> selectList(Map<String, Object> map) { 
        List<BoardDTO> bbs = new Vector<BoardDTO>();  // 결과(게시물 목록)를 담을 변수

        String query = "SELECT * FROM board "; 
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY num DESC "; 

        try {
            stmt = con.createStatement();   // 쿼리문 생성
            rs = stmt.executeQuery(query);  // 쿼리 실행

            while (rs.next()) {  // 결과를 순화하며...
                // 한 행(게시물 하나)의 내용을 DTO에 저장
                BoardDTO dto = new BoardDTO(); 

                dto.setNum(rs.getString("num"));          // 일련번호
                dto.setTitle(rs.getString("title"));      // 제목
                dto.setContent(rs.getString("content"));  // 내용
                dto.setPostdate(rs.getDate("postdate"));  // 작성일
                dto.setId(rs.getString("id"));            // 작성자 아이디
                dto.setVisitcount(rs.getString("visitcount"));  // 조회수

                bbs.add(dto);  // 결과 목록에 저장
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }

        return bbs;
    }
    
    ///////////////////////////  내글 리스트 불러오기
    public List<BoardDTO> mylist(String id) {     	
        List<BoardDTO> bbs = new Vector<BoardDTO>();  // 결과(게시물 목록)를 담을 변수
        PreparedStatement pstmt=null;
        try {
        	String query = "SELECT * FROM board where id=?";    
        	pstmt= con.prepareStatement(query);   // 쿼리문 생성
        	pstmt.setString(1, id);        	
        	rs = pstmt.executeQuery(); // 쿼리 실행

            while (rs.next()) {  // 결과를 순화하며...
                // 한 행(게시물 하나)의 내용을 DTO에 저장
                BoardDTO dto = new BoardDTO(); 

                dto.setNum(rs.getString("num"));          // 일련번호
                dto.setTitle(rs.getString("title"));      // 제목
                dto.setContent(rs.getString("content"));  // 내용
                dto.setPostdate(rs.getDate("postdate"));  // 작성일
                dto.setId(rs.getString("id"));            // 작성자 아이디
                dto.setVisitcount(rs.getString("visitcount"));  // 조회수

                bbs.add(dto);  // 결과 목록에 저장
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }

        return bbs;
    }
    
    
    // 검색 조건에 맞는 게시물 목록을 반환합니다(페이징 기능 지원).
    public List<BoardDTO> selectListPage(Map<String, Object> map) {
        List<BoardDTO> bbs = new Vector<BoardDTO>();  // 결과(게시물 목록)를 담을 변수
        
        // 쿼리문 템플릿  
        String query = " SELECT * FROM ( "
                     + "    SELECT Tb.*, ROWNUM rNum FROM ( "
                     + "        SELECT * FROM board ";
       

        // 검색 조건 추가 
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField")
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        
        query += "ORDER BY num DESC "
               + "     ) Tb "
               + " ) "
               + " WHERE rNum BETWEEN ? AND ?"; 

        try {
            // 쿼리문 완성 
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            
            
            // 쿼리문 실행 
            rs = psmt.executeQuery();
            
            
            while (rs.next()) {
                // 한 행(게시물 하나)의 데이터를 DTO에 저장
                BoardDTO dto = new BoardDTO();
                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setId(rs.getString("id"));
                dto.setVisitcount(rs.getString("visitcount"));

                // 반환할 결과 목록에 게시물 추가
                bbs.add(dto);
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        
        // 목록 반환
        return bbs;
    }

    // 게시글 데이터를 받아 DB에 추가합니다. 
    public int insertWrite(BoardDTO dto) {
        int result = 0;
        
        try {
            // INSERT 쿼리문 작성 
            String query = "INSERT INTO board ( "
                         + "title,content,id,visitcount) "
                         + " VALUES ( "
                         + "?, ?, ?, 0)";  //seq_board_num.NEXTVAL 10자리에 원래 쓰여있던것

            psmt = con.prepareStatement(query);  // 동적 쿼리 
            psmt.setString(1, dto.getTitle());  
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getId());  
            
            result = psmt.executeUpdate(); 
        }
        catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;
    }
    
 // 게시글 기초데이터 세팅 
    public int boardset() {
        int result = 0;
        
        try {           
            String query = "INSERT INTO board (title,content,id,visitcount) VALUES ('지금은 여름임', '여름향기', 'abc', 0)";  
            result = con.prepareStatement(query).executeUpdate();
            query = "INSERT INTO board (title,content,id,visitcount) VALUES ('뀨민이에오', '뀨', 'ham04', 0)";  
            result = con.prepareStatement(query).executeUpdate(); 
            query = "INSERT INTO board (title,content,id,visitcount) VALUES ('지금은 가을임', '뀨냄새', 'admin', 0)";  
            result = con.prepareStatement(query).executeUpdate(); 
            query = "INSERT INTO board (title,content,id,visitcount) VALUES ('봄일지도 ㅇㅅㅇ', '여ㄴㅇㄻㄴㅇㄻㅈ기', 'abc', 0)";  
            result = con.prepareStatement(query).executeUpdate();
            query = "INSERT INTO board (title,content,id,visitcount) VALUES ('뀨민입니다 뀨', '뀨뀨뀨뀨뀨뀨뀨', 'abc', 0)";  
            result = con.prepareStatement(query).executeUpdate();
            query = "INSERT INTO board (title,content,id,visitcount) VALUES ('무지개똥 향긋한', '빨개 엉덩이는', 'xzs', 0)";  
            result = con.prepareStatement(query).executeUpdate();
        }
        catch (Exception e) {
            System.out.println("기초데이터 세팅 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;
    }
    //더미생성
    public int dummy(int i) {
        int result = 0;
        
        try {              	
            String query = "INSERT INTO board (title,content,id,visitcount) VALUES ('"+i+"','"+i+"', 'admin',0)";  
            result = con.prepareStatement(query).executeUpdate();            
        }
        catch (Exception e) {
            System.out.println("더미 생성 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;
    }
    //회원가입
    public int sign(String i, String p, String n) {
        int result = 0;
        
        try {              	
            String query = "INSERT INTO member (id,pass,name) VALUES ('"+i+"','"+p+"', '"+n+"')";  
            result = con.prepareStatement(query).executeUpdate();            
        }
        catch (Exception e) {
            System.out.println("회원가입 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;
    }
    
    //회원가입
    public int signs(String a, String b, String c, String d, String e, String f, String g, String h) {
        int result = 0;
        PreparedStatement pstmt=null;
        try {              	
            String query = "INSERT INTO member (id,pass,name,gen,birth,email,phone,addr) VALUES (?,?,?,?,?,?,?,?)";  
            pstmt= con.prepareStatement(query);
            pstmt.setString(1,a);
			pstmt.setString(2,b);			
			pstmt.setString(3,c);
			pstmt.setString(4,d);
			pstmt.setString(5,e);
			pstmt.setString(6,f);
			pstmt.setString(7,g);
			pstmt.setString(8,h);
			pstmt.executeUpdate();
            
			System.out.println("회원가입 성공");
        }
        catch (Exception q) {
            System.out.println("회원가입 중 예외 발생");
            q.printStackTrace();
        }
        
        return result;
    }
    
    
    //회원정보 수정
    public int edit(String a, String b, String c, String d, String e, String f, String g, String h) {
        int result = 0;
        PreparedStatement pstmt=null;
        try {              	
            String query = "update member set pass=?,name=?,gen=?,birth=?,email=?,phone=?,addr=? where id=?";  
            pstmt= con.prepareStatement(query);
            pstmt.setString(1,a);
			pstmt.setString(2,b);			
			pstmt.setString(3,c);
			pstmt.setString(4,d);
			pstmt.setString(5,e);
			pstmt.setString(6,f);
			pstmt.setString(7,g);
			pstmt.setString(8,h);
			
			pstmt.executeUpdate();
            
			System.out.println("정보수정 성공");
        }
        catch (Exception q) {
            System.out.println("정보수정 중 예외 발생");
            q.printStackTrace();
        }
        
        return result;
    }
    


    // 지정한 게시물을 찾아 내용을 반환합니다.
    public BoardDTO selectView(String num) { 
        BoardDTO dto = new BoardDTO();
        
        // 쿼리문 준비
        String query = "SELECT B.*, M.name " 
                     + " FROM member M INNER JOIN board B " 
                     + " ON M.id=B.id "
                     + " WHERE num=?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);    // 인파라미터를 일련번호로 설정 
            rs = psmt.executeQuery();  // 쿼리 실행 

            // 결과 처리
            if (rs.next()) {
                dto.setNum(rs.getString(1)); 
                dto.setTitle(rs.getString(2));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setId(rs.getString("id"));
                dto.setVisitcount(rs.getString("visitcount"));
//                dto.setVisitcount(rs.getString(6));
                dto.setName(rs.getString("name")); 
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
        }
        
        return dto; 
    }

    // 지정한 게시물의 조회수를 1 증가시킵니다.
    public void updateVisitCount(String num) { 
        // 쿼리문 준비 
        String query = "UPDATE board SET "
                     + " visitcount=visitcount+1 "
                     + " WHERE num=?";
        
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);  // 인파라미터를 일련번호로 설정 
            psmt.executeUpdate();    // 쿼리 실행 
        } 
        catch (Exception e) {
            System.out.println("게시물 조회수 증가 중 예외 발생");
            e.printStackTrace();
        }
    }
    
    // 지정한 게시물을 수정합니다.
    public int updateEdit(BoardDTO dto) { 
        int result = 0;
        
        try {
            // 쿼리문 템플릿 
            String query = "UPDATE board SET "
                         + " title=?, content=? "
                         + " WHERE num=?";
            
            // 쿼리문 완성
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getNum());
            
            // 쿼리문 실행 
            result = psmt.executeUpdate();
        } 
        catch (Exception e) {
            System.out.println("게시물 수정 중 예외 발생");
            e.printStackTrace();
        }
        
        return result; // 결과 반환 
    }

    // 지정한 게시물을 삭제합니다.
    public int deletePost(BoardDTO dto) { 
        int result = 0;

        try {
            // 쿼리문 템플릿
            String query = "DELETE FROM board WHERE num=?"; 

            // 쿼리문 완성
            psmt = con.prepareStatement(query); 
            psmt.setString(1, dto.getNum()); 

            // 쿼리문 실행
            result = psmt.executeUpdate(); 
        } 
        catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }
        
        return result; // 결과 반환
    }
    
    public int delete(String num) { 
        int result = 0;

        try {
            // 쿼리문 템플릿
            String query = "DELETE FROM board WHERE num=?"; 

            // 쿼리문 완성
            psmt = con.prepareStatement(query); 
            psmt.setString(1, num); 

            // 쿼리문 실행
            result = psmt.executeUpdate(); 
        } 
        catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }
        
        return result; // 결과 반환
    }
    //게시물 전체 삭제
    public int reset(int i) { 
        int result = 0;
        String query=null;
        try {
            // 쿼리문 템플릿
        	if(i==1) {
        		query = "DELETE FROM board"; 
        	} else if(i==2) {
        		query = "DELETE FROM member where not(id='admin')"; 
        	}
            // 쿼리문 완성
            psmt = con.prepareStatement(query);             
            result = psmt.executeUpdate(); 
        } 
        catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }
        
        return result; // 결과 반환
    }
    
    public int idcheck(String id) { 
        int result = 1;
        String query=null;
        
        try {
        	query = "select * FROM member where id='"+id+"'";
            // 쿼리문 완성
            psmt = con.prepareStatement(query);             
            rs = psmt.executeQuery();
            rs.next();
            System.out.println("rs값 뭐나오나 : "+rs.getString(1));
            if(rs.getString(1)!=null) {
            	result=0;
            }	
            
        } 
        catch (Exception e) {
            System.out.println("아이디 체크 중 예외 발생");
            e.printStackTrace();
        }
        
        return result; // 결과 반환
    }
}
