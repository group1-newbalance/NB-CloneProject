package productlist.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;
import java.util.Map.Entry;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import productlist.dao.ProductListDAO;
import productlist.dao.ProductNEWBESTDAO;
import productlist.domain.ProductImgDTO;
import productlist.domain.ProductListDTO;

public class NEWBESTpListImgService {
	
	private NEWBESTpListImgService() {}
	private static NEWBESTpListImgService instance = null;
	public static NEWBESTpListImgService getIinstance() {
		if(instance == null) {
			instance = new NEWBESTpListImgService();
		}
		return instance;
	}
	
	public LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>> seletNewBestProductImg(String cateGrpCode, String cIdx ){
		Connection con = null;
		
		try {
			con = ConnectionProvider.getConnection();
			ProductNEWBESTDAO dao = ProductNEWBESTDAO.getInstance();
			LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>> list = null;
	
			list = dao.PNewBestImg(con, cateGrpCode, cIdx);
			
			/*
			 * Set<Entry<ProductListDTO, ArrayList<ProductImgDTO>>> set = list.entrySet();
			 * Iterator<Entry<ProductListDTO, ArrayList<ProductImgDTO>>> it =
			 * set.iterator(); while (it.hasNext()) { Entry<ProductListDTO,
			 * ArrayList<ProductImgDTO>> entry = it.next(); ArrayList<ProductImgDTO> value =
			 * entry.getValue(); Iterator<ProductImgDTO> ir = value.iterator(); while
			 * (ir.hasNext()) { ProductImgDTO productImgDTO = (ProductImgDTO) ir.next();
			 * System.out.println(productImgDTO.toString()); } }
			 */
			
			return list;
		} catch (Exception e) {
			System.out.println(">pNewBestImg.service() 에러:" + e.toString());
		}finally {
			JdbcUtil.close(con);
		}
		return null;
	}
	
	
}
