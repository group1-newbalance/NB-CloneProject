package productlist.service;

import java.sql.Connection;
import java.util.LinkedHashMap;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import productlist.dao.ProductNEWBESTDAO;
import productlist.domain.ProductReviewDTO;

public class NEWBESTpReviewService {
	private NEWBESTpReviewService() {}
	private static NEWBESTpReviewService instance = null;
	public static NEWBESTpReviewService getIinstance() {
		if(instance == null) {
			instance = new NEWBESTpReviewService();
		}
		return instance;
	}
	
	public LinkedHashMap<String, ProductReviewDTO> selectProductReview(String category_code, String gender ){
		Connection con = null;
		
		try {
			con = ConnectionProvider.getConnection();
			ProductNEWBESTDAO dao = ProductNEWBESTDAO.getInstance();
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
