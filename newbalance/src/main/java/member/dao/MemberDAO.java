package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.connection.JdbcUtil;
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
						rs.getString("user_lastlogin"), rs.getString("user_address1"),rs.getString("user_address2"), rs.getString("lv"));
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
	 @Override
	   public int update(Connection con, MemberDTO mem) throws SQLException { 
	      PreparedStatement pstmt = null;

	      String sql="update user_info "
	            + "set message=?, guest_name = ?"
	            + "where message_id=? and password=?";
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, message.getMessage());
	         pstmt.setString(2, message.getGuest_name() );
	         pstmt.setInt   (3, message.getMessage_id());
	         pstmt.setString(4, message.getPassword());
	         return pstmt.executeUpdate(); 
	      } finally{
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(con);
	      }
	   }



	/*
	 * public void update(Connection conn, Member member) throws SQLException {
	 * try(PreparedStatement pstmt = conn.prepareStatement(
	 * "update member set name = ?, password = ? where memberid = ?")) {
	 * pstmt.setString(1, member.getUser_name()); pstmt.setString(2,
	 * member.getPassword()); pstmt.setString(3, member.getId());
	 * pstmt.executeUpdate(); } }
	 */

}
