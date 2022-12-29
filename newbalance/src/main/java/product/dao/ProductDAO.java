package product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import jdbc.connection.JdbcUtil;
import product.domain.ProductColorDTO;
import product.domain.ProductDTO;
import product.domain.ProductImageDTO;
import product.domain.ProductSizeDTO;
import product.domain.WishlistDTO;
import productlist.domain.ProductImgDTO;
import productlist.domain.ProductListDTO;

public class ProductDAO implements IProduct {
	
		private static ProductDAO ProductDetailDAO = null;
		public static ProductDAO getInstance() {
			if(ProductDetailDAO == null) {
				ProductDetailDAO = new ProductDAO();
		    }
		    return ProductDetailDAO;
		}
		
		// 상품 정보
		@Override
		public ProductDTO selectProduct(Connection conn, String pdCode, String userCode) throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String  sql = " SELECT pd_code, category_code, pd_name, pd_price, pd_memberonly, pd_mincount "
							+ "    , pd_country, pd_from, pd_date, pd_material, pd_feet, pd_release, pd_feature "
							+ "    , img_url"
							+ " FROM ( "
							+ "    SELECT p.pd_code, category_code, pd_name, pd_price, pd_memberonly, pd_mincount "
							+ "        , pd_country, pd_from, pd_date, pd_material, pd_feet, pd_release, pd_feature "
							+ "        , ROW_NUMBER() OVER(PARTITION BY p.pd_code ORDER BY img_seq ASC) seq, img_url "
							+ "    FROM product p join product_detail d on p.pd_code = d.pd_code "
							+ "                   		   join product_image i on p.pd_code = i.pd_code "
							+ " )t "
							+ " WHERE seq = 1 and pd_code = ? ";

			ProductDTO pdDto = null;
			
			try {
				pstmt = conn.prepareStatement(sql);   
				pstmt.setString(1, pdCode);
				rs = pstmt.executeQuery();
				if (rs.next()) {
						pdDto = new ProductDTO();
						pdDto.setPdCode(rs.getString("pd_code"));
						pdDto.setCategoryCode(rs.getString("category_code"));
						pdDto.setPdName(rs.getString("pd_name"));
						pdDto.setPdPrice(rs.getInt("pd_price"));
						pdDto.setPdMemberonly(rs.getInt("pd_memberonly"));
						pdDto.setPdMincount(rs.getInt("pd_mincount"));
						pdDto.setPdCountry(rs.getString("pd_country"));
						pdDto.setPdFrom(rs.getString("pd_from"));
						pdDto.setPdDate(rs.getString("pd_date"));
						pdDto.setPdMaterial(rs.getString("pd_material"));
						pdDto.setPdFeet(rs.getString("pd_feet"));
						pdDto.setPdRelease(rs.getDate("pd_release"));
						pdDto.setPdFeature(rs.getString("pd_feature"));
						pdDto.setImgUrl(rs.getString("img_url"));
				} 
	
			} finally {
				try {
					JdbcUtil.close(rs);
					JdbcUtil.close(pstmt);
				}catch(Exception e) {            
				}
			}   
			
