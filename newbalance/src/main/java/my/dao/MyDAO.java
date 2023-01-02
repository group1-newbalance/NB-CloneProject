package my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.connection.JdbcUtil;
import my.domain.CouponDTO;
import my.domain.MbLevelDTO;
import my.domain.MileageDTO;
import my.domain.MyDeliveryInfoDTO;
import my.domain.MyMainDTO;
import my.domain.QuestionDTO;
import support.domain.StoreDTO;
import my.domain.MyNbPointDTO;
import my.domain.MyWishDTO;
import my.domain.SaleCodeDTO;


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
  
  
  public List<MyWishDTO> getMemberWishList(Connection conn, String userCode) throws SQLException {
		String sql = " SELECT pd_code, img_url, user_code, pd_price, pd_name, wish_code "
				+ " FROM (SELECT ROW_NUMBER() OVER(PARTITION BY pi.pd_code ORDER BY img_seq) row_num, pi.pd_code pd_code , img_url, user_code, pd_price, pd_name, wish_code "
				+ "    FROM wishlist w JOIN product p ON w.pd_code = p.pd_code "
				+ "                    JOIN product_image pi ON p.pd_code = pi.pd_code "
				+ "    ORDER BY pi.pd_code, img_seq) "
				+ " WHERE row_num = 1 and user_code = ?  ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			rs = pstmt.executeQuery();
			
			List<MyWishDTO> myData = null;
			MyWishDTO temp = null;
			if (rs.next()) {
				myData = new ArrayList<MyWishDTO>();
				do {
					temp = new MyWishDTO(rs.getString("pd_code")
							, rs.getString("img_url")
							, rs.getInt("pd_price")
							, rs.getString("pd_name")
							, rs.getInt("wish_code"));
	
					myData.add(temp);
				}while(rs.next());
			}
			
			return myData;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
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


	public int deleteWishList(Connection conn, String userCode, String[] wishList) {
		PreparedStatement pstmt = null;
		int rowCount = 0;
		System.out.println("deleteWishList dao 호출됨");

		String sql = "DELETE FROM wishlist " + "WHERE user_code = ?  and wish_code  in (";

		String str = "";
		for (int i = 0; i < wishList.length; i++) {
			str += String.format("%s", wishList[i]) + (i != wishList.length - 1 ? ", " : ") ");
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

	@Override
	public MbLevelDTO getMbLevel(Connection conn, String userCode) throws SQLException {

		String sql = " SELECT lv, current_score, buy_count, buy_amount, user_point, need_score "
				+ " FROM user_level "
				+ " WHERE user_code = ? ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			rs = pstmt.executeQuery();

			MbLevelDTO levelDto = null;
			if (rs.next()) {
				levelDto = new MbLevelDTO(rs.getString("lv")
						, rs.getInt("current_score")
						, rs.getInt("buy_count")
						, rs.getInt("buy_amount")
						, rs.getInt("user_point")
						, rs.getInt("need_score"));

			}

			return levelDto;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

	}

	@Override
	public SaleCodeDTO getSaleCode(Connection conn, String userCode) throws SQLException {

		String sql = " SELECT user_friendcode "
				+ " FROM user_info "
				+ " WHERE user_code = ? ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			rs = pstmt.executeQuery();

			SaleCodeDTO salecodeDto = null;
			if (rs.next()) {
				salecodeDto = new SaleCodeDTO(rs.getString("user_friendcode"));

			}

			return salecodeDto;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

	}

	public int getMileage(Connection conn, String userCode) throws SQLException {

		String sql = " SELECT NVL((SELECT SUM(MI_USED_M) "
				+ " FROM MY_MILEAGE "
				+ " WHERE USER_CODE = ? AND MI_USED = 1), 0) - "
				+ " NVL((SELECT SUM(MI_USED_M) "
				+ " FROM MY_MILEAGE "
				+ " WHERE USER_CODE = ? AND MI_USED = 0), 0)  userMile"
				+ " FROM DUAL ";


		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			pstmt.setString(2, userCode);
			rs = pstmt.executeQuery();

			int userMile = 0;
			if (rs.next()) {
				userMile = rs.getInt("userMile");

			}

			return userMile;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

	}


	public ArrayList<MileageDTO> selectMileageByDate(Connection conn, String userCode, String sDate, String eDate) throws SQLException {

		String sql = " SELECT m.mi_date mi_date, c.mi_content mi_content, m.mi_used_m mi_used_m, m.mi_used mi_used "
				+ "FROM my_mileage m join mileage_code c on m.mi_code = c.mi_code "
				+ "WHERE user_code = ? and mi_date >= ? and mi_date <= ? ";


		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			pstmt.setString(2, sDate);
			pstmt.setString(3, eDate);
			rs = pstmt.executeQuery();

			ArrayList<MileageDTO> miList = null;
			if (rs.next()) {
				miList = new ArrayList<MileageDTO>();
				MileageDTO miDto = null;
				do {
					miDto = new MileageDTO();
					miDto.setUsedMile(rs.getInt("mi_used"));
					miDto.setMileAmount(rs.getInt("mi_used_m"));
					miDto.setMileDate(rs.getString("mi_date"));
					miDto.setMileContent(rs.getString("mi_content"));

					miList.add(miDto);
				}while(rs.next());
			}
			return miList;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

	}

	public ArrayList<CouponDTO> getCoupon(Connection conn, String userCode) throws SQLException {

		String sql = " SELECT c.cp_code cp_code, c.cp_benefitamt cp_benefitamt, c.cp_name cp_name, c.cp_condiamt cp_condiamt,"
				+ " c.cp_benefitype cp_benefitype, u.cp_speriod cp_speriod, u.cp_eperiod cp_eperiod, c.cp_condition cp_condition, c.cp_conditype cp_conditype "
				+ " FROM coupon c join user_coupon u on c.cp_code = u.cp_code "
				+ " WHERE u.user_code = ? ";


		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userCode);

			rs = pstmt.executeQuery();

			ArrayList<CouponDTO> cpList = null;
			if (rs.next()) {
				cpList = new ArrayList<CouponDTO>();
				CouponDTO cpDto = null;
				do {
					cpDto = new CouponDTO();
					cpDto.setcpCode(rs.getString("cp_code"));
					cpDto.setBfAmount(rs.getDouble("cp_benefitamt"));
					cpDto.setCpName(rs.getString("cp_name"));
					cpDto.setCondiAmount(rs.getInt("cp_condiamt"));
					cpDto.setBfType(rs.getInt("cp_benefitype"));
					cpDto.setsPeriod(rs.getString("cp_speriod"));
					cpDto.setePeriod(rs.getString("cp_eperiod"));
					cpDto.setCpCondition(rs.getString("cp_condition"));
					cpDto.setcpCondiType(rs.getInt("cp_conditype"));

					cpList.add(cpDto);
				}while(rs.next());
			}
			return cpList;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

	}
	
	public ArrayList<CouponDTO> selectCouponByDate(Connection conn, String userCode, String sDate, String eDate) throws SQLException {

		String sql = " SELECT c.cp_code cp_code, c.cp_benefitamt cp_benefitamt, c.cp_name cp_name, c.cp_condiamt cp_condiamt,"
				+ " c.cp_benefitype cp_benefitype, u.cp_speriod cp_speriod, u.cp_eperiod cp_eperiod, c.cp_condition cp_condition, c.cp_conditype cp_conditype "
				+ " FROM coupon c join user_coupon u on c.cp_code = u.cp_code "
				+ " WHERE u.user_code = ? and cp_speriod >= ? and cp_eperiod <= ? ";


		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			pstmt.setString(2, sDate);
			pstmt.setString(3, eDate);

			rs = pstmt.executeQuery();

			ArrayList<CouponDTO> cpList = null;
			if (rs.next()) {
				cpList = new ArrayList<CouponDTO>();
				CouponDTO cpDto = null;
				do {
					cpDto = new CouponDTO();
					cpDto.setcpCode(rs.getString("cp_code"));
					cpDto.setBfAmount(rs.getDouble("cp_benefitamt"));
					cpDto.setCpName(rs.getString("cp_name"));
					cpDto.setCondiAmount(rs.getInt("cp_condiamt"));
					cpDto.setBfType(rs.getInt("cp_benefitype"));
					cpDto.setsPeriod(rs.getString("cp_speriod"));
					cpDto.setePeriod(rs.getString("cp_eperiod"));

					cpList.add(cpDto);
				}while(rs.next());
			}
			return cpList;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

	}
	
	public CouponDTO getUserCoupon(Connection conn, String userCode, String cpCode) throws SQLException {

		String sql = " SELECT c.cp_benefitamt cp_benefitamt, c.cp_name cp_name, u.cp_speriod cp_speriod, u.cp_eperiod cp_eperiod, c.cp_condition cp_condition,  c.cp_benefitype cp_benefitype "
				       + " FROM coupon c join user_coupon u on c.cp_code = u.cp_code "
				       + " WHERE u.user_code = ? and c.cp_code = ? ";


		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			pstmt.setString(2, cpCode);

			rs = pstmt.executeQuery();

			CouponDTO cpDto = null;
			if (rs.next()) {
				cpDto = new CouponDTO(
						rs.getDouble("cp_benefitamt"),
						rs.getString("cp_name"),
						rs.getString("cp_speriod"),
						rs.getString("cp_eperiod"),
						rs.getString("cp_condition"),
						rs.getInt("cp_benefitype")
						
						);

			}
			return cpDto;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

	}
	
	public ArrayList<MyNbPointDTO> selectMyNbPointByDate(Connection conn, String userCode, String sDate, String eDate) throws SQLException {

		String sql = " SELECT a.mynb_details mynb_details, m.mynb_used_p mynb_used_p, m.mynb_date mynb_date"
				       + " FROM mynbapp m join user_info i on m.user_code = i.user_code "
				       + "               join mynb_act a on m.mynb_code = a.mynb_code "
				       + " WHERE i.user_code = ? "
				       + " ORDER BY mynb_date asc ";


		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			pstmt.setString(2, sDate);
			pstmt.setString(3, eDate);
			rs = pstmt.executeQuery();

			ArrayList<MyNbPointDTO> mpList = null;
			if (rs.next()) {
				mpList = new ArrayList<MyNbPointDTO>();
				MyNbPointDTO mpDto = null;
				do {
					mpDto = new MyNbPointDTO();
					mpDto.setMynbDetails(rs.getString("mynb_details"));
					mpDto.setMynbPoint(rs.getInt("mynb_used_p"));
					mpDto.setMynbDate(rs.getString("mynb_date"));

					mpList.add(mpDto);
				}while(rs.next());
			}
			return mpList;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

	}
	
	@Override
	public MyNbPointDTO getLevel(Connection conn, String userCode) throws SQLException {

		String sql = " SELECT u.lv lv, l.user_point user_point "
				       + " FROM user_info u join user_level l on u.user_code = l.user_code "
				       + " WHERE u.user_code = ? ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			rs = pstmt.executeQuery();

			MyNbPointDTO glDto = null;
			if (rs.next()) {
				glDto = new MyNbPointDTO(
						rs.getString("lv")
						, rs.getInt("user_point"));

			}

			return glDto;
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

	}


}
