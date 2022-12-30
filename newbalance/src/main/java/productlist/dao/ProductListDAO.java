package productlist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import productlist.domain.CategoryDTO;
import productlist.domain.ProductColorDTO;
import productlist.domain.ProductImgDTO;
import productlist.domain.ProductListDTO;
import productlist.domain.ProductReviewDTO;
import productlist.domain.ProductSizeStockDTO;

import java.util.Set;

public class ProductListDAO implements IProductList {

	// 싱글톤
	public ProductListDAO() {
	};

	private static ProductListDAO productListDAO = null;

	public static ProductListDAO getInstance() {
		if (productListDAO == null) {
			productListDAO = new ProductListDAO();
		}
		return productListDAO;
	}

	//ALL 함수
	
	
	// 상품테이블
	@Override
	public List<ProductListDTO> selectProductList(Connection conn, String category_code, String gender, String searchWord)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		
		String productSQL = " SELECT product.pd_code pdcode, substr(product.pd_code,9,2) color , category_code , pd_name , pd_price , pd_memberonly , pd_mincount ,pd_feet"
				+ " FROM product join product_detail on product.pd_code = product_detail.pd_code ";

				if(searchWord == "") {
					if(category_code.equals("F")) {
						productSQL += " WHERE substr(product.pd_code,2,1) = ? AND ( substr(product.pd_code,1,1) = 'U' OR substr(product.pd_code,1,1) = ?) ";
					}else {
	
						productSQL += " WHERE substr(product.pd_code,2,3) = ? AND ( substr(product.pd_code,1,1) = 'U' OR substr(product.pd_code,1,1) = ?) ";
					}
				}else {
					productSQL += "  WHERE REGEXP_LIKE( product.pd_code , ? , 'i' ) or  REGEXP_LIKE( product.pd_name , ? , 'i' )";
				}
		try {
			pstmt = conn.prepareStatement(productSQL);
			
			if(searchWord != "") {
				pstmt.setString(1, searchWord);
				pstmt.setString(2, searchWord);
			}else {
				pstmt.setString(1, category_code);
				pstmt.setString(2, gender);
			}
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				ArrayList<ProductListDTO> productlist = new ArrayList<ProductListDTO>();
				do {
					String pdcode = rs.getString("pdcode");
					String color = rs.getString("color");
					String categoryCode = rs.getString("category_code");
					String pdname = rs.getString("pd_name");
					int price = rs.getInt("pd_price");
					int memberonly = rs.getInt("pd_memberonly");
					int mincount = rs.getInt("pd_mincount");
					String pd_feet = rs.getString("pd_feet");

					ProductListDTO plist = new ProductListDTO(pdcode, color, categoryCode, pdname, price, memberonly, mincount, pd_feet,0);
					productlist.add(plist);

				} while (rs.next());

				return productlist;

			} // if

		} catch (Exception e) {
			System.out.println(">ProductListDAO.selectProductList() - " + e.toString());
		} finally {
			pstmt.close();
			rs.close();
		} // try

		return null;

	}

	// 상품이미지
	@Override
	public LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>> seletProductImg(Connection conn, String category_code, String gender
											, String searchWord) throws SQLException {

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;

		LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>> imgMap = null;
		ProductListDTO pdto = null;
		ArrayList<ProductImgDTO> imglist = null;
		
		
		// 상품 dto : key
		String productSQL = " SELECT product.pd_code pdcode, substr(product.pd_code,9,2) color , category_code , pd_name , pd_price , pd_memberonly , pd_mincount ,pd_feet"
				+ " FROM product join product_detail on product.pd_code = product_detail.pd_code " ;
		
				if(searchWord == "") {
					if(gender.equals("K")) {//아동
							if(category_code.length() == 1 ) {
								productSQL += " WHERE substr(product.pd_code,2,1) = ? AND ( substr(product.pd_code,1,1) = ? ) ";
							}else {
								productSQL += " WHERE substr(product.pd_code,2,3) = ? AND ( substr(product.pd_code,1,1) = ? ) ";
							}

					}else {//성인
							if(category_code.length() == 1 ) {//전체보기
								productSQL += " WHERE substr(product.pd_code,2,1) = ? AND ( substr(product.pd_code,1,1) = 'U' OR substr(product.pd_code,1,1) = ?) ";
							}else {//그 외
								productSQL += " WHERE substr(product.pd_code,2,3) = ? AND ( substr(product.pd_code,1,1) = 'U' OR substr(product.pd_code,1,1) = ?) ";
							}
					}
				}else {
					productSQL += "  WHERE REGEXP_LIKE( product.pd_code , ? , 'i' ) or  REGEXP_LIKE( product.pd_name , ? , 'i' )";
				}
		try {
			pstmt = conn.prepareStatement(productSQL);
			
			if(searchWord != "") {
				pstmt.setString(1, searchWord);
				pstmt.setString(2, searchWord);
			}else {
				pstmt.setString(1, category_code);
				pstmt.setString(2, gender);
			}
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				imgMap = new LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>>();
				do {
					String pdcode = rs.getString("pdcode");
					String color = rs.getString("color");
					String categoryCode = rs.getString("category_code");
					String pdname = rs.getString("pd_name");
					int price = rs.getInt("pd_price");
					int memberonly = rs.getInt("pd_memberonly");
					int mincount = rs.getInt("pd_mincount");
					String pd_feet = rs.getString("pd_feet");

					pdto = new ProductListDTO(pdcode, color, categoryCode, pdname, price, memberonly, mincount, pd_feet,0);

					// 상품코드에 맞는 이미지 가져오기
					String imgSQL = 
								" SELECT t.row_num imgRowNumber, t.pd_code pdcode, t.img_url imgURL " 
							+ " FROM( "
							+ "    SELECT ROW_NUMBER() OVER(PARTITION BY pd_code ORDER BY pd_code) row_num, pd_code, img_url "
							+ "    FROM product_image " 
							+ "    WHERE pd_code = ? " 
							+ " )t " 
							+ " WHERE t.row_num <= 5 "
							+ " ORDER BY imgRowNumber ASC ";

					pstmt2 = conn.prepareStatement(imgSQL);
					pstmt2.setString(1, pdcode);
					rs2 = pstmt2.executeQuery();
					
					if (rs2.next()) {
						imglist = new ArrayList<ProductImgDTO>();
						do {
							int imgpdRowNum = rs2.getInt("imgRowNumber");
							String imgpdCode = rs2.getString("pdcode");
							String imgURL = rs2.getString("imgURL");

							ProductImgDTO imgdto = new ProductImgDTO(imgpdRowNum, imgpdCode, imgURL);
							imglist.add(imgdto);

						} while (rs2.next());

						imgMap.put(pdto, imglist);
					} // if imglist

					pstmt2.close();
					rs2.close();
				} while (rs.next());

				return imgMap;

			} // if pdto

		} catch (Exception e) {
			System.out.println(">ProductListDAO.selectimg() - " + e.toString());
		} finally {
			pstmt.close();
			rs.close();
		} // try

		return null;

	}// seletProductImg

	
	
	
	//상품 사이즈에 대한 재고
	@Override
	public LinkedHashMap<String, ArrayList<ProductSizeStockDTO>> selectProductSizeStock(Connection conn,
			String category_code, String gender) throws SQLException {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;

		// 상품 dto : key
		String productSQL = " SELECT product.pd_code pdcode, substr(product.pd_code,9,2) color , category_code , pd_name , pd_price , pd_memberonly , pd_mincount ,pd_feet"
				+ " FROM product join product_detail on product.pd_code = product_detail.pd_code ";
		
				if(gender.equals("K")) {//아동
						if(category_code.length() == 1 ) {
							productSQL += " WHERE substr(product.pd_code,2,1) = ? AND ( substr(product.pd_code,1,1) = ? ) ";
						}else {
							productSQL += " WHERE substr(product.pd_code,2,3) = ? AND ( substr(product.pd_code,1,1) = ? ) ";
						}

				}else {	//성인
						if(category_code.length() == 1 ) {
							productSQL += " WHERE substr(product.pd_code,2,1) = ? AND ( substr(product.pd_code,1,1) = 'U' OR substr(product.pd_code,1,1) = ?) ";
						}else {
							productSQL += " WHERE substr(product.pd_code,2,3) = ? AND ( substr(product.pd_code,1,1) = 'U' OR substr(product.pd_code,1,1) = ?) ";
						}
				}
		LinkedHashMap<String, ArrayList<ProductSizeStockDTO>> sizeStockMap = null;
		ArrayList<ProductSizeStockDTO> sizestockList = null;
		ProductSizeStockDTO psizestock = null;
		
		try {
			pstmt = conn.prepareStatement(productSQL);
			pstmt.setString(1, category_code);
			pstmt.setString(2, gender);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				sizeStockMap = new LinkedHashMap<String, ArrayList<ProductSizeStockDTO>>();
				do {
					String pdcode = rs.getString("pdcode");
					
					String sizestockSQL = 
								" SELECT product_stock.pd_code pdCode, size_list.size_code sizecode, stock_count , sz"
							+ " FROM product join product_stock on product.pd_code = product_stock.pd_code "
							+ "                    join size_list on product_stock.size_code = size_list.size_code "
							+ " WHERE product_stock.pd_code = ? ";

					pstmt2 = conn.prepareStatement(sizestockSQL);
					pstmt2.setString(1, pdcode);
					rs2 = pstmt2.executeQuery();
					
					if (rs2.next()) {
						sizestockList = new ArrayList<ProductSizeStockDTO>();
						do {
							String pdCode = rs2.getString("pdcode");
							int size_code = rs2.getInt("sizecode");
							int stock_count = rs2.getInt("stock_count");
							String sz = rs2.getString("sz");
							
							psizestock = new ProductSizeStockDTO(pdCode, size_code, stock_count, sz);				
							sizestockList.add(psizestock);
							
						} while (rs2.next());

						sizeStockMap.put(pdcode, sizestockList);
					} // if arraylist

					pstmt2.close();
					rs2.close();
				} while (rs.next());

				return sizeStockMap;

			} // if string

		} catch (Exception e) {
			System.out.println(">ProductListDAO.selectProductsizestock() - " + e.toString());
		} finally {
			pstmt.close();
			rs.close();
		} // try

		return null;

	}
	
	
	//왼쪽 카테고리 목록
	@Override
	public List<CategoryDTO> category(Connection conn, String category_code, String gender) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT DISTINCT(Minor_sort) categoryName,  category.category_code categoryCode "
				+ " FROM category join product on product.category_code = category.category_code ";	
				
				if(gender.equals("K")) {
					sql += " WHERE substr(category.category_code,1,1) = substr( ? , 1,1) AND ( substr(pd_code,1,1) = ? )";
				}else {
					sql += " WHERE substr(category.category_code,1,1) = substr( ? , 1,1) AND ( substr(pd_code,1,1) = 'U' OR substr(pd_code,1,1) = ? ) ";
				}
				
				
				sql += " ORDER BY category.category_code ";
		
		List<CategoryDTO> categoryList = null;
		CategoryDTO dto =null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category_code);
			pstmt.setString(2, gender);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				categoryList = new ArrayList<CategoryDTO>();
				do {
					String categoryCode = rs.getString("categoryCode");
					String categoryName = rs.getString("categoryName");
					dto = new CategoryDTO(categoryCode,categoryName);
					categoryList.add(dto);					
				}while(rs.next());
				return categoryList;
			}
		} catch (Exception e) {
			System.out.println(">productlistDAO.category() 에러:" + e.toString());
			e.printStackTrace();
		}finally {
			pstmt.close();
			rs.close();
		} // try

		return null;
	}
	
		//평점
		@Override
		public LinkedHashMap<String, ProductReviewDTO> selectProductReview(Connection conn, String category_code, String gender) throws SQLException {
			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
			ResultSet rs = null;
			ResultSet rs2 = null;

			// 상품 dto : key
			String productSQL = " SELECT product.pd_code pdcode, substr(product.pd_code,9,2) color , category_code , pd_name , pd_price , pd_memberonly , pd_mincount ,pd_feet"
					+ " FROM product join product_detail on product.pd_code = product_detail.pd_code ";
			
				if(gender.equals("K")) {
							if(category_code.length() == 1 ) {
								productSQL += " WHERE substr(product.pd_code,2,1) = ? AND ( substr(product.pd_code,1,1) = ?) ";
							}else {
								productSQL += " WHERE substr(product.pd_code,2,3) = ? AND ( substr(product.pd_code,1,1) = ?) ";
							}
				}else {
			
							if(category_code.length() == 1 ) {
								productSQL += " WHERE substr(product.pd_code,2,1) = ? AND ( substr(product.pd_code,1,1) = 'U' OR substr(product.pd_code,1,1) = ?) ";
							}else {
								productSQL += " WHERE substr(product.pd_code,2,3) = ? AND ( substr(product.pd_code,1,1) = 'U' OR substr(product.pd_code,1,1) = ?) ";
							}
				}
			
			LinkedHashMap<String, ProductReviewDTO> reviewMap = null;
			ProductReviewDTO previewdto = null;
			
			try {
				pstmt = conn.prepareStatement(productSQL);
				pstmt.setString(1, category_code);
				pstmt.setString(2, gender);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					reviewMap = new LinkedHashMap<String, ProductReviewDTO>();
					do {
						String pdcode = rs.getString("pdcode");
						
						String previewSQL = 
										" SELECT product.pd_code pdCode, count(DISTINCT(product.pd_code)) countPOfReview , avg(rev_starscore) avgReview "
									+ " FROM product join order_info on product.pd_code = order_info.pd_code "
									+ "            join order_list on order_info.ord_code = order_list.ord_code "
									+ "            join user_info on user_info.user_code = order_list.user_code "
									+ "            join review on review.user_code = user_info.user_code "
									+ " WHERE product.pd_code = ? "
									+ " GROUP BY product.pd_code ";

						pstmt2 = conn.prepareStatement(previewSQL);
						pstmt2.setString(1, pdcode);
						rs2 = pstmt2.executeQuery();
						
						if (rs2.next()) {

							do {
								String pdCode = rs2.getString("pdCode");
								int countPOfReview = rs2.getInt("countPOfReview");
								int avgReview = rs2.getInt("avgReview");
								
								previewdto = new ProductReviewDTO(pdCode, countPOfReview, avgReview);				
								
							} while (rs2.next());

							reviewMap.put(pdcode, previewdto);
						} // if reviewList

						pstmt2.close();
						rs2.close();
					} while (rs.next());

					return reviewMap;

				} // if string

			} catch (Exception e) {
				System.out.println(">ProductListDAO.selectreview() - " + e.toString());
			} finally {
				pstmt.close();
				rs.close();
			} // try

			return null;
		}
	
	
	
	//6. 왼쪽 카테고리 사이즈
	@Override
	public List<ProductSizeStockDTO> selectSizeCategory(Connection conn, String category_code, String gender)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT DISTINCT(sz) sz "
				+ "FROM  product join product_stock on product.pd_code = product_stock.pd_code "
				+ "            join size_list on product_stock.size_code = size_list.size_code ";
		
			if(gender.equals("K")) {
						if(category_code.length() == 1 ) {
							sql += " WHERE substr(product.pd_code,2,1) = ? AND ( substr(product.pd_code,1,1) = ?) ";
						}else {
							sql += " WHERE substr(product.pd_code,2,3) = ? AND ( substr(product.pd_code,1,1) = ?) ";
						}
			}else {
						if(category_code.length() == 1 ) {
							sql += " WHERE substr(product.pd_code,2,1) = ? AND ( substr(product.pd_code,1,1) = 'U' OR substr(product.pd_code,1,1) = ?) ";
						}else {
							sql += " WHERE substr(product.pd_code,2,3) = ? AND ( substr(product.pd_code,1,1) = 'U' OR substr(product.pd_code,1,1) = ?) ";
						}
			}
				sql +=  "ORDER BY sz ";
		
		List<ProductSizeStockDTO> sizeList = null;
		ProductSizeStockDTO dto =null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category_code);
			pstmt.setString(2, gender);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sizeList = new ArrayList<ProductSizeStockDTO>();
				do {
					String sz = rs.getString("sz");
					
					dto = new ProductSizeStockDTO(null, 0, 0, sz);
					sizeList.add(dto);
				}while(rs.next());
			}//if
			return sizeList;
		} catch (Exception e) {
			System.out.println("productlistDAO.categorySize() 에러:" + e.toString());
		}finally {
			pstmt.close();
			rs.close();
		}
		return null;
	}

	//7. 발볼
	@Override
	public List<ProductListDTO> selectFeet(Connection conn, String category_code, String gender) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT Distinct(pd_feet) "
				+ " FROM product join product_detail on product.pd_code = product_detail.pd_code ";
				if(gender.equals("K")) {
							if(category_code.length() == 1 ) {
								sql += " WHERE substr(product.pd_code,2,1) = ? AND ( substr(product.pd_code,1,1) = ?) ";
							}else {
								sql += " WHERE substr(product.pd_code,2,3) = ? AND ( substr(product.pd_code,1,1) = ?) ";
							}
				}else {
		
							if(category_code.length() == 1 ) {
								sql += " WHERE substr(product.pd_code,2,1) = ? AND ( substr(product.pd_code,1,1) = 'U' OR substr(product.pd_code,1,1) = ?) ";
							}else {
								sql += " WHERE substr(product.pd_code,2,3) = ? AND ( substr(product.pd_code,1,1) = 'U' OR substr(product.pd_code,1,1) = ?) ";
							}
				}
		List<ProductListDTO> feetList = null;
		ProductListDTO dto =null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category_code);
			pstmt.setString(2, gender);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				feetList = new ArrayList<ProductListDTO>();
				do {
					String pd_feet = rs.getString("pd_feet");
					
					dto = new ProductListDTO(null, null, null, null, 0, 0, 0, pd_feet,0);
					feetList.add(dto);
				}while(rs.next());
			}//if
			return feetList;
		} catch (Exception e) {
			System.out.println("productlistDAO.categoryfoot() 에러:" + e.toString());
		}finally {
			pstmt.close();
			rs.close();
		}
		return null;

	}
	
	
	//8. 카테고리 컬러
	@Override
	public List<ProductColorDTO> selectColor(Connection conn, String category_code, String gender) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " SELECT DISTINCT( TO_NUMBER(substr(product.pd_code,9,2))) color_code, color_url "
				+ " FROM product join product_image on product.pd_code = product_image.pd_code "
				+ "            join color on product_image.color_code = color.color_code ";
		
			if(gender.equals("K")) {
							if(category_code.length() == 1 ) {
								sql += " WHERE substr(product.pd_code,2,1) = ? AND ( substr(product.pd_code,1,1) = ?) ";
							}else {
								sql += " WHERE substr(product.pd_code,2,3) = ? AND ( substr(product.pd_code,1,1) = ?) ";
							}
			}else {
							if(category_code.length() == 1 ) {
								sql += " WHERE substr(product.pd_code,2,1) = ? AND ( substr(product.pd_code,1,1) = 'U' OR substr(product.pd_code,1,1) = ?) ";
							}else {
								sql += " WHERE substr(product.pd_code,2,3) = ? AND ( substr(product.pd_code,1,1) = 'U' OR substr(product.pd_code,1,1) = ?) ";
							}
			}
			sql += " ORDER BY color_code";
		
		List<ProductColorDTO> colorList = null;
		ProductColorDTO dto =null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category_code);
			pstmt.setString(2, gender);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				colorList = new ArrayList<ProductColorDTO>();
				do {
					String color_code = rs.getString("color_code");
					String color_url = rs.getString("color_url");
					
					dto = new ProductColorDTO(0, color_code, color_url);
					colorList.add(dto);
				}while(rs.next());
			}//if
			return colorList;
		} catch (Exception e) {
			System.out.println("productlistDAO.categoryColor() 에러:" + e.toString());
		}finally {
			pstmt.close();
			rs.close();
		}
		return null;
	}
	
	

	
	
	
	
	
	
	
	

}
