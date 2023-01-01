package payment.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import payment.domain.PayCancelDTO;
import payment.domain.PayCancelDetailDTO;


public interface IPayCancel {
	public PayCancelDTO selectPayCancel(Connection conn, String userCode) throws SQLException; 
	public List<PayCancelDTO> showPayCancel(Connection conn, String userCode)  throws SQLException; 
	public PayCancelDetailDTO showCancelDetail(Connection conn, String orderNo) throws SQLException;
}
