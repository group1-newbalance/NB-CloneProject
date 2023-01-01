package productlist.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import productlist.dao.ProductFilterAjaxDAO;
import productlist.domain.ProductSizeStockDTO;

public class ProductFilterSizeStockAjaxService {
	public ProductFilterSizeStockAjaxService() {};

	private static ProductFilterSizeStockAjaxService instance = null;

	public static ProductFilterSizeStockAjaxService getInstance() {
		if (instance == null) {
			instance = new ProductFilterSizeStockAjaxService();
		}
		return instance;
	}
	
	public 	LinkedHashMap< String, ArrayList<ProductSizeStockDTO> > 
		productFilterSizeStockAjaxService(String soldOutYn
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
			LinkedHashMap<String, ArrayList<ProductSizeStockDTO>> list = null;
			list = dao.productSizeStockAjax(con, soldOutYn ,sizeCode, feetWidth,colorCode,subCateIdx,priceRange,sortProducts,cateGrpCode,cIdx);
			return list;
		} catch (Exception e) {
			System.out.println(">productFilterSizeStockAjaxService.service() 에러:" + e.toString());
		}finally {
			JdbcUtil.close(con);
		}
		return null;
	}
}
