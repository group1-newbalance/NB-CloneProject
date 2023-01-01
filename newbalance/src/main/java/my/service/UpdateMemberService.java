package my.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import member.dao.MemberDAO;
import member.domain.MemberDTO;
import my.dao.MyDAO;
import my.domain.MyDeliveryInfoDTO;
import my.domain.MyMainDTO;



public class UpdateMemberService {

	private static UpdateMemberService instance = new UpdateMemberService();
	public static UpdateMemberService getInstance() {
		return instance;
	}
	public MemberDTO getMemberInfo(String userCode) throws NamingException {
		MemberDTO myInfo = null;
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MemberDAO memDao =MemberDAO.getInstance();
			myInfo = memDao.getMemberInfo(conn, userCode);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return myInfo;
		
	}
}
	
