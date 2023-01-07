package productlist.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import productlist.domain.ProductImgDTO;
import productlist.domain.ProductListDTO;
import productlist.domain.ProductReviewDTO;
import productlist.domain.ProductSizeStockDTO;

public interface IProductFilterAjax {

	//0. 상품 정보
	LinkedHashMap< String, ProductListDTO> 
										productInfoAjax(Connection conn  , String soldOutYn
																							, String sizeCode
																							, String feetWidth
																							, String colorCode
																							, String subCateIdx
																							, String[][] priceRange
																							, String sortProducts
																							, String cateGrpCode
																							, String cIdx				
																							, String searchWord	) throws SQLException;
	
	
	//1. 상품 이미지 필터
	LinkedHashMap< String, ArrayList<ProductImgDTO>> 
										productImgAjax(Connection conn  , String soldOutYn
																							, String sizeCode
																							, String feetWidth
																							, String colorCode
																							, String subCateIdx
																							, String[][] priceRange
																							, String sortProducts
																							, String cateGrpCode
																							, String cIdx				
																							, String searchWord	) throws SQLException;
	
	//2. 상품 사이즈 재고들
	LinkedHashMap< String, ArrayList<ProductSizeStockDTO>> 
										productSizeStockAjax(Connection conn  , String soldOutYn
																							, String sizeCode
																							, String feetWidth
																							, String colorCode
																							, String subCateIdx
																							, String[][] priceRange
																							, String sortProducts
																							, String cateGrpCode
																							, String cIdx				
																							, String searchWord	) throws SQLException;
	
	//3. 상품 평점
		LinkedHashMap< String, ArrayList<ProductReviewDTO>> 
											productReviewAjax(Connection conn  , String soldOutYn
																								, String sizeCode
																								, String feetWidth
																								, String colorCode
																								, String subCateIdx
																								, String[][] priceRange
																								, String sortProducts
																								, String cateGrpCode
																								, String cIdx				
																								, String searchWord	) throws SQLException;
											

}
