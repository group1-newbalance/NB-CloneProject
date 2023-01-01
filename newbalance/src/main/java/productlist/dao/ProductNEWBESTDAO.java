package productlist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.Set;

import jdbc.connection.JdbcUtil;
import productlist.domain.ProductImgDTO;
import productlist.domain.ProductListDTO;
import productlist.domain.ProductReviewDTO;
import productlist.domain.ProductSizeStockDTO;

public class ProductNEWBESTDAO implements IProductNEWBEST{
	
	// 싱글톤
	public ProductNEWBESTDAO() {};

	private static ProductNEWBESTDAO pNEWBESTDAO = null;

	public static ProductNEWBESTDAO getInstance() {
		if (pNEWBESTDAO == null) {
			pNEWBESTDAO = new ProductNEWBESTDAO();
		}
		return pNEWBESTDAO;
	}

	
	//NewBest 상품 이미지
	@Override
	public LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>> PNewBestImg(Connection conn, String cateGrpCode, String cIdx) throws SQLException {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		String sql = "";
		
		if(cIdx.equals("new")) {//cIdx가 new 출시일 순서
				sql = "SELECT product.pd_code pdcode, substr(product.pd_code,9,2) color , category_code , pd_name "
						+ "         , pd_price , pd_memberonly , pd_mincount ,pd_feet "
						+ " FROM product join product_detail on product.pd_code = product_detail.pd_code ";
				
						if(cateGrpCode.equals("K")) {
							sql += " WHERE substr(product.pd_code,1,1)= ? ";
						}else {
							sql += " WHERE substr(product.pd_code,1,1)='U' OR substr(product.pd_code,1,1)= ? ";
						}
						
						sql += " ORDER BY pd_release DESC ";

			
		}else if(cIdx.equals("best")) {//cIdx가 best 상품판매개수 순서
			sql= " SELECT product.pd_code pdcode, substr(product.pd_code,9,2) color , category_code , pd_name "
					+ "         , pd_price , pd_memberonly , pd_mincount ,pd_feet, count(out_count) out_count "
					
					+ " FROM product join product_detail on product.pd_code = product_detail.pd_code "
					+ "            FULL OUTER JOIN product_out on product.pd_code = product_out.pd_code ";
					
					if(cateGrpCode.equals("K")) {
						sql += " WHERE substr(product.pd_code,1,1)= ? ";
					}else {
						sql += " WHERE substr(product.pd_code,1,1)='U' OR substr(product.pd_code,1,1)= ? ";
					}
					
					sql += " Group by  product.pd_code, substr(product.pd_code,9,2), category_code , pd_name , pd_price , pd_memberonly , pd_mincount ,pd_feet, out_count ";
					sql += " ORDER BY out_count DESC NULLS LAST";
			
		}

		LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>> map = null;
		ProductListDTO pdto = null;
		ArrayList<ProductImgDTO> list = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cateGrpCode);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				map = new LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>>();
				
				do {
						String pdcode = rs.getString("pdcode");
						String color = rs.getString("color");
						String categoryCode = rs.getString("category_code");
						String pdname = rs.getString("pd_name");
						int price = rs.getInt("pd_price");
						int memberonly = rs.getInt("pd_memberonly");
						int mincount = rs.getInt("pd_mincount");
						String pd_feet = rs.getString("pd_feet");
					
					if(cIdx.equals("new")) {
						pdto = new ProductListDTO(pdcode, color, categoryCode, pdname, price, memberonly, mincount, pd_feet,0);
					}else if(cIdx.equals("best")) {
						int out_count = rs.getInt("out_count");
						pdto = new ProductListDTO(pdcode, color, categoryCode, pdname, price, memberonly, mincount, pd_feet,out_count);
					}
					
					//value
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
					
					if(rs2.next()) {
						list = new ArrayList<ProductImgDTO>();
						do {
							int imgpdRowNum = rs2.getInt("imgRowNumber");
							String imgpdCode = rs2.getString("pdcode");
							String imgURL = rs2.getString("imgURL");

							ProductImgDTO imgdto = new ProductImgDTO(imgpdRowNum, imgpdCode, imgURL);
							list.add(imgdto);
							
							//System.out.println(pdto.toString()  + "///////"+ imgdto.toString());
							
						}while(rs2.next());
							
						map.put(pdto, list);					
					}//if list
					
					
				}while(rs.next());

