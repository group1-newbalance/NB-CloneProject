package productlist.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import productlist.dao.ProductListDAO;
import productlist.domain.ProductListDTO;

public class ProductListService {
	
	private ProductListService() {}
	private static ProductListService instance = null;
	public static ProductListService getIinstance() {
		if(instance == null) {
			instance = new ProductListService();
		}
		return instance;
	}
	
	public List<ProductListDTO> select(String cIdx, String gender ,String searchWord){//,sorttype
		Connection con = null;
		
		try {
			con = ConnectionProvider.getConnection();
			ProductListDAO dao = ProductListDAO.getInstance();
			List<ProductListDTO> list = null;
			list = dao.selectProductList(con, cIdx, gender,searchWord);
			return list;
		} catch (Exception e) {
			System.out.println(">productlist.service() 에러:" + e.toString());
		}finally {
			JdbcUtil.close(con);
		}
		return null;
	}
	
	
	

}
