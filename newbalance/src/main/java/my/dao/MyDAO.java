package my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.connection.JdbcUtil;
import my.domain.MyDeliveryInfoDTO;
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

@Override
public List<MyDeliveryInfoDTO> getMemberDeliveryInfo(Connection conn, String userCode) throws SQLException {
	String sql = " SELECT ma_seq, ma_name, ma_zipcode, ma_address1, ma_address2, ma_phone, ma_default "
			+ " FROM my_address "
			+ " WHERE user_code = ? ";
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, userCode);
		rs = pstmt.executeQuery();
		
		List<MyDeliveryInfoDTO> myData = null;
		MyDeliveryInfoDTO temp = null;
		if (rs.next()) {
			myData = new ArrayList<MyDeliveryInfoDTO>();
			do {
				temp = new MyDeliveryInfoDTO(rs.getInt("ma_seq")
						, rs.getString("ma_name")
						, rs.getInt("ma_zipcode")
						, rs.getString("ma_address1")
						, rs.getString("ma_address2")
						, rs.getString("ma_phone")
						, rs.getInt("ma_default"));

				myData.add(temp);
			}while(rs.next());
		}
		
		
		return myData;
	}finally {
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
	}
	
	}
}
