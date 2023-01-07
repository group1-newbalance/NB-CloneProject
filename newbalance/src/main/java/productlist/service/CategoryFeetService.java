package productlist.service;

import java.sql.Connection;
import java.util.List;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import productlist.dao.ProductListDAO;
import productlist.domain.ProductListDTO;
import productlist.domain.ProductSizeStockDTO;

public class CategoryFeetService {
	
	
	private CategoryFeetService() {}
	private static CategoryFeetService instance = null;
	public static CategoryFeetService getIinstance() {
		if(instance == null) {
			instance = new CategoryFeetService();
		}
		return instance;
	}
	
	public List<ProductListDTO> selectFeet(String cIdx, String gender,String searchWord ){
		Connection con = null;
		
		try {
			con = ConnectionProvider.getConnection();
			ProductListDAO dao = ProductListDAO.getInstance();
			List<ProductListDTO> list = null;
			list = dao.selectFeet(con, cIdx, gender,searchWord);
			return list;
		} catch (Exception e) {
			System.out.println(">categoryFeet.service() 에러:" + e.toString());
		}finally {
			JdbcUtil.close(con);
		}
		return null;
	}
	
	
}
