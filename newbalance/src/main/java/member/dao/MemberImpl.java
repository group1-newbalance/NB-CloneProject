package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.connection.JdbcUtil;
import member.service.User;

public class MemberImpl implements IMember{

	private static MemberImpl memberDAO = null;
	   public static MemberImpl getInstance() {
	      if(  memberDAO == null) {
	    	  memberDAO = new MemberImpl();
	      }
	      return memberDAO;
	   }
	
	@Override
	public User selectById(Connection conn, String id) throws SQLException {
		String sql =  " SELECT * FROM user_info WHERE user_id = ? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			User user = null;
			if (rs.next()) {
				user = new User(
						rs.getString("user_id"),
						rs.getString("user_pwd"));
			}
			return user;
			
		}finally {
		
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		}
	}
	
	//마지막 방문일 업데이트
	
	
	@Override
	public String selectIdtByHp(Connection conn, String custName, String cellNo) throws SQLException {
		String sql =  " SELECT user_id  FROM user_info "
				+ " WHERE user_phone = ? AND user_name=? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cellNo);
			pstmt.setString(2, custName);
			rs = pstmt.executeQuery();
			
			String id = null;
			if (rs.next()) {
				id = rs.getString("user_id");
			}
			return id;
			
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	// 회원비번 업데이트
	public int updatePwdById(Connection conn, String custId, String pwd) throws SQLException {
		String sql = " UPDATE user_info SET user_pwd = ? "
				+ " WHERE user_id = ? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, custId);
			int rowCount = pstmt.executeUpdate();
			
			return rowCount;
			
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	

	
	
}
