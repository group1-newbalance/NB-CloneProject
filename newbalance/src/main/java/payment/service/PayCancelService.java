package payment.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import payment.dao.PayCancelDAO;
import payment.domain.PayCancelDTO;
import payment.domain.PayCancelDetailDTO;

public class PayCancelService {
private static PayCancelService instance = null;
	
	private PayCancelService() {}
	
	public static PayCancelService getInstance() {
		if(instance == null) {
			instance = new PayCancelService();
		}
		return instance;
	}
	
	public PayCancelDTO selectPayCancel(String userCode) {
		PayCancelDTO cancelData=null;
		PayCancelDAO paycancel = PayCancelDAO.getInstance();
		try (Connection conn = ConnectionProvider.getConnection()){
			cancelData = paycancel.selectPayCancel(conn, userCode);
			
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
		return cancelData;
		
	}
	
	public List<PayCancelDTO>showPayCancel(String userCode){
		
		PayCancelDAO paycancel = PayCancelDAO.getInstance();
		List<PayCancelDTO>list = null;
		try(Connection conn = ConnectionProvider.getConnection()) {
			list = paycancel.showPayCancel(conn, userCode);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return list;
		
		//
	}//showPayCancel
	
	public PayCancelDetailDTO showCancelDetail(String orderNo) {
		PayCancelDetailDTO cancelDetailDTO = null;
		
		try (Connection Conn = ConnectionProvider.getConnection() ){
			PayCancelDAO cancelDao = PayCancelDAO.getInstance();
			cancelDetailDTO = cancelDao.showCancelDetail(Conn, orderNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
			
		return cancelDetailDTO;
	}
	
}
