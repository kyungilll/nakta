package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Mp3DAO {
	DBConnectionMgr mgr;
	Mp3DTO dto2 = null;
	
	public Mp3DAO() {
		mgr = DBConnectionMgr.getInstance();		
	}
	
	public Mp3DTO select() {
		
		Mp3DTO dto = new Mp3DTO();
		
		//1,2단계를 해주는 DBconnectionMgr 객체 필요
		DBConnectionMgr mgr = DBConnectionMgr.getInstance();
		Connection con;
		try {
			con = mgr.getConnection();
		
		//3단계 sql문 결정
		String sql = "select * from mp3 where num = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, 1);
		
		//4단계 sql문 전달 요청
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			dto = new Mp3DTO();
			int num = rs.getInt(1);
			String title = rs.getString(2);
			String artist = rs.getString(3);
			String date = rs.getString(4);
			String genre = rs.getString(5);
			int view = rs.getInt(6);
			String img = rs.getString(7);
			
			dto.setNum(num);
			dto.setTitle(title);
			dto.setArtist(artist);
			dto.setDate(date);
			dto.setGenre(genre);
			dto.setView(view);
			dto.setImg(img);	
		}
		ps.executeUpdate();
		
		mgr.freeConnection(con, ps , rs);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
}