			return pdDto;
		}

		// 상품 이미지 리스트
		@Override
		public ArrayList<ProductImageDTO> selectImage(Connection conn, String pdCode, String userCode) throws SQLException {
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = "SELECT img_url "
					+ " FROM product_image "
					+ " WHERE pd_code = ? "
					+ " ORDER BY img_seq";

			ProductImageDTO imgDto = null;
			ArrayList<ProductImageDTO> imgList = null;
			
			try {
				pstmt = conn.prepareStatement(sql);   
				pstmt.setString(1, pdCode);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					imgList = new ArrayList<ProductImageDTO>();
					do {
						imgDto = new ProductImageDTO();
						imgDto.setImgUrl(rs.getString("img_url"));
						
						imgList.add(imgDto);
					}while(rs.next());
				} 
	
			} finally {
				try {
					JdbcUtil.close(rs);
					JdbcUtil.close(pstmt);
				}catch(Exception e) {            
				}
			}   
			
			return imgList;
			
		}
		
		// 상품 사이즈 리스트
		@Override
		public ArrayList<ProductSizeDTO> selectSize(Connection conn, String pdCode, String userCode) throws SQLException {
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = "SELECT s.size_code, stock_count, sz "
					+ "FROM product p join product_stock s on p.pd_code = s.pd_code "
					+ "			  			 join size_list l on s.size_code = l.size_code "
					+ "WHERE p.pd_code = ? ";

			ProductSizeDTO sizeDto = null;
			ArrayList<ProductSizeDTO> sizeList = null;
			
			try {
				pstmt = conn.prepareStatement(sql);   
				pstmt.setString(1, pdCode);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					sizeList = new ArrayList<ProductSizeDTO>();
					do {
						sizeDto = new ProductSizeDTO();
						sizeDto.setSz(rs.getString("sz"));
						sizeDto.setStockCount(rs.getInt("stock_count"));
						
						sizeList.add(sizeDto);
					}while(rs.next());
				} 
	
			} finally {
				try {
					JdbcUtil.close(rs);
					JdbcUtil.close(pstmt);
				}catch(Exception e) {            
				}
			}   
			
			return sizeList;
			
		}

		// 연관 상품 리스트
		@Override
		public ArrayList<ProductDTO> selectRelatedProduct(Connection conn, String pdCode, String userCode) throws SQLException {
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT pd_code, pd_name, pd_price, img_url "
					+ "FROM ( "
					+ "    SELECT p.pd_code, pd_name, pd_price "
					+ "        , ROW_NUMBER() OVER(PARTITION BY p.pd_code ORDER BY img_seq ASC) seq, img_url "
					+ "    FROM product p join product_detail d on p.pd_code = d.pd_code "
					+ "                   join product_image i on p.pd_code = i.pd_code "
					+ ")t "
					+ "WHERE seq = 1 and ROWNUM <= 4 and substr(pd_code, 1, 4) = substr(?, 1, 4)";


			ProductDTO pdDto = null;
			ArrayList<ProductDTO> relatedPdList = null;
			
			try {
				pstmt = conn.prepareStatement(sql);   
				pstmt.setString(1, pdCode);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					relatedPdList = new ArrayList<ProductDTO>();
					do {
						pdDto = new ProductDTO();
						pdDto.setPdCode(rs.getString("pd_code"));
						pdDto.setPdName(rs.getString("pd_name"));
						pdDto.setPdPrice(rs.getInt("pd_price"));
						pdDto.setImgUrl(rs.getString("img_url"));
						
						relatedPdList.add(pdDto);
					}while(rs.next());
				} 
	
			} finally {
				try {
					JdbcUtil.close(rs);
					JdbcUtil.close(pstmt);
				}catch(Exception e) {            
				}
			}   
			
			return relatedPdList;
	
		}

		// 다른 컬러 리스트
		@Override
		public ArrayList<ProductColorDTO> diffColorProduct(Connection conn, String pdCode, String userCode) throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT pd_code, img_url, trim(TO_CHAR(color_code, '09')) color_code, color, pd_name, pd_price "
					+ "FROM ( "
					+ "    SELECT p.pd_code, c.color_code, color, pd_name, pd_price "
					+ "        , ROW_NUMBER() OVER(PARTITION BY p.pd_code ORDER BY img_seq ASC) seq, img_url "
					+ "    FROM product p join product_image i on p.pd_code = i.pd_code "
					+ "                   join color c on i.color_code = c.color_code "
					+ ")t "
					+ "WHERE seq = 1 and substr(pd_code, 1, 8) = substr(?, 1, 8)";


			ProductColorDTO colorDto = null;
			ArrayList<ProductColorDTO> diffColorList = null;
			
			try {
				pstmt = conn.prepareStatement(sql);   
				pstmt.setString(1, pdCode);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					diffColorList = new ArrayList<ProductColorDTO>();
					do {
						colorDto = new ProductColorDTO();
						colorDto.setPdCode(rs.getString("pd_code"));
						colorDto.setPdPrice(rs.getInt("pd_price"));
						colorDto.setPdName(rs.getString("pd_name"));
						colorDto.setColorCode(rs.getString("color_code"));
						colorDto.setColor(rs.getString("color"));
						colorDto.setImgUrl(rs.getString("img_url"));
						
						diffColorList.add(colorDto);
					}while(rs.next());
				} 
	
			} finally {
				try {
					JdbcUtil.close(rs);
					JdbcUtil.close(pstmt);
				}catch(Exception e) {            
				}
			}   
			
			return diffColorList;
			
		}

		
		// 현재 상품의 컬러
		@Override
		public ProductColorDTO selectColor(Connection conn, String pdCode, String userCode) throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT distinct(trim(TO_CHAR(c.color_code, '09'))) color_code, color, p.pd_code pd_code "
					+ "FROM product p join product_image i on p.pd_code = i.pd_code "
					+ "                        join color c on i.color_code = c.color_code "
					+ "WHERE p.pd_code = ? ";
			
			ProductColorDTO colorDto = null;
			
			try {
				pstmt = conn.prepareStatement(sql);   
				pstmt.setString(1, pdCode);
				rs = pstmt.executeQuery();
				if (rs.next()) {
						colorDto = new ProductColorDTO();
						colorDto.setPdCode(rs.getString("pd_code"));
						colorDto.setColorCode(rs.getString("color_code"));
						colorDto.setColor(rs.getString("color"));
				} 
	
			} finally {
				try {
					JdbcUtil.close(rs);
					JdbcUtil.close(pstmt);
				}catch(Exception e) {            
				}
			}   
			
			return colorDto;
		}

		
		// 관심상품 추가
		@Override
		public int addWishlist(Connection conn, WishlistDTO dto) throws SQLException {
			PreparedStatement pstmt = null, pstmt2 = null;
			ResultSet rs = null;
			int rowCount = 0;
			System.out.println("WishList dao 호출됨");

			String sql = "SELECT count(*) count "
					+ "FROM wishlist "
					+ "WHERE user_code = ?  and pd_code  in (";
			
			String[] wishList = dto.getPdCode();
			String str = "";
			for (int i = 0; i < wishList.length; i++) {
				str += String.format("'%s'", wishList[i]) + (i != wishList.length - 1? ", " : ") ");		
			}
			sql += str;
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getUserCode());
				rs = pstmt.executeQuery();
	
				int count = 0;
				if (rs.next()) {
					count = rs.getInt("count");
				}

				if(count == 0) {
					
					for(int j = 0; j < wishList.length;j++) {
						String sql2 = "INSERT INTO wishlist VALUES ( "
								+ " wish_code.nextval, ?, ?, SYSDATE, ADD_MONTHS(SYSDATE, 1)) ";
						
						try {
							pstmt2 = conn.prepareStatement(sql2);
							pstmt2.setString(1, wishList[j]);
							pstmt2.setString(2, dto.getUserCode());
							
							rowCount = pstmt2.executeUpdate();
						}catch (Exception e) {
							e.printStackTrace();
						}
					}
					
				}else {
					rowCount = 0;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				JdbcUtil.close(pstmt);
			}  
			
			return rowCount;
		}
		
	   
}
