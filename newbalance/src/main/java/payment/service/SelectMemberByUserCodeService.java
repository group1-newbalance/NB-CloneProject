package payment.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import member.domain.MemberDTO;
import payment.dao.OrderDAO;

public class SelectMemberByUserCodeService {
	
	private static SelectMemberByUserCodeService instance = null;
	private SelectMemberByUserCodeService() {}
	public static SelectMemberByUserCodeService getInstance() {
		if(instance == null) {
			instance = new SelectMemberByUserCodeService();
		}
		return instance;
	}

	public MemberDTO selectMemberByUserCode(String UserCode){

		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			OrderDAO dao = OrderDAO.getInstance();

			MemberDTO memDto = null;
			memDto = dao.selectMemberByUserCode(conn, UserCode);
			return memDto;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}
	
}
