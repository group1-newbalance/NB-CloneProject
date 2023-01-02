package product.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import product.domain.AddCartDTO;
import product.domain.ProductAjaxDTO;
import product.domain.ProductColorDTO;
import product.domain.ProductDTO;
import product.domain.ProductImageDTO;
import product.domain.ProductSizeDTO;
import product.domain.RestockAlarmDTO;
import product.domain.ReviewDTO;
import product.domain.ReviewImgDTO;
import product.domain.WishlistDTO;

public interface IProduct {

	// 상품 정보
	ProductDTO selectProduct(Connection conn, String pdCode) throws SQLException; 
	
	// 상품별 이미지 리스트
	ArrayList<ProductImageDTO> selectImage(Connection conn, String pdCode) throws SQLException;
	
	// 상품별 사이즈 리스트
	ArrayList<ProductSizeDTO> selectSize(Connection conn, String pdCode) throws SQLException;

	// 연관 상품 리스트
	ArrayList<ProductDTO> selectRelatedProduct(Connection conn, String pdCode) throws SQLException;
	
	// 상품명이 같고 컬러만 다른 상품 리스트
	ArrayList<ProductColorDTO> diffColorProduct(Connection conn, String pdCode) throws SQLException;

	// 현재 상품의 컬러 정보
	ProductColorDTO getPdColor(Connection conn, String pdCode) throws SQLException;

	// 관심상품 추가
	int addWishlist(Connection conn, WishlistDTO dto) throws SQLException;
	
	// 재입고알림 상품 추가
	int applyAlarm(Connection conn, RestockAlarmDTO dto) throws SQLException;

	// 장바구니 추가
	int addCartList(Connection conn, AddCartDTO cartDto) throws SQLException;
	
	// 상품별 리뷰 리스트
	LinkedHashMap<ReviewDTO, ArrayList<ReviewImgDTO>> selectReview(Connection conn, String pdCode) throws SQLException;

	// 리뷰 집계(count, 별점 평균)
	ReviewDTO totalReview(Connection conn, String pdCode) throws SQLException;

	ProductAjaxDTO selectProductAjax(Connection conn, String pdCode) throws SQLException;
}
