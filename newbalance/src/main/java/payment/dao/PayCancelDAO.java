package payment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import jdbc.connection.JdbcUtil;
import payment.domain.PayCancelDTO;
import payment.domain.PayCancelDetailDTO;
import payment.domain.Payment_infoDTO;

public class PayCancelDAO implements IPayCancel{
	
	  private static PayCancelDAO paymentDAO = null;
	  public static PayCancelDAO getInstance() {
	     if(  paymentDAO == null) {
	    	 paymentDAO = new PayCancelDAO();
	      }
	      return paymentDAO;
	   }
	@Override
	public PayCancelDTO selectPayCancel(Connection conn, String userCode) throws SQLException {
		
		String sql = " select  img_url, pd_name , ord_code , ord_amount , pc_date , pc_status "
				+ " from payment_info i JOIN pay_cancel c ON c.pay_code = i.pay_code "
				+ " where user_code =  ?  ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			rs=pstmt.executeQuery();
			
			PayCancelDTO cancelData = null;
			
			if (rs.next()) {
				cancelData = new PayCancelDTO(
						rs.getString("img_url"),
						rs.getString("pd_name"),
						rs.getString("ord_code"),
						rs.getInt("ord_amount"),
						rs.getString("pc_date"),
						rs.getString("pc_status")
						
						);

			}
			return cancelData;
			
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}// select
	
	@Override
	public List<PayCancelDTO> showPayCancel(Connection conn, String userCode) throws SQLException {
		String sql = " select  img_url, pd_name , ord_code , ord_amount , pc_date , pc_status "
				+ " from payment_info i JOIN pay_cancel c ON c.pay_code = i.pay_code "
				+ " where user_code =  ?  ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<PayCancelDTO> list = null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				list = new ArrayList<PayCancelDTO>();
				PayCancelDTO dto = null;
				
				do {
					dto = new PayCancelDTO();
					
					dto.setImgUrl(rs.getString("img_url"));
					dto.setPdName(rs.getString("pd_name"));
					dto.setOrdCode(rs.getString("ord_code"));
					dto.setOrdAmount(rs.getInt("ord_amount"));
					dto.setPcDate(rs.getString("pc_date"));
					dto.setPcStatus(rs.getString("pc_status"));
					
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
	
	
	// 결제 취소/환불 내역 -> 상세
	@Override
	public PayCancelDetailDTO showCancelDetail(Connection conn, String orderNo) throws SQLException {
		String sql = " select pi.pd_name pd_name, substr(oi.pd_code,-2)color_code ,oi.color color ,pi.ord_discount ord_discount "
				+ "	, pi.ord_amount ord_amount,pi.pay_date pay_date "
				+ " , oi.os_status os_status,pi.img_url img_url "
				+ " ,(pi.ord_amount - pi.ord_discount) total_payamt, c.cp_benefitamt cp_benefitamt, c.cp_benefitype cp_benefitype "
				+ " , (pi.ord_amount * 0.06)addmi ,ol.usercp_seq usercp_seq,ol.mi_seq mi_seq "
				+ " , pi.pay_type pay_type,pc.pc_date pc_date, oi.sz sz, oi.ordinfo_count ordinfo_count ,oi.pd_code pd_code"
				+ " from payment_info pi JOIN  pay_cancel pc ON pi.pay_code = pc.pay_code  "
				+ " 					JOIN order_info oi ON oi.ord_code = pi.ord_code "
				+ " 					JOIN order_list ol ON ol.ord_code = pi.ord_code "
				+ " 					JOIN user_coupon uc ON uc.usercp_seq = ol.usercp_seq " 
				+ " 					JOIN coupon c ON c.cp_code = uc.cp_code "
				+ " where pi.ord_code = ?   ";
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		

		try {
				pstmt= conn.prepareStatement(sql);
				pstmt.setString(1, orderNo);
				rs = pstmt.executeQuery();
				PayCancelDetailDTO cancelDetailDTO = null;
			if (rs.next()) {
				cancelDetailDTO = new PayCancelDetailDTO(
						rs.getString("pd_name")
						,rs.getString("color_code")
						,rs.getString("color")
						,rs.getInt("ord_discount")
						,rs.getInt("ord_amount")
						,rs.getString("pay_date")
						,rs.getString("os_status")
						,rs.getString("img_url")
						,rs.getInt("total_payamt")
						,rs.getDouble("cp_benefitamt")
						,rs.getInt("cp_benefitype")
						,rs.getInt("addmi")
						,rs.getInt("usercp_seq")
						,rs.getInt("mi_seq")
						,rs.getString("pay_type")
						,rs.getString("pc_date")
						,rs.getString("sz")
						,rs.getInt("ordinfo_count")
						);

			}
			return cancelDetailDTO;
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}// finally
		

		
	}

	
}
