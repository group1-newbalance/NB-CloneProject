package productlist.service;

import java.sql.Connection;
import java.util.List;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import productlist.dao.ProductListDAO;
import productlist.domain.ProductSizeStockDTO;

public class CategorySizeService {
	
		private CategorySizeService() {}
		private static CategorySizeService instance = null;
		public static CategorySizeService getIinstance() {
			if(instance == null) {
				instance = new CategorySizeService();
			}
			return instance;
		}
		
		public List<ProductSizeStockDTO> selectSize(String cIdx, String gender,String searchWord ){
			Connection con = null;
			
			try {
				con = ConnectionProvider.getConnection();
				ProductListDAO dao = ProductListDAO.getInstance();
				List<ProductSizeStockDTO> list = null;
				list = dao.selectSizeCategory(con, cIdx, gender,searchWord);
				return list;
			} catch (Exception e) {
				System.out.println(">categorySize.service() 에러:" + e.toString());
			}finally {
				JdbcUtil.close(con);
			}
			return null;
		}
}
