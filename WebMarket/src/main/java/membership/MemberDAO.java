package membership;

import common.JDBConnect;
import model1.board.BoardDTO;


public class MemberDAO extends JDBConnect{
	
	public MemberDAO() {
        super();
    }
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=? and pass=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1,uid);
			psmt.setString(2,upass);	
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setRegidate(rs.getString("regidate"));
			}
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	
	public int insertme(MemberDTO dto) {
        int result = 0;
        System.out.println("인서트미까지는 들어옴");
        try {
            // INSERT 쿼리문 작성 
        	 String query = "UPDATE member SET name=? WHERE id=?";
            //seq_board_num.NEXTVAL 10자리에 원래 쓰여있던것

            psmt = con.prepareStatement(query);  // 동적 쿼리 
            psmt.setString(1, dto.getName());
            psmt.setString(2, dto.getId());
            
            result = psmt.executeUpdate(); 
        }
        catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        
        return result;
    }
	

	
	
}


