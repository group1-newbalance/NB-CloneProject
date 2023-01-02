package productlist.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import productlist.domain.ProductImgDTO;
import productlist.domain.ProductListDTO;
import productlist.domain.ProductReviewDTO;
import productlist.domain.ProductSizeStockDTO;

public interface IProductNEWBEST {
	
	//1. 이미지
	LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>>  PNewBestImg(Connection conn, String cateGrpCode, String cIdx) throws SQLException;
	
	//2. 사이즈별 재고수
	LinkedHashMap<String, ArrayList<ProductSizeStockDTO>> pNewBestStock(Connection conn, String cateGrpCode, String cIdx) throws SQLException;
	
	//3. 평점
		LinkedHashMap< String, ProductReviewDTO > selectProductReview(Connection conn, String cateGrpCode,String gender) throws SQLException;
}
