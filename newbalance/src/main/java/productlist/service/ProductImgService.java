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

public class ProductImgService {

	private ProductImgService() {}
	private static ProductImgService instance = null;
	public static ProductImgService getIinstance() {
		if(instance == null) {
			instance = new ProductImgService();
		}
		return instance;
	}
	
	public LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>> seletProductImg(String category_code, String gender, String searchWord ){
		Connection con = null;
		
		try {
			con = ConnectionProvider.getConnection();
			ProductListDAO dao = ProductListDAO.getInstance();
			LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>> list = null;
		
			list = (LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>>) dao.seletProductImg(con, category_code, gender, searchWord);
			return list;
		} catch (Exception e) {
			System.out.println(">productimg.service() 에러:" + e.toString());
		}finally {
			JdbcUtil.close(con);
		}
		return null;
	}
	
	
}
