package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import member.dao.MemberImpl;

public class LoginService {
	private static LoginService instance = null;
	
	private LoginService() {}
	
	public static LoginService getInstance() {
		if(instance == null) {
			instance = new LoginService();
		}
		return instance;
	}
	
	public User login(String id, String password) throws NamingException  {
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MemberImpl memberDao = MemberImpl.getInstance();
			User user = memberDao.selectById(conn, id);
			if ( user == null) {
				throw new LoginFailException();
			}
			if ( !user.matchPassword(password)) {
				throw new LoginFailException();
			}
			return new User(user.getId());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
