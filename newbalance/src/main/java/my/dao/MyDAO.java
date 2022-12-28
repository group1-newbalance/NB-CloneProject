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
				+ " WHERE user_code = ? "
				+ " ORDER BY ma_default DESC, ma_seq DESC ";
		
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
							, rs.getString("ma_zipcode")
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
	public void updateMaDefault(Connection conn, String userCode) throws SQLException{
		PreparedStatement pstmt = null;	
		String sql = " UPDATE my_address "
					+ " SET ma_default = 0"
					+ " WHERE user_code = ? AND ma_default = 1 ";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			pstmt.executeUpdate();
	}
	
	
	@Override
	public int insertMemberDeliveryInfo(Connection conn, MyDeliveryInfoDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = " INSERT INTO my_address "
				+ " VALUES(TO_NUMBER((select MAX(ma_seq) + 1 FROM  my_address)), ?, ?, ?, ?, ?, ?, ?) ";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserCode());
			pstmt.setString(2, dto.getMaName().trim());
			pstmt.setString(3, dto.getMaZipcode().trim());
			pstmt.setString(4, dto.getMaAddress1().trim());
			pstmt.setString(5, dto.getMaPhone().trim());
			pstmt.setInt(6, dto.getMaDefault());
			pstmt.setString(7, dto.getMaAddress2().trim());
			
			int rowCount = pstmt.executeUpdate();
			
			return rowCount;
		}finally {
			JdbcUtil.close(pstmt);
		}

	}
	
	public boolean checkDuplicateDeliveryInfo(Connection conn, MyDeliveryInfoDTO dto ) throws SQLException{
		String sql = " SELECT COUNT(*) cnt"
				+ " FROM my_address "
				+ " WHERE user_code=? and ma_zipcode= ? and ma_address1 = ? and ma_address2=? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserCode());
			pstmt.setString(2, dto.getMaZipcode().trim());
			pstmt.setString(3, dto.getMaAddress1().trim());
			pstmt.setString(4, dto.getMaAddress2().trim());

			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt("cnt") > 0 ? true : false;
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	@Override
	public int updateMemberDeliveryInfo(Connection conn, MyDeliveryInfoDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = " UPDATE my_address "
				+ " SET ma_name = ?, ma_zipcode = ?, ma_address1 = ?, ma_phone = ?, ma_default = ?, ma_address2 = ? "
				+ " WHERE user_code = ? AND ma_seq = ?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMaName().trim());
			pstmt.setString(2, dto.getMaZipcode().trim());
			pstmt.setString(3, dto.getMaAddress1().trim());
			pstmt.setString(4, dto.getMaPhone().trim());
			pstmt.setInt(5, dto.getMaDefault());
			pstmt.setString(6, dto.getMaAddress2().trim());
			pstmt.setString(7,  dto.getUserCode());
			pstmt.setInt(8, dto.getMaSeq());

			int rowCount = pstmt.executeUpdate();
			
			return rowCount;
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	@Override
	public int deleteMemberDeliveryInfo(Connection conn, int maSeq) throws SQLException {
		String sql = " DELETE FROM my_address "
				+ " WHERE ma_seq = ? ";
		
		PreparedStatement pstmt = null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, maSeq);
			int rowCount = pstmt.executeUpdate();
			
			return rowCount;
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
}
