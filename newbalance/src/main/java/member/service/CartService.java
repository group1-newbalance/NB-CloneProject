package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import member.dao.MemberDAO;

public class CartService {
	private static CartService instance = null;
		
		private CartService() {}
		
		public static CartService getInstance() {
			if(instance == null) {
				instance = new CartService();
			}
			return instance;
		}
		
		
		public int getCartCount(String userCode) throws NamingException {
			
			int cartCount;
			try ( Connection conn = ConnectionProvider.getConnection()) {
				MemberDAO memberDao = MemberDAO.getInstance();
				cartCount = memberDao.getCartCount(conn, userCode);
			
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
			return cartCount;
			
		}
		
}
