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
import my.domain.MywishDTO;
import my.domain.QuestionDTO;
import support.domain.StoreDTO;

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

	@Override
	public List<MywishDTO> getMyWishlist(Connection conn, String userCode) throws SQLException {
		
		ArrayList<MywishDTO> list = null;
		
		String sql = " SELECT b.* "
        + " FROM (  "
		+ "	        SELECT ROWNUM no, t.*  "
		+ "	        FROM (  "
		+ "						SELECT *  "
		+ "							FROM wishlist w JOIN product p ON w.pd_code = p.pd_code "
		+ "							                JOIN product_image i ON w.pd_code = i.pd_code "
		+ "							                WHERE user_code = ? "
		+ "							                    ) t "
		+ "	       	) b "
		+ " WHERE  b.no = 1 ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userCode);

			rs = pstmt.executeQuery();

			if(rs.next()) {
			
		list = new ArrayList<MywishDTO>();
		
		MywishDTO mywishdto = null;
		
		do {
			
			mywishdto = new MywishDTO(
					rs.getInt("wish_code")
					,rs.getString("pd_code")
					,rs.getString("user_code")
					,rs.getString("wish_insertdate")
					,rs.getString("wish_expiredate")
					,rs.getString("pd_name")
					,rs.getInt("pd_price")
					,rs.getString("img_url")
					);
			
			list.add(mywishdto);
			
		}while(rs.next());
			
		}
		
	} finally {
		JdbcUtil.close(pstmt);
		JdbcUtil.close(rs);     
		
	} // finally
	
	return list;
	
	}


	public int getTotalWish(Connection con) throws SQLException {
		int totalCount = 0;
		
		String sql  = " SELECT COUNT(*) ";
		sql += " FROM wishlist WHERE user_code = ? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "user_code");
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				totalCount = rs.getInt(1);	
			}
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} // finally
		
		return totalCount;
	}

	public List<QuestionDTO> getMyQuestion(Connection conn, String userCode) throws SQLException {
		
			System.out.println("userCode = " + userCode);
			ArrayList<QuestionDTO> list = null;
			
			String sql  = " SELECT * ";
			sql += " FROM qna q JOIN question_type qt ON q.qt_seq = qt.qt_seq ";
			sql += " 					JOIN user_info u ON q.user_code = u.user_code ";
			sql += " WHERE u.user_code = ? " ;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userCode);
				
				rs = pstmt.executeQuery();
				if ( rs.next() ) {
					System.out.println("userCode = " + userCode);
					list = new ArrayList<QuestionDTO>();
					QuestionDTO dto = null;
					do {
						dto = new QuestionDTO(
								
								rs.getInt("qna_code")
								,rs.getString("user_code")
								,rs.getString("qna_writedate")
								,rs.getString("qna_status")
								,rs.getInt("qt_seq")
								,rs.getString("qt_content")
								,rs.getString("qna_replydate")
								,rs.getString("qna_title")
								,rs.getString("qna_content")
								,rs.getString("pd_code")
								,rs.getString("ord_code")
								,rs.getString("qna_file")
								,rs.getString("qna_reply")
								,rs.getString("user_email")
								,rs.getString("user_name")
								,rs.getString("user_phone")
								);

						list.add(dto);
						
					} while ( rs.next() );
				} // if
				
			} finally {
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);         
			} // finally
			return list;

	}


	
}
