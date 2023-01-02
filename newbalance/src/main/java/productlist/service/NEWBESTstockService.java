package productlist.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import productlist.dao.ProductNEWBESTDAO;
import productlist.domain.ProductSizeStockDTO;

public class NEWBESTstockService {
	private NEWBESTstockService() {}
	private static NEWBESTstockService instance = null;
	public static NEWBESTstockService getIinstance() {
		if(instance == null) {
			instance = new NEWBESTstockService();
		}
		return instance;
	}
	
	public LinkedHashMap<String, ArrayList<ProductSizeStockDTO>> seletProductSizeStock(String cateGrpCode, String cIdx ){
		Connection con = null;
		
		try {
			con = ConnectionProvider.getConnection();
			ProductNEWBESTDAO dao = ProductNEWBESTDAO.getInstance();
			LinkedHashMap<String, ArrayList<ProductSizeStockDTO>> list = null;
			list = dao.pNewBestStock(con, cateGrpCode, cIdx);
			return list;
		} catch (Exception e) {
			System.out.println(">productstock.service() 에러:" + e.toString());
		}finally {
			JdbcUtil.close(con);
		}
		return null;
	}
}
