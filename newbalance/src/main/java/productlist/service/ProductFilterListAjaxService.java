package productlist.service;

import java.sql.Connection;
import java.util.LinkedHashMap;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import productlist.dao.ProductFilterAjaxDAO;
import productlist.domain.ProductListDTO;

public class ProductFilterListAjaxService {
	// 싱글톤
	public ProductFilterListAjaxService() {};

	private static ProductFilterListAjaxService instance = null;

	public static ProductFilterListAjaxService getInstance() {
		if (instance == null) {
			instance = new ProductFilterListAjaxService();
		}
		return instance;
	}
	
	public 	LinkedHashMap< String, ProductListDTO > 
				productListAjaxService(String soldOutYn
													, String sizeCode
													, String feetWidth
													, String colorCode
													, String subCateIdx
													, String[][] priceRange
													, String sortProducts
													, String cateGrpCode
													, String cIdx		
													, String searchWord){
		Connection con = null;
		
		try {
			con = ConnectionProvider.getConnection();
			ProductFilterAjaxDAO dao = ProductFilterAjaxDAO.getInstance();
			LinkedHashMap<String, ProductListDTO> list = null;
			list = dao.productInfoAjax(con, soldOutYn ,sizeCode, feetWidth,colorCode,subCateIdx,priceRange,sortProducts,cateGrpCode,cIdx,searchWord);
			return list;
		} catch (Exception e) {
			System.out.println(">productListAjaxService.service() 에러:" + e.toString());
		}finally {
			JdbcUtil.close(con);
		}
		return null;
	}


}
