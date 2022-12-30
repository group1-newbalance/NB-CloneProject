package productlist.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import productlist.domain.CategoryDTO;
import productlist.domain.ProductColorDTO;
import productlist.domain.ProductImgDTO;
import productlist.domain.ProductListDTO;
import productlist.domain.ProductReviewDTO;
import productlist.domain.ProductSizeStockDTO;

public interface IProductList {
	
	//1. 상품테이블 조회
	List<ProductListDTO> selectProductList(Connection conn, String category_code, String gender, String searchWord) throws SQLException;
	
	//2. 상품이미지 조회
	LinkedHashMap< ProductListDTO, ArrayList<ProductImgDTO> > seletProductImg(Connection conn, String category_code, String gender, String searchWord ) throws SQLException;
	
	//3. 상품 사이즈에 대한 재고
	LinkedHashMap<String, ArrayList<ProductSizeStockDTO>> selectProductSizeStock(Connection conn, String category_code, String gender) throws SQLException;
	
	//4. 카테고리 코드
	List<CategoryDTO> category(Connection conn, String category_code, String gender) throws SQLException;
	
	//5. 평점
	LinkedHashMap< String, ProductReviewDTO > selectProductReview(Connection conn, String category_code,String gender) throws SQLException;
	
	//6. 카테고리에서 사이즈
	List<ProductSizeStockDTO> selectSizeCategory(Connection conn, String category_code, String gender) throws SQLException;
	
	//7. 카테고리에서 발볼
	List<ProductListDTO>selectFeet(Connection conn, String category_code, String gender) throws SQLException;
	
	//8. 카테고리 컬러
	List<ProductColorDTO>selectColor(Connection conn, String category_code, String gender) throws SQLException;
	
}
