package product.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import product.dao.ProductDAO;
import product.domain.WishlistDTO;

public class WishlistService {

	private WishlistService() {}
	private static WishlistService instance = new WishlistService();
	public static WishlistService getInstance() {
		return instance;
	}

	public int addWishlist(WishlistDTO dto){
		// System.out.println("서비스 호출됨");
		Connection conn = null;
		int rowCount = 0;
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			conn.setAutoCommit(false); 
			rowCount = dao.addWishlist(conn, dto);

			conn.commit();
		} catch (NamingException | SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		return rowCount;
	}
}
