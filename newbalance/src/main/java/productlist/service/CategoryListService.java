package productlist.service;

import java.sql.Connection;
import java.util.List;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import productlist.dao.ProductListDAO;
import productlist.domain.CategoryDTO;

public class CategoryListService {
	private CategoryListService() {}
	private static CategoryListService instance = null;
	public static CategoryListService getIinstance() {
		if(instance == null) {
			instance = new CategoryListService();
		}
		return instance;
	}
	
	public List<CategoryDTO> select(String cIdx, String gender,String searchWord ){
		Connection con = null;
		
		try {
			con = ConnectionProvider.getConnection();
			ProductListDAO dao = ProductListDAO.getInstance();
			List<CategoryDTO> list = null;
			list = dao.category(con, cIdx, gender,searchWord);
			return list;
		} catch (Exception e) {
			System.out.println(">categorylist.service() 에러:" + e.toString());
		}finally {
			JdbcUtil.close(con);
		}
		return null;
	}
}
