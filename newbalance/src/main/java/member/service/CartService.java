package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import member.dao.MemberDAO;
import member.domain.CartOptionDTO;
import member.domain.CartProductDTO;


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
		
		public List<CartProductDTO> getCartList(String userCode) throws NamingException {
			
			List<CartProductDTO> cartList = null;
			try ( Connection conn = ConnectionProvider.getConnection()) {
				MemberDAO memberDao = MemberDAO.getInstance();
				cartList = memberDao.getCartList(conn, userCode);
				

			} catch (SQLException e) {
				e.printStackTrace();
			}
			return cartList;
		}
		
		public int updateCartQty(String userCode, int cartNum, int cartCount) throws NamingException {
			int rowCount = 0;
			try ( Connection conn = ConnectionProvider.getConnection()) {
				MemberDAO memberDao = MemberDAO.getInstance();
				rowCount = memberDao.updateCartQty(conn, cartNum, cartCount, userCode);

			} catch (SQLException e) {
				e.printStackTrace();
			}
			return rowCount;
		}
		
		
		public int deleteCartProduct(String userCode, String[] delCartList) throws NamingException{
			int rowCount = 0;
			try ( Connection conn = ConnectionProvider.getConnection()) {
				MemberDAO memberDao = MemberDAO.getInstance();
				rowCount = memberDao.deleteCartProduct(conn, userCode, delCartList);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return rowCount;
		}

		public int updateCartOption(String userCode, int cartNum, String pdCode, int sizeCode, String colorCode) throws NamingException {
			int rowCount = 0;
			try ( Connection conn = ConnectionProvider.getConnection()) {
				MemberDAO memberDao = MemberDAO.getInstance();
				
				if(memberDao.isDuplicateOption(conn, userCode, pdCode, sizeCode)) {
					rowCount = 2;
				}else {
					rowCount = memberDao.updateCartOption(conn, cartNum, pdCode, sizeCode, colorCode);					
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			return rowCount;
		}

		public List<CartOptionDTO> getCartOption(String pdCode) throws NamingException {
			List<CartOptionDTO> result = null;
			try ( Connection conn = ConnectionProvider.getConnection()) {
				MemberDAO memberDao = MemberDAO.getInstance();
				result = memberDao.getCartOption(conn, pdCode);

			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
		}
		
}
