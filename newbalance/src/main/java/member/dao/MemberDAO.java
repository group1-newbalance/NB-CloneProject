package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.tribes.util.Arrays;

import jdbc.connection.JdbcUtil;
import manager.service.MemberView;
import member.domain.CartOptionDTO;
import member.domain.CartProductDTO;
import member.domain.MemberDTO;

public class MemberDAO implements IMember {
	private static MemberDAO memberDAO = null;

	public static MemberDAO getInstance() {
		if (memberDAO == null) {
			memberDAO = new MemberDAO();
		}
		return memberDAO;
	}

	public MemberDTO selectMemberById(Connection conn, String id) throws SQLException {
		String sql = " SELECT * FROM user_info WHERE user_id = ? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			MemberDTO member = null;
			if (rs.next()) {
				member = new MemberDTO(rs.getString("user_code"), rs.getString("user_id"), rs.getString("user_pwd"),
						rs.getInt("user_gender"), rs.getString("user_skt"), rs.getString("user_phone"),
						rs.getString("user_name"), rs.getString("user_birth"), rs.getInt("user_nativecheck"),
						rs.getString("user_tel"), rs.getInt("user_receiveinfo"), rs.getString("user_specialdate"),
						rs.getString("user_email"), rs.getInt("user_zipcode"), rs.getString("user_insertdate"),
						rs.getInt("user_state"), rs.getInt("user_mileage"), rs.getString("user_friendcode"),
						rs.getString("user_lastlogin"), rs.getString("user_address1"), rs.getString("user_address2"),
						rs.getString("lv"));
			}
			return member;

		} finally {

			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	// 마지막 방문일 업데이트
	public int updateLastLoginDate(Connection conn, String userCode) throws SQLException {
		String sql = " UPDATE user_info SET user_lastlogin = SYSDATE " + " WHERE user_code = ? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			int rowCount = pstmt.executeUpdate();

			return rowCount;

		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public String selectIdtByHp(Connection conn, String custName, String cellNo) throws SQLException {
		String sql = " SELECT user_id  FROM user_info " + " WHERE user_phone = ? AND user_name=? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cellNo);
			pstmt.setString(2, custName);
			rs = pstmt.executeQuery();

			String id = null;
			if (rs.next()) {
				id = rs.getString("user_id");
			}
			return id;

		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	// 회원비번 업데이트
	public int updatePwdById(Connection conn, String custId, String pwd) throws SQLException {
		String sql = " UPDATE user_info SET user_pwd = ? " + " WHERE user_id = ? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, custId);
			int rowCount = pstmt.executeUpdate();

			return rowCount;

		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}



	// 회원가입
	public int insert(Connection conn, MemberDTO mem) throws SQLException {
		System.out.println("dao : "+mem.toString());
		PreparedStatement pstmt = null;
		String sql = " insert into user_info("
				+ "user_code, user_id, user_pwd, "
				+ "user_gender, user_skt, user_phone,"
				+ "user_name, user_birth, user_nativecheck,"
				+ "user_tel, user_receiveinfo, user_specialdate"
				+ " ,user_email ,user_zipcode, user_insertdate,"
				+ " user_state, user_friendcode, user_address1,user_address2) "
				
				+ "values('M'||trim(to_char(user_Seq1.nextval)),?,?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE,1,DBMS_RANDOM.STRING('X',10),?,?) ";
		try {
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mem.getUserId());
				pstmt.setString(2, mem.getUserPwd());
				pstmt.setInt(3, mem.getUserGender());
				pstmt.setString(4, mem.getUserSkt());
				pstmt.setString(5, mem.getUserPhone());
				pstmt.setString(6, mem.getUserName());
				pstmt.setString(7, mem.getUserBirth());
				pstmt.setInt(8, mem.getUserNativecheck());
				pstmt.setString(9, mem.getUserTel());
				pstmt.setInt(10, mem.getUserReceiveinfo());
				pstmt.setString(11, mem.getUserSpecialdate());
				pstmt.setString(12, mem.getUserEmail());
				pstmt.setInt(13, mem.getUserZipcode());
				pstmt.setString(14, mem.getUserAddress1());
				pstmt.setString(15, mem.getUserAddress2());
			
			return pstmt.executeUpdate(); 
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	
	//회원 수정
	
	   public int update(Connection con, MemberDTO myInfo) throws SQLException { 
	      PreparedStatement pstmt = null;

	      String sql="update user_info "
	            + "set  user_pwd = ? , user_phone=?,user_tel = ?, user_recelveinfo = ?,user_spacialdate = ?, user_email = ? , "
	            + "user_zipcode= ?,user_address1 = ?, user_address2 = ? where user_code = ?";
	          
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, myInfo.getUserPwd());
	         pstmt.setString(2, myInfo.getUserPhone());
	         pstmt.setString(3, myInfo.getUserTel());
	         pstmt.setInt   (4, myInfo.getUserReceiveinfo());
	         pstmt.setString(5, myInfo.getUserSpecialdate());
	         pstmt.setString(6, myInfo.getUserEmail());
	         pstmt.setInt(7, myInfo.getUserZipcode());
	         pstmt.setString(8, myInfo.getUserAddress1());
	         pstmt.setString(9, myInfo.getUserAddress2());
	         pstmt.setString(10, myInfo.getUserCode());
	         int rowCount = pstmt.executeUpdate();
				System.out.println("안녕"+rowCount);
				return rowCount;
			}finally {
				JdbcUtil.close(pstmt);
			}
		}

	public MemberDTO getMemberInfo(Connection conn, String userCode) throws SQLException {
		String sql = "SELECT * FROM user_info WHERE user_code = ?";
				
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			rs = pstmt.executeQuery();
			
			MemberDTO myInfo = null;
			if (rs.next()) {
				myInfo =  new MemberDTO(rs.getString("user_code"), rs.getString("user_id"),rs.getString("user_pwd"),
						rs.getInt("user_gender"), rs.getString("user_skt"), rs.getString("user_phone"),
						rs.getString("user_name"), rs.getString("user_birth"), rs.getInt("user_nativecheck"),
						rs.getString("user_tel"), rs.getInt("user_receiveinfo"), rs.getString("user_specialdate"),
						rs.getString("user_email"), rs.getInt("user_zipcode"), rs.getString("user_insertdate"),
						rs.getInt("user_state"), rs.getInt("user_mileage"), rs.getString("user_friendcode"),
						rs.getString("user_lastlogin"), rs.getString("user_address1"),rs.getString("user_address2"), rs.getString("lv"));
		
			}
			
			return myInfo;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
}


	// 장바구니 갯수 가져오기
	public int getCartCount(Connection conn, String userCode) throws SQLException {
		String sql = " SELECT count(*) cart_count " + " FROM cart " + " WHERE user_code = ? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			rs = pstmt.executeQuery();

			int cartCount = 0;
			if (rs.next()) {
				cartCount = rs.getInt("cart_count");
			}
			return cartCount;

		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

	}

	public List<CartProductDTO> getCartList(Connection conn, String userCode) throws SQLException {
		String sql = " SELECT cart_num, user_code,  pd_code,  size_code, "
				+ "       color, cart_count, pd_image, pd_name, "
				+ "       pd_price,  sz, "
				+ "       CASE WHEN NVL(pd_mincount,10) >= stock_count THEN stock_count ELSE NVL(pd_mincount,10) "
				+ "       END as max_count " 
				+ "			FROM ( SELECT cart_num, user_code, "
				+ "               c.pd_code, ps.size_code, color, "
				+ "               cart_count, c.pd_image, c.pd_name, "
				+ "               c.pd_price, "
				+ "               (SELECT sz FROM size_list WHERE size_code = c.size_code) as sz, "
				+ "               p.pd_mincount, ps.stock_count "
				+ "         FROM  cart c JOIN product p ON p.pd_code = c.pd_code "
				+ "                      JOIN product_stock ps ON ps.pd_code = c.pd_code "
				+ "        WHERE c.pd_code||c.size_code = ps.pd_code||ps.size_code AND c.user_code = ? "
				+ "     )";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			rs = pstmt.executeQuery();

			List<CartProductDTO> myData = null;
			CartProductDTO temp = null;
			if (rs.next()) {
				myData = new ArrayList<CartProductDTO>();
				do {
					temp = new CartProductDTO(rs.getInt("cart_num"), rs.getString("pd_code"), rs.getInt("size_code"),
							rs.getString("color"), rs.getInt("cart_count"), rs.getString("pd_image"),
							rs.getString("pd_name"), rs.getInt("pd_price"), rs.getString("sz"), rs.getInt("max_count"));

					myData.add(temp);
				} while (rs.next());
			}

			return myData;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public int updateCartQty(Connection conn, int cartNum, int cartCount, String userCode) throws SQLException {
		String sql = " UPDATE cart " + " SET cart_count = ? " + " WHERE cart_num = ? and user_code = ?";

		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cartCount);
			pstmt.setInt(2, cartNum);
			pstmt.setString(3, userCode);
			int rowCount = pstmt.executeUpdate();

			return rowCount;
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public int deleteCartProduct(Connection conn, String userCode, String[] delCartList)  throws SQLException{
		PreparedStatement pstmt = null;
		int rowCount = 0;
		System.out.println("deleteCartProduct dao 호출됨");

		String sql = "DELETE FROM cart " + "WHERE user_code = ?  and cart_num  in (";

		String str = "";
		for (int i = 0; i < delCartList.length; i++) {
			str += String.format("%s", delCartList[i]) + (i != delCartList.length - 1 ? ", " : ") ");
		}
		sql += str;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userCode);
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		return rowCount;
	}

	public int updateCartOption(Connection conn, int cartNum, String pdCode, int sizeCode, String color) throws SQLException {
		
		String sql1 = " SELECT color_code"
				+ " FROM color "
				+ " WHERE color = ? ";
				
		String sql2 = " UPDATE cart " 
				+ " SET size_code = ?, color = ?, pd_code = ? " 
				+ " WHERE cart_num = ?  ";
		
		PreparedStatement pstmt1 = null, pstmt2 = null;
		ResultSet  rs1 = null;
		int colorCode ;
		try {
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setString(1, color);
			
			rs1 = pstmt1.executeQuery();
			rs1.next();
			
			colorCode = rs1.getInt("color_code");
		
			String ppdCode = pdCode.substring(0, 8) +colorCode ;
	
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, sizeCode);
			pstmt2.setString(2, color);
			pstmt2.setString(3, ppdCode);
			pstmt2.setInt(4, cartNum);
			
			int rowCount = pstmt2.executeUpdate();

			return rowCount;
		} finally {
			JdbcUtil.close(pstmt1);
			JdbcUtil.close(rs1);
			JdbcUtil.close(pstmt2);

		}
	}

	public List<CartOptionDTO> getCartOption(Connection conn, String pdCode) throws SQLException {
			String sql1 = " SELECT DISTINCT pd_code, SUBSTR(ps.pd_code, 9, 2), c.color color, c.color_url color_url "
					+ " FROM product_stock ps JOIN color c ON SUBSTR(ps.pd_code, 9, 2) = c.color_code "
					+ " WHERE pd_code LIKE  ? " ;
			
			PreparedStatement pstmt1 = null, pstmt2 = null;
			ResultSet rs1 = null, rs2 = null;
			String key1 = null, key2 = null;
			CartProductDTO pDto = null;
			CartOptionDTO oDto = null;
			List<CartProductDTO> pList = null;
			List<CartOptionDTO> oList = null;
			try {
				pstmt1=conn.prepareStatement(sql1);
				System.out.println(String.format("%s", pdCode.substring(0, 8)));
				pstmt1.setString(1, String.format("%s", pdCode.substring(0, 8)+"%"));
				rs1 = pstmt1.executeQuery();
				oList = new ArrayList<>();
				if (rs1.next()) {
					key1 = new String();
					key2 = new String();
					
					do {
						key1 = rs1.getString("color");
						key2 = rs1.getString("color_url");
						System.out.println("color : " + key1);
						System.out.println("color_url : " + key2);
								
						String sql2 = " SELECT pd_code, ps.size_code size_code, sz, stock_count "
								+ " FROM product_stock ps JOIN size_list sl ON ps.size_code = sl.size_code "
								+ " WHERE pd_code = ? "
								+ " ORDER BY pd_code, ps.size_code ";
						try {
							pstmt2 = conn.prepareStatement(sql2); 
							pstmt2.setString(1, rs1.getString("pd_code"));
							rs2 = pstmt2.executeQuery();
							
							if(rs2.next()) {
								pList = new ArrayList<CartProductDTO>();
								do {
									pDto = new CartProductDTO(
											rs2.getString("pd_code")
											, rs2.getInt("size_code")
											, rs2.getString("sz")
											, rs2.getInt("stock_count"));
											
									pList.add(pDto);
								}while(rs2.next());
								oDto = new CartOptionDTO(key1, key2, pList);
								oList.add(oDto);
							}
							
						}catch (Exception e){
							e.printStackTrace();
						}

					}while(rs1.next());
					
				}

			}finally {
				JdbcUtil.close(rs1);
				JdbcUtil.close(pstmt1);
				JdbcUtil.close(rs2);
				JdbcUtil.close(pstmt2);
			}
			
			
			return oList;
		}

	public boolean isDuplicateOption(Connection conn, String userCode, String pdCode, int sizeCode) throws SQLException {

		String sql = " SELECT count(*) count " 
					+ " FROM cart " 
					+ " WHERE user_code = ? and pd_code = ? and size_code = ? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			pstmt.setString(2, pdCode);
			pstmt.setInt(3, sizeCode);
			
			rs = pstmt.executeQuery();

			int cartCount = 0;
			if (rs.next()) {
				cartCount = rs.getInt("count");
			}
			
			if(cartCount == 0) {
				return false;
			}else {
				return true;
			}

		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

	}

	@Override
	public MemberView getMemberList(int pageNumber) {
		// TODO Auto-generated method stub
		return null;
	}

}
