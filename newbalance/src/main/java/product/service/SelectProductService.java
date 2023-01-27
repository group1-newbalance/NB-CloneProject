package product.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import product.dao.ProductDAO;
import product.domain.BuyProductDTO;
import product.domain.ProductAjaxDTO;
import product.domain.ProductColorDTO;
import product.domain.ProductDTO;
import product.domain.ProductImageDTO;
import product.domain.ProductQnaDTO;
import product.domain.ProductSizeDTO;
import product.domain.RestockAlarmDTO;
import product.domain.ReviewDTO;
import product.domain.ReviewImgDTO;
import product.domain.WishlistDTO;

public class SelectProductService {

	private SelectProductService() {}
	private static SelectProductService instance = new SelectProductService();
	public static SelectProductService getInstance() {
		return instance;
	}
	
	public ProductDTO selectProduct(String pdCode){

		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			ProductDTO pdDto = null;
			pdDto = dao.selectProduct(conn, pdCode);
			return pdDto;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}

	public ProductAjaxDTO selectProductAjax(String pdCode){

		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			ProductAjaxDTO pdDto = null;
			pdDto = dao.selectProductAjax(conn, pdCode);
			return pdDto;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}
	
	public ProductColorDTO getPdColor(String pdCode) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			ProductColorDTO colorDto = null;
			colorDto = dao.getPdColor(conn, pdCode);     
			return colorDto;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}
	
	
	public ArrayList<ProductColorDTO> diffColorProduct(String pdCode){
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			ArrayList<ProductColorDTO> diffColorList = null;
			diffColorList = dao.diffColorProduct(conn, pdCode);
			return diffColorList;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}
	
	
	public ArrayList<ProductImageDTO> selectImage(String pdCode){
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			ArrayList<ProductImageDTO> imgList = null;
			imgList = dao.selectImage(conn, pdCode);     
			return imgList;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}
	
	
	public ArrayList<ProductDTO> selectRelatedProduct(String pdCode){
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			ArrayList<ProductDTO> relatedPdList = null;
			relatedPdList = dao.selectRelatedProduct(conn, pdCode);     
			return relatedPdList;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}
	
	
	public ArrayList<ProductSizeDTO> selectSize(String pdCode){
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			ArrayList<ProductSizeDTO> sizeList = null;
			sizeList = dao.selectSize(conn, pdCode); 
			return sizeList;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}
	

	public int addWishlist(WishlistDTO dto){
		Connection conn = null;
		int rowCount = 0;
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			rowCount = dao.addWishlist(conn, dto);

		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		return rowCount;
	}
	
	
	public boolean applyAlarm(RestockAlarmDTO dto) {
		Connection conn = null;
		int rowCount = 0;
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			rowCount = dao.applyAlarm(conn, dto);

		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
		if(rowCount >= 1) {
			return true;
		}else {
			return false;
		}
		
	}
	
	
	public LinkedHashMap<ReviewDTO, ArrayList<ReviewImgDTO>>  selectReview(String pdCode){
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			LinkedHashMap<ReviewDTO, ArrayList<ReviewImgDTO>> revMap = null;
			revMap = dao.selectReview(conn, pdCode);        
			return revMap;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}
	
	
	public ReviewDTO totalReview(String pdCode) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			ReviewDTO rDto = null;
			rDto = dao.totalReview(conn, pdCode);     
			return rDto;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}
	
	
	public int addCartList(BuyProductDTO dto, String userCode){
		System.out.println("카트 서비스 호출됨");
		Connection conn = null;
		int rowCount = 0;
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			rowCount = dao.addCartList(conn, dto, userCode);

		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		return rowCount;
	}
	
	
	public ArrayList<ProductQnaDTO> selectProductQna(String pdCode){
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			ProductDAO dao = ProductDAO.getInstance();

			ArrayList<ProductQnaDTO> qnaList = null;
			qnaList = dao.selectProductQna(conn, pdCode);
			return qnaList;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn); 
		}
		
	}
	
}
