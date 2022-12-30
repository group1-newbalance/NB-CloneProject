package product.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import product.dao.ProductDAO;
import product.domain.ProductColorDTO;
import product.domain.ProductDTO;
import product.domain.ProductImageDTO;
import product.domain.ProductSizeDTO;
import product.domain.WishlistDTO;

public class SelectProductService {

	private SelectProductService() {}
	private static SelectProductService instance = new SelectProductService();
	public static SelectProductService getInstance() {
		return instance;
	}

	public ProductDTO selectProduct(String pdCode, String userCode){

		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			ProductDTO pdDto = null;
			pdDto = dao.selectProduct(conn, pdCode, userCode);
			return pdDto;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}

	public ProductColorDTO getPdColor(String pdCode, String userCode) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			ProductColorDTO colorDto = null;
			colorDto = dao.getPdColor(conn, pdCode, userCode);     
			return colorDto;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}
	
	
	public ArrayList<ProductColorDTO> diffColorProduct(String pdCode, String userCode){
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			conn.setAutoCommit(false); 
			ArrayList<ProductColorDTO> diffColorList = null;
			diffColorList = dao.diffColorProduct(conn, pdCode, userCode);
			conn.commit();         
			return diffColorList;
			
		} catch (NamingException | SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}
	
	
	public ArrayList<ProductImageDTO> selectImage(String pdCode, String userCode){
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			conn.setAutoCommit(false); 
			ArrayList<ProductImageDTO> imgList = null;
			imgList = dao.selectImage(conn, pdCode, userCode);
			conn.commit();         
			return imgList;
			
		} catch (NamingException | SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}
	
	
	public ArrayList<ProductDTO> selectRelatedProduct(String pdCode, String userCode){
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			conn.setAutoCommit(false);  
			ArrayList<ProductDTO> relatedPdList = null;
			relatedPdList = dao.selectRelatedProduct(conn, pdCode, userCode);
			conn.commit();         
			return relatedPdList;
			
		} catch (NamingException | SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
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
