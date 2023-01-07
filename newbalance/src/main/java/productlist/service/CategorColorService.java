package productlist.service;

import java.sql.Connection;
import java.util.List;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import productlist.dao.ProductListDAO;
import productlist.domain.ProductColorDTO;
import productlist.domain.ProductImgDTO;
import productlist.domain.ProductListDTO;

public class CategorColorService {
	
	
	private CategorColorService() {}
	private static CategorColorService instance = null;
	public static CategorColorService getIinstance() {
		if(instance == null) {
			instance = new CategorColorService();
		}
		return instance;
	}
	
	public List<ProductColorDTO> selectColor(String cIdx, String gender,String searchWord ){
		Connection con = null;
		
		try {
			con = ConnectionProvider.getConnection();
			ProductListDAO dao = ProductListDAO.getInstance();
			List<ProductColorDTO> list = null;
			list = dao.selectColor(con, cIdx, gender,searchWord);
			return list;
		} catch (Exception e) {
			System.out.println(">categorycolor.service() 에러:" + e.toString());
		}finally {
			JdbcUtil.close(con);
		}
		return null;
	}
}
