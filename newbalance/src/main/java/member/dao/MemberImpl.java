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
	
}