				return map;
			}//if map
		} catch (Exception e) {
			System.out.println("pNEWBESTDAO.PNewBestImg" + e.toString() );
		}finally {
			/*
			 * pstmt.close(); rs.close(); pstmt2.close(); rs2.close();
			 */
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs2);
			JdbcUtil.close(pstmt2);
			
		}
		return null;
	}

	//사이즈볋 재고수
	@Override
	public LinkedHashMap<String, ArrayList<ProductSizeStockDTO>> pNewBestStock(Connection conn, String cateGrpCode, String cIdx) throws SQLException {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		
		
		String productSQL = " SELECT product.pd_code pdcode, substr(product.pd_code,9,2) color , category_code , pd_name , pd_price , pd_memberonly , pd_mincount ,pd_feet"
				+ " FROM product join product_detail on product.pd_code = product_detail.pd_code ";
				
				if(cateGrpCode.equals("K")) {
					productSQL += " WHERE substr(product.pd_code,1,1) = ? ";
				}else {
					productSQL += "WHERE substr(product.pd_code,1,1) = 'U' OR substr(product.pd_code,1,1) = ? ";
				}
				


		LinkedHashMap<String, ArrayList<ProductSizeStockDTO>> map = null;
		ArrayList<ProductSizeStockDTO> sizestockList = null;
		ProductSizeStockDTO psizestock = null;
		
		try {
			pstmt = conn.prepareStatement(productSQL);
			pstmt.setString(1, cateGrpCode);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				map = new LinkedHashMap<String, ArrayList<ProductSizeStockDTO>>();
				
				do {
						String pdcode = rs.getString("pdcode");
					
					//value
					String sizestockSQL = 
							" SELECT product_stock.pd_code pdCode, size_list.size_code sizecode, stock_count , sz"
									+ " FROM product join product_stock on product.pd_code = product_stock.pd_code "
									+ "                    join size_list on product_stock.size_code = size_list.size_code "
									+ " WHERE product_stock.pd_code = ? ";
					
					pstmt2 = conn.prepareStatement(sizestockSQL);
					pstmt2.setString(1, pdcode);
					rs2 = pstmt2.executeQuery();
					
					if(rs2.next()) {
						sizestockList = new ArrayList<ProductSizeStockDTO>();
						do {
							String pdCode = rs2.getString("pdcode");
							int size_code = rs2.getInt("sizecode");
							int stock_count = rs2.getInt("stock_count");
							String sz = rs2.getString("sz");
							
							psizestock = new ProductSizeStockDTO(pdCode, size_code, stock_count, sz);			
							sizestockList.add(psizestock);
							
						}while(rs2.next());

						map.put(pdcode, sizestockList);					
					}//if list
					
					
				}while(rs.next());
				
				return map;
			}//if map
		} catch (Exception e) {
			System.out.println("pNEWBESTDAO.PNewBestStock" + e.toString() );
		}finally {
			pstmt.close();
			rs.close();
			pstmt2.close();
			rs2.close();
		}
		return null;
	}


			//평점
			@Override
			public LinkedHashMap<String, ProductReviewDTO> selectProductReview(Connection conn, String cateGrpCode, String gender) throws SQLException {
				PreparedStatement pstmt = null;
				PreparedStatement pstmt2 = null;
				ResultSet rs = null;
				ResultSet rs2 = null;


				String productSQL = " SELECT product.pd_code pdcode, substr(product.pd_code,9,2) color , category_code , pd_name , pd_price , pd_memberonly , pd_mincount ,pd_feet"
						+ " FROM product join product_detail on product.pd_code = product_detail.pd_code ";
						
						if(cateGrpCode.equals("K")) {
							productSQL += " WHERE substr(product.pd_code,1,1) = ? ";
						}else {
							productSQL += "WHERE substr(product.pd_code,1,1) = 'U' OR substr(product.pd_code,1,1) = ? ";
						}

				LinkedHashMap<String, ProductReviewDTO> reviewMap = null;
				ProductReviewDTO previewdto = null;
				
				try {
					pstmt = conn.prepareStatement(productSQL);
					pstmt.setString(1, cateGrpCode);
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
					System.out.println(">pNEWBESTDAO.selectreview() - " + e.toString());
				} finally {
					pstmt.close();
					rs.close();
				} // try

				return null;
			}
	
	
	
	
	
	
}
