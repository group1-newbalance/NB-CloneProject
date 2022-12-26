package my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.connection.JdbcUtil;
import my.domain.MyMainDTO;

public class MyDAO implements IMy{
	
	private static MyDAO myDAO = null;
	
   public static MyDAO getInstance() {
      if(  myDAO == null) {
    	  myDAO = new MyDAO();
      }
      return myDAO;
   }
   
   public MyMainDTO getMyMainMenuInfo(Connection conn, String userCode) throws SQLException {
	  
			String sql = "SELECT user_name, lv, user_mileage "
					+ "                    , (SELECT COUNT(*) "
					+ "                        FROM user_coupon "
					+ "                        WHERE user_code = ? )user_coupon "
					+ "                    , (SELECT COUNT(*) "
					+ "                        FROM wishlist "
					+ "                        WHERE user_code = ? )user_wishlist "
					+ "                    , (SELECT COUNT(*) "
					+ "                        FROM order_list "
					+ "                        WHERE user_code = ? ) user_orderlist "
					+ " FROM user_info "
					+ " WHERE user_code = ? ";
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, userCode);
				pstmt.setString(2, userCode);
				pstmt.setString(3, userCode);
				pstmt.setString(4, userCode);
				rs = pstmt.executeQuery();
				
				MyMainDTO myData = null;
				if (rs.next()) {
					myData = new MyMainDTO(rs.getString("user_name")
								, rs.getString("lv")
								, rs.getInt("user_coupon")
								, rs.getInt("user_mileage")
								, rs.getInt("user_wishlist")
								, rs.getInt("user_orderlist"));
				}
				
				return myData;
			}finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
   }
}
