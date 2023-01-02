package product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.startup.RealmRuleSet;

import jdbc.connection.JdbcUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
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
	public ProductDTO selectProduct(Connection conn, String pdCode) throws SQLException {
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

	@Override
	public ProductAjaxDTO selectProductAjax(Connection conn, String pdCode) throws SQLException {
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

		ProductAjaxDTO pdDto = null;

		try {
			pstmt = conn.prepareStatement(sql);   
			pstmt.setString(1, pdCode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pdDto = new ProductAjaxDTO();
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
				pdDto.setPdRelease(rs.getString("pd_release"));
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
	public ArrayList<ProductImageDTO> selectImage(Connection conn, String pdCode) throws SQLException {

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
	public ArrayList<ProductSizeDTO> selectSize(Connection conn, String pdCode) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT s.size_code size_code, stock_count, sz "
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
					sizeDto.setSizeCode(rs.getInt("size_code"));
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
	public ArrayList<ProductDTO> selectRelatedProduct(Connection conn, String pdCode) throws SQLException {

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
	public ArrayList<ProductColorDTO> diffColorProduct(Connection conn, String pdCode) throws SQLException {
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
	public ProductColorDTO getPdColor(Connection conn, String pdCode) throws SQLException {
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

	// 재입고 알림 상품 추가
	@Override
	public int applyAlarm(Connection conn, RestockAlarmDTO dto) throws SQLException {
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null;
		int rowCount = 0;

		String sql = "SELECT count(*) count "
				+ "FROM restock_pd "
				+ "WHERE user_code = ? and pd_code = ? and sz = ? ";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getUserCode());
			pstmt.setString(2, dto.getPdCode());
			pstmt.setString(3, dto.getSize());
			rs = pstmt.executeQuery();

			int count = 0;
			if (rs.next()) {
				count = rs.getInt("count");
			}

			if(count == 0) {
				String sql2 = "INSERT INTO restock_pd VALUES ( "
						+ " rs_code.nextval, '알림대기', SYSDATE, null, ?, ?, ?, ?)";

				try {
					pstmt2 = conn.prepareStatement(sql2);

					pstmt2.setString(1, dto.getUserCode());
					pstmt2.setString(2, dto.getPdCode());
					pstmt2.setString(3, dto.getColor());
					pstmt2.setString(4, dto.getSize());

					rowCount = pstmt2.executeUpdate();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(pstmt2);
		}  

		return rowCount;
	}


	// 장바구니 추가
	@Override
	public int addCartList(Connection conn, AddCartDTO cartDto) throws SQLException {
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null;
		int rowCount = 0;
		System.out.println("addCartList dao 호출됨");
		
		String sql = "SELECT COUNT(*) count "
				+ " FROM cart "
				+ " WHERE user_code = ? and pd_code = ? and size_code in ( ";

		int[] sizeCodeList = cartDto.getSizeCode();
		String str = "";
		for (int i = 0; i < sizeCodeList.length; i++) {
			str += String.format("%d", sizeCodeList[i]) + (i != sizeCodeList.length - 1? ", " : ") ");		
		}
		sql += str;

		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, cartDto.getUserCode());
			pstmt.setString(2, cartDto.getPdCode());
			rs = pstmt.executeQuery();

			int count = 0;
			if (rs.next()) {
				count = rs.getInt("count");
			}

			if(count == 0) {

				for(int j = 0; j < sizeCodeList.length;j++) {
					String sql2 = "INSERT INTO cart VALUES ( "
							+ " cart_num.nextval, ?, ?, ?, ?, 1, SYSDATE, ADD_MONTHS(SYSDATE, 1), ? ";
									
					try {
						pstmt2 = conn.prepareStatement(sql2);
						pstmt2.setString(1, cartDto.getUserCode());
						pstmt2.setString(2, cartDto.getPdCode());
						pstmt2.setInt(3, sizeCodeList[j]);
						pstmt2.setString(4, cartDto.getColor());
						//pstmt2.setInt(5, 담을 수량);
						pstmt2.setString(5, cartDto.getPdImage());

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


	@Override
	public LinkedHashMap<ReviewDTO, ArrayList<ReviewImgDTO>> selectReview(Connection conn, String pdCode) throws SQLException {

		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null, rs2 = null;

		LinkedHashMap<ReviewDTO, ArrayList<ReviewImgDTO>> revMap = null;
		ReviewDTO revDto = null;
		ArrayList<ReviewImgDTO> imgList = null;

		String  sql = "SELECT rev_seq, user_code, ord_code, sz, color, rev_date, rev_content, rev_good, rev_bad, rev_starscore "
				+ "FROM review "
				+ "WHERE pd_code = ? ";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pdCode);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				revMap = new LinkedHashMap<ReviewDTO, ArrayList<ReviewImgDTO>>();
				do {
					revDto = new ReviewDTO(
							rs.getInt("rev_seq"),
							rs.getString("user_code"),
							rs.getString("ord_code"),
							rs.getString("sz"),
							rs.getString("color"),
							rs.getString("rev_date"),
							rs.getString("rev_content"),
							rs.getInt("rev_good"),
							rs.getInt("rev_bad"),
							rs.getDouble("rev_starscore")
							);

					String sql2 = " SELECT r.rev_seq rev_seq, rev_img "
							+ "FROM review r join review_image i on r.rev_seq = i.rev_seq "
							+ "WHERE pd_code = ? ";

					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1, pdCode);
					rs2 = pstmt2.executeQuery();

					if (rs2.next()) {
						imgList = new ArrayList<ReviewImgDTO>();
						do {
							ReviewImgDTO imgDto = new ReviewImgDTO(rs2.getInt("rev_seq"), rs2.getString("rev_img"));
							imgList.add(imgDto);
						} while (rs2.next());

						revMap.put(revDto, imgList);
					} 
					pstmt2.close();
					rs2.close();
				} while (rs.next());
				return revMap;
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pstmt.close();
			rs.close();
		}

		return null;

	}

	@Override
	public ReviewDTO totalReview(Connection conn, String pdCode) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT COUNT(*) count, AVG(rev_starscore) avg "
				+ "FROM review "
				+ "WHERE pd_code = ? ";

		ReviewDTO rDto = null;

		try {
			pstmt = conn.prepareStatement(sql);   
			pstmt.setString(1, pdCode);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rDto = new ReviewDTO(rs.getInt("count"), rs.getDouble("avg"));
			} 

		} finally {
			try {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}catch(Exception e) {            
			}
		}   

		return rDto;
	}




}
