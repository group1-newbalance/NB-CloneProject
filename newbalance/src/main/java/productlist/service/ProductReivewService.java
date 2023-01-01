package productlist.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import productlist.dao.ProductListDAO;
import productlist.domain.ProductReviewDTO;
import productlist.domain.ProductSizeStockDTO;

public class ProductReivewService {
	private ProductReivewService() {}
	private static ProductReivewService instance = null;
	public static ProductReivewService getIinstance() {
		if(instance == null) {
			instance = new ProductReivewService();
		}
		return instance;
	}
	
	public LinkedHashMap<String, ProductReviewDTO> selectProductReview(String category_code, String gender ){
		Connection con = null;
		
		try {
			con = ConnectionProvider.getConnection();
			ProductListDAO dao = ProductListDAO.getInstance();
			LinkedHashMap<String, ProductReviewDTO> list = null;
			list = dao.selectProductReview(con, category_code, gender);
			return list;
		} catch (Exception e) {
			System.out.println(">productreview.service() 에러:" + e.toString());
		}finally {
			JdbcUtil.close(con);
		}
		return null;
	}
}
