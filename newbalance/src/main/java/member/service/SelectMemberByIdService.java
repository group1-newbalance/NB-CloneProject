package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import member.dao.MemberDAO;
import member.domain.MemberDTO;

public class SelectMemberByIdService {
	
	private static SelectMemberByIdService instance = null;
	private SelectMemberByIdService() {}
	public static SelectMemberByIdService getInstance() {
		if(instance == null) {
			instance = new SelectMemberByIdService();
		}
		return instance;
	}

	public MemberDTO selectMemberById(String id){

		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			MemberDAO dao = MemberDAO.getInstance();

			MemberDTO memDto = null;
			memDto = dao.selectMemberById(conn, id);
			return memDto;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}
	
}
