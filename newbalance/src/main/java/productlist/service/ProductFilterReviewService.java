package productlist.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import productlist.dao.ProductFilterAjaxDAO;
import productlist.domain.ProductReviewDTO;

public class ProductFilterReviewService {
	// 싱글톤
	public ProductFilterReviewService() {};

	private static ProductFilterReviewService instance = null;

	public static ProductFilterReviewService getInstance() {
		if (instance == null) {
			instance = new ProductFilterReviewService();
		}
		return instance;
	}
	
	public 	LinkedHashMap< String, ArrayList<ProductReviewDTO> > 
						productReviewAjaxService(String soldOutYn
													, String sizeCode
													, String feetWidth
													, String colorCode
													, String subCateIdx
													, String[][] priceRange
													, String sortProducts
													, String cateGrpCode
													, String cIdx		){
		Connection con = null;
		
		try {
			con = ConnectionProvider.getConnection();
			ProductFilterAjaxDAO dao = ProductFilterAjaxDAO.getInstance();
			LinkedHashMap<String, ArrayList<ProductReviewDTO>> list = null;
			list = dao.productReviewAjax(con, soldOutYn ,sizeCode, feetWidth,colorCode,subCateIdx,priceRange,sortProducts,cateGrpCode,cIdx);
			return list;
		} catch (Exception e) {
			System.out.println(">productSizeStockAjaxService.service() 에러:" + e.toString());
		}finally {
			JdbcUtil.close(con);
		}
		return null;
	}
}
