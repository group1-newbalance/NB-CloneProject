package productlist.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import productlist.dao.ProductListDAO;
import productlist.domain.ProductImgDTO;
import productlist.domain.ProductListDTO;
import productlist.domain.ProductSizeStockDTO;

public class ProductSizeStockService {

	
	private ProductSizeStockService() {}
	private static ProductSizeStockService instance = null;
	public static ProductSizeStockService getIinstance() {
		if(instance == null) {
			instance = new ProductSizeStockService();
		}
		return instance;
	}
	
	public LinkedHashMap<String, ArrayList<ProductSizeStockDTO>> seletProductSizeStock(String category_code, String gender ){
		Connection con = null;
		
		try {
			con = ConnectionProvider.getConnection();
			ProductListDAO dao = ProductListDAO.getInstance();
			LinkedHashMap<String, ArrayList<ProductSizeStockDTO>> list = null;
			list = dao.selectProductSizeStock(con, category_code, gender);
			return list;
		} catch (Exception e) {
			System.out.println(">productstock.service() 에러:" + e.toString());
		}finally {
			JdbcUtil.close(con);
		}
		return null;
	}
	
	
}
