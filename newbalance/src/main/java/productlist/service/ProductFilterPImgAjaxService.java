package productlist.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import productlist.dao.ProductFilterAjaxDAO;
import productlist.dao.ProductNEWBESTDAO;
import productlist.domain.ProductImgDTO;
import productlist.domain.ProductListDTO;
import productlist.domain.ProductSizeStockDTO;

public class ProductFilterPImgAjaxService {
	// 싱글톤
	public ProductFilterPImgAjaxService() {};

	private static ProductFilterPImgAjaxService instance = null;

	public static ProductFilterPImgAjaxService getInstance() {
		if (instance == null) {
			instance = new ProductFilterPImgAjaxService();
		}
		return instance;
	}
	
	public 	LinkedHashMap< String, ArrayList<ProductImgDTO> > 
				productImgAjaxService(String soldOutYn
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
			LinkedHashMap<String, ArrayList<ProductImgDTO>> list = null;
			list = dao.productImgAjax(con, soldOutYn ,sizeCode, feetWidth,colorCode,subCateIdx,priceRange,sortProducts,cateGrpCode,cIdx);
			return list;
		} catch (Exception e) {
			System.out.println(">productImgAjaxService.service() 에러:" + e.toString());
		}finally {
			JdbcUtil.close(con);
		}
		return null;
	}
	
}
