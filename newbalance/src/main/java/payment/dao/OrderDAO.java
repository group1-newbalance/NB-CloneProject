package payment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.connection.JdbcUtil;
import member.domain.MemberDTO;
import payment.domain.CouponDTO;
import payment.domain.OrderDTO;
import payment.domain.OrderInfoDTO;
import payment.domain.PayCancelDTO;
import payment.domain.PaymentInfoDTO;
import payment.domain.ShipInfoDTO;

public class OrderDAO implements IOrder{
		
		//싱글톤
	private static OrderDAO paymentDAO = null;
	   public static OrderDAO getInstance() {
	      if(  paymentDAO == null) {
	    	  paymentDAO = new OrderDAO();
	      }
	      return paymentDAO;
	   }
	   
	@Override
	public int insertOrder(Connection conn, OrderDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = " insert into order_list (ord_code, ord_amount,ord_discount,user_phone,ord_name,user_email "
				+ "				        , ord_date,ord_zipcode,ord_address,ord_cf_date,ord_cf_check,nonuser_code,user_code,usercp_seq,mi_seq )"
				+ "        values( ?,?,?,?,?,?,SYSDATE,?,?,?,?,?,?";
		if (dto.getUsercpSeq()== -1 && dto.getMi_seq()==-1) {
			// 둘다 안썼을때
			sql+=",null,null )";
			
		}else if(dto.getMi_seq()==-1 && dto.getUsercpSeq()!= -1) {
			// 쿠폰 사용했을때
			sql+=",?,null )";
			
		}else if(dto.getMi_seq()!=-1 && dto.getUsercpSeq()== -1 ) {
			// 마일리지 사용했을때
			sql+=",null,?)";
		}
		//System.out.println(sql);
		//System.out.println("에러찾고싶어요"+dto.toString());
		int rowCount = 0;
		try {
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getOrdCode()); 
		pstmt.setInt(2,dto.getOrdAmount() );
		pstmt.setInt(3, dto.getOrdDiscount());
		pstmt.setString(4, dto.getUserPhone());
		pstmt.setString(5, dto.getOrdName());
		pstmt.setString(6, dto.getUserEmail());
		//pstmt.setString(7, dto.getOrdDate());
		pstmt.setInt(7,dto.getOrdZipcode() );
		pstmt.setString(8, dto.getOrdAddress());
		pstmt.setString(9, dto.getOrdCfDate());
		pstmt.setInt(10, dto.getOrdCfCheck());
		pstmt.setString(11, dto.getNonUserCode());
		pstmt.setString(12, dto.getUserCode());
		if(dto.getMi_seq()==-1 && dto.getUsercpSeq()!= -1) {
			// 쿠폰 사용했을때
			pstmt.setInt(13,dto.getUsercpSeq());
			
		}else if(dto.getMi_seq()!=-1 && dto.getUsercpSeq()== -1 ) {
			// 마일리지 사용했을때
			pstmt.setInt(13, dto.getMi_seq());
		}
		
		
		System.out.println("빠져나옴"+dto.toString());
		rowCount = pstmt.executeUpdate();
		
		
		
		 	} finally {
				JdbcUtil.close(pstmt);
		 }
		return rowCount;
	}
		
	
	
	
	public MemberDTO selectMemberByUserCode(Connection conn, String userCode) throws SQLException {
		String sql = " SELECT * FROM user_info WHERE user_code = ? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
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
	
	//쿠폰반환
	@Override
	public List<CouponDTO> showCoupon(Connection conn, String userCode) throws SQLException {
		String sql =" select c.cp_code cp_code ,cp_usetype,cp_name,cp_conditype,cp_condiamt "
				+ " ,cp_condition,cp_benefitype,cp_benefitamt,cp_validtype,cp_validity "
				+ " ,usercp_seq,user_code,cp_speriod,cp_eperiod  "
				+ " from coupon c JOIN USER_Coupon uc ON  uc.cp_code = c.cp_code where user_code = ? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CouponDTO> list = null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				list = new ArrayList<CouponDTO>();
				CouponDTO dto = null;
				
				do {
					dto = new CouponDTO();
					
					dto.setCpCode(rs.getString("cp_code"));
					dto.setCpUseType(rs.getInt("cp_usetype"));
					dto.setCpName(rs.getString("cp_name"));
					dto.setCpCondiType(rs.getInt("cp_conditype"));
					dto.setCpCondiAmt(rs.getInt("cp_condiamt"));
					dto.setCpCondition(rs.getString("cp_condition"));
					dto.setCpBenefitAmt(rs.getDouble("cp_benefitamt"));
					dto.setCpValidType(rs.getString("cp_validtype"));
					dto.setCpValidity(rs.getInt("cp_validity"));
					dto.setUserCpSeq(rs.getInt("usercp_seq"));
					dto.setCpSperiod(rs.getString("cp_speriod"));
					dto.setCpEperiod(rs.getString("cp_eperiod"));
					list.add(dto);
					System.out.println(dto.toString());
					
				} while (rs.next());
				
				return list;
			}
			
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}// finally	
		return null;
	}

	@Override
	public int insertOrderInfo(Connection conn, OrderInfoDTO ordInfo) throws SQLException {
		//System.out.println("DAO 들어옴"+ordInfo.toString());
		PreparedStatement pstmt = null;
		String sql = "insert into order_info(ordinfo_seq  ,pd_code ,color  ,ordinfo_count  ,  sz,  os_status,ord_code,img_url) "
				+ "values(ordinfo_seq.NEXTVAL,	?, ? , ?	,?,	'결제완료', ? ,? )";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordInfo.getPdCode());
			pstmt.setString(2, ordInfo.getColor());
			pstmt.setInt(3, ordInfo.getOrdInfoCount());
			pstmt.setString(4, ordInfo.getSz());
			pstmt.setString(5,ordInfo.getOrdCode());
			pstmt.setString(6, ordInfo.getImgUrl());
			
			System.out.println("DAO 빠져나옴"+ordInfo.toString());
			return pstmt.executeUpdate(); 
		} finally {
			JdbcUtil.close(pstmt);
		}
	}


	@Override
	public int insertShipInfo(Connection conn, ShipInfoDTO shipInfo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = " insert into ship_info(ord_code,ship_name,ship_phone "
				+ ", ship_zipcode,ship_phone2,ship_request,ship_address,user_code) "
				+ " values(?,?,?,?,?,?,?,?) ";
		try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, shipInfo.getOrdCode());
		pstmt.setString(2, shipInfo.getShipName());
		pstmt.setString(3, shipInfo.getShipPhone());
		pstmt.setInt(4, shipInfo.getShipZipCode());
		pstmt.setString(5, shipInfo.getShipPhone2());
		pstmt.setString(6,shipInfo.getShipRequest());
		pstmt.setString(7, shipInfo.getShipAddress());
		pstmt.setString(8, shipInfo.getUserCode());
		
		return pstmt.executeUpdate(); 
			} finally {
				JdbcUtil.close(pstmt);
		}
	}

	@Override
	public int insertPaymentInfo(Connection conn, PaymentInfoDTO payInfo) throws SQLException {
		PreparedStatement pstmt = null;
		
		String sql = " insert into payment_info( pay_code , user_code, pay_type , ord_discount "
				+ ", ord_amount "
				+ ", pay_name ,pay_date, pay_status, ord_code, img_url, pd_name , card_seq, bank_seq)"
				+ "values(PAY_CODE.nextval , ?, ? , ? , ? , ?,SYSDATE, ?, ?, ?, ? ";
		if (payInfo.getBankSeq()== -1 && payInfo.getCardSeq()==-1) {
			// 페이류 결제 ==  둘다 안썼을때 
			sql+=",null,null )";
			
		}else if(payInfo.getBankSeq()==-1 && payInfo.getCardSeq()!= -1) {
			// 카드 사용했을때
			sql+=",?,null )";
			
		}else if(payInfo.getBankSeq()!=-1 && payInfo.getCardSeq()== -1 ) {
			// 은행 사용했을때
			sql+=",null,?)";
		}
		
		try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, payInfo.getUserCode());
		pstmt.setString(2, payInfo.getPayType());
		pstmt.setInt(3, payInfo.getOrdDisCount());
		pstmt.setInt(4, payInfo.getOrdAmount());
		pstmt.setString(5, payInfo.getPayName());
		pstmt.setString(6, payInfo.getPayStatus());
		pstmt.setString(7, payInfo.getOrdCode());
		pstmt.setString(8, payInfo.getImgUrl());
		pstmt.setString(9, payInfo.getPdName());
		
		if(payInfo.getBankSeq()==-1 && payInfo.getCardSeq()!= -1) {
			// 카드 사용했을때
			pstmt.setInt(10, payInfo.getCardSeq());
			
		}else if(payInfo.getBankSeq()!=-1 && payInfo.getCardSeq()== -1 ) {
			// 은행 사용했을때
			pstmt.setInt(10, payInfo.getBankSeq());
		}
		System.out.println("DAO" + payInfo.toString());
		
		return pstmt.executeUpdate(); 
			} finally {
				JdbcUtil.close(pstmt);
		}
	}
	
	   
	    
	   
}
