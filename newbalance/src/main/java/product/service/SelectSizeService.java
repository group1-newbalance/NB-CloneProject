package product.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import product.dao.ProductDAO;
import product.domain.ProductDTO;
import product.domain.ProductSizeDTO;

public class SelectSizeService {

	private SelectSizeService() {}
	private static SelectSizeService instance = new SelectSizeService();
	public static SelectSizeService getInstance() {
		return instance;
	}

	public ArrayList<ProductSizeDTO> selectSize(String pdCode, String userCode){

		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			conn.setAutoCommit(false);  // 트랜잭션 처리
			ArrayList<ProductSizeDTO> sizeList = null;
			sizeList = dao.selectSize(conn, pdCode, userCode);
			conn.commit();         
			return sizeList;
			
		} catch (NamingException | SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}

}
