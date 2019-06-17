package music;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class BoardDAO {

	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	DBConnectionMgr mgr;
	static int num = 1;

	public BoardDAO() {
		mgr = DBConnectionMgr.getInstance();
	}

	public BoardDTO insert() {
		
		BoardDTO dto = new BoardDTO();
		
		try {
			con = mgr.getConnection();
			
			String sql = "insert into board values(?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, num);
			num++;
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getId());
			ps.setString(4, dto.getPass());
			ps.setString(5, dto.getContent());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
	public void update(BoardDTO dto) throws Exception {
		con = mgr.getConnection();

		String sql = "update board set title = ?, id = ?, pass = ?, content = ? where id = ?";
		ps = con.prepareStatement(sql);
		
		ps.setString(1, dto.getTitle());
		ps.setString(2, dto.getId());
		ps.setString(3, dto.getPass());
		ps.setString(4, dto.getContent());
		ps.setString(5, dto.getId());
		
		ps.executeUpdate();
	}
	
	public void delete(BoardDTO dto) throws Exception {

		con = mgr.getConnection();

		String sql = "delete from board where id = ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());

		ps.executeUpdate();
	}
	
	public BoardDTO select(BoardDTO dto) throws Exception {

		con = mgr.getConnection();

		// 3단계 sql문 결정
		String sql = "select * from bbs where id = ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());

		// 4단계 sql문 실행 요청
		rs = ps.executeQuery();
		BoardDTO dto2 = null;

		while (rs.next()) {
			dto2 = new BoardDTO();
			String title = rs.getString(1);
			String id = rs.getString(2);
			String content = rs.getString(3);
			

			dto2.setId(id);
			dto2.setTitle(title);
			dto2.setContent(content);
		}
		return dto2;
	}
	
	public ArrayList<BoardDTO> selectAll(){
		
		ArrayList list = new ArrayList();
		BoardDTO dto = null;
		
		try {
			con = mgr.getConnection();
			
			String sql = "select * from music";
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			
			while(rs.next()) {
				dto = new BoardDTO();
				int num = rs.getInt(1);
				String title = rs.getString(2);
				String id = rs.getString(3);
				
				dto.setNum(num);
				dto.setTitle(title);
				dto.setId(id);
				
				list.add(dto);
				
			} //while end
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	} // selectAll end
	
}


























