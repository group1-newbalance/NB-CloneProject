package productlist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import jdbc.connection.JdbcUtil;
import productlist.domain.ProductImgDTO;
import productlist.domain.ProductListDTO;
import productlist.domain.ProductReviewDTO;
import productlist.domain.ProductSizeStockDTO;

public class ProductFilterAjaxDAO implements IProductFilterAjax{
	
	// 싱글톤
	public ProductFilterAjaxDAO() {};

	private static ProductFilterAjaxDAO productFilterAjaxDAO = null;

	public static ProductFilterAjaxDAO getInstance() {
		if (productFilterAjaxDAO == null) {
			productFilterAjaxDAO = new ProductFilterAjaxDAO();
		}
		return productFilterAjaxDAO;
	}
	
	//0. 상품정보
	@Override
	public LinkedHashMap<String, ProductListDTO> productInfoAjax(Connection conn, String soldOutYn,
			String sizeCode, String feetWidth, String colorCode, String subCateIdx, String[][] priceRange,
			String sortProducts, String cateGrpCode, String cIdx,String searchWord) throws SQLException {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		LinkedHashMap<String, ProductListDTO> map = null;
		ProductListDTO pdto = null;
		String sql = 
				" SELECT DISTINCT(p.pd_code) pdCode,  substr(p.pd_code,9,2) color , p.category_code category_code"
				+ "					 , pd_name , pd_price "
			+ "                        , pd_memberonly , pd_mincount ,pd_feet ,  out_count "
			+ "						,pd_release	"	
			+ " FROM product p JOIN product_detail pd ON p.pd_code = pd.pd_code "
			+ "            FULL OUTER JOIN product_out o on p.pd_code = o.pd_code "
			+ " WHERE p.pd_code IN ( "
			+ "        SELECT ps.pd_code "
			+ "        FROM product_stock ps JOIN product_detail pd ON ps.pd_code = pd.pd_code ";
		if(searchWord == "") {
			if(cateGrpCode.equals("K")) {//아동
				sql += " WHERE ( substr(ps.pd_code,1,1) = ? ";
			}else {//성인
				sql += " WHERE ( substr(ps.pd_code,1,1) = 'U' OR substr(ps.pd_code,1,1) = ? )";
			}
		}else {
				sql += "  WHERE REGEXP_LIKE( p.pd_code , ? , 'i' ) or  REGEXP_LIKE( p.pd_name , ? , 'i' )";
		}
		
			if(sizeCode != "null") {//사이즈
				sql += 	" 			AND ps.size_code in ( " + sizeCode + " )  ";
			}else {
				sql += "";
			}
	
			if(feetWidth != "null") {//발볼
				sql += 	" 			AND pd_feet in ( " + feetWidth + " ) ";
			}
		
			if(colorCode!="null") {//컬러
				sql +=	" 			AND substr(ps.pd_code,9,2) in ( " + colorCode + " ) "; // 02, 20, 57
			}
	
			if(subCateIdx!= "null") {//카테고리들
				sql += 	" 			AND substr(ps.pd_code,2,3) in ( " + subCateIdx + " ) "; // "F01" , "F02"
			}
	
			if(priceRange!=null) {//가격범위
				sql += 	" 			AND ( ";
				for (int i = 0; i < priceRange.length; i++) {
					sql += 	"				pd_price >= " + priceRange[i][0] + " AND pd_price < " + priceRange[i][1];
					sql += i != priceRange.length -1 ? " OR ": ")";
				}
			}
				sql += 	" 			GROUP BY ps.pd_code ";
			if(soldOutYn != null) {//품절상품 제외
				System.out.println("soldOutYn : "+ soldOutYn);
				sql +=	" 			HAVING SUM(stock_count) > 0 ";
			}
				sql += 	" ) ";
			if(sortProducts != "null") {//정렬들(가격순, 신상품순....)
				if(sortProducts.equals("Q01")) {
					sql += " ORDER BY pd_release DESC NULLS LAST ";
				}else if(sortProducts.equals("Q02")) {
					sql += " ORDER BY out_count DESC NULLS LAST ";
				}else if(sortProducts.equals("Q03")) {
					sql += " ORDER BY pd_price DESC ";
				}else if(sortProducts.equals("Q04")) {
					sql += " ORDER BY pd_price ASC ";
				}
			}
		
System.out.println(sql);

		try {
			pstmt= conn.prepareStatement(sql);
			if(searchWord == "") {
				pstmt.setString(1, cateGrpCode); // "M"
			}else {
				pstmt.setString(1, searchWord);
				pstmt.setString(2, searchWord);
			}
			
			rs=pstmt.executeQuery();
System.out.println("1");			
			if(rs.next()) {
				map = new LinkedHashMap<String, ProductListDTO>();
				
				do {
					String pdCode = rs.getString("pdCode");
					
System.out.println("이미지1");			
					String productListSQL = "SELECT product.pd_code pdcode, substr(product.pd_code,9,2) color , category_code , pd_name , pd_price , pd_memberonly , pd_mincount ,pd_feet "
							+ " FROM product join product_detail on product.pd_code = product_detail.pd_code  "
							+ "            FULL OUTER JOIN product_out on product.pd_code = product_out.pd_code "
							+ " WHERE product.pd_code = ? ";
							
					
					pstmt2 = conn.prepareStatement(productListSQL);
					pstmt2.setString(1, pdCode);
					rs2 = pstmt2.executeQuery();
System.out.println("이미지2");		
					if(rs2.next()) {
						
						do {
							String pdcode = rs.getString("pdcode");
							String color = rs.getString("color");
							String categoryCode = rs.getString("category_code");
							String pdname = rs.getString("pd_name");
							int price = rs.getInt("pd_price");
							int memberonly = rs.getInt("pd_memberonly");
							int mincount = rs.getInt("pd_mincount");
							String pd_feet = rs.getString("pd_feet");

							pdto = new ProductListDTO(pdcode, color, categoryCode, pdname, price, memberonly, mincount, pd_feet ,0);
							//System.out.println(pdCode + " :::::: " + pdto.toString());
							
						}while(rs2.next());
						
						map.put(pdCode, pdto);					
					}//if list
					
				}while(rs.next());
				
				
				return map;

			}//if map
			}catch (Exception e) {
				System.out.println("ProductFilterAjaxDao.producListAjax()" + e.toString() );
				e.printStackTrace();
			}finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs2);
				JdbcUtil.close(pstmt2);
			}
			return null;
		}
	
	
	//1. 상품별 이미지
	@Override
	public LinkedHashMap<String, ArrayList<ProductImgDTO>> productImgAjax(Connection conn, String soldOutYn,
			String sizeCode, String feetWidth, String colorCode, String subCateIdx, String[][] priceRange,
			String sortProducts, String cateGrpCode, String cIdx, String searchWord) throws SQLException {
		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		LinkedHashMap<String, ArrayList<ProductImgDTO>> map = null;
		ArrayList<ProductImgDTO> list = null;
		String sql = 
				" SELECT DISTINCT(p.pd_code) pdCode,  substr(p.pd_code,9,2) color , p.category_code category_code"
				+ "					 , pd_name , pd_price "
			+ "                        , pd_memberonly , pd_mincount ,pd_feet ,  out_count "
			+ "						,pd_release	"	
			+ " FROM product p JOIN product_detail pd ON p.pd_code = pd.pd_code "
			+ "            FULL OUTER JOIN product_out o on p.pd_code = o.pd_code "
			+ " WHERE p.pd_code IN ( "
			+ "        SELECT ps.pd_code "
			+ "        FROM product_stock ps JOIN product_detail pd ON ps.pd_code = pd.pd_code ";
	
		if(searchWord == "") {
			if(cateGrpCode.equals("K")) {//아동
				sql += " WHERE ( substr(ps.pd_code,1,1) = ? ";
			}else {//성인
				sql += " WHERE ( substr(ps.pd_code,1,1) = 'U' OR substr(ps.pd_code,1,1) = ? )";
			}
		}else {
				sql += "  WHERE REGEXP_LIKE( p.pd_code , ? , 'i' ) or  REGEXP_LIKE( p.pd_name , ? , 'i' )";
		}
	
		if(sizeCode != "null") {//사이즈
			sql += 	" 			AND ps.size_code in ( " + sizeCode + " )  ";
		}else {
			sql += "";
		}

		if(feetWidth != "null") {//발볼
			sql += 	" 			AND pd_feet in ( " + feetWidth + " ) ";
		}
	
		if(colorCode!="null") {//컬러
			sql +=	" 			AND substr(ps.pd_code,9,2) in ( " + colorCode + " ) "; // 02, 20, 57
		}

		if(subCateIdx!= "null") {//카테고리들
			sql += 	" 			AND substr(ps.pd_code,2,3) in ( " + subCateIdx + " ) "; // "F01" , "F02"
		}

		if(priceRange!=null) {//가격범위
			sql += 	" 			AND ( ";
			for (int i = 0; i < priceRange.length; i++) {
				sql += 	"				pd_price >= " + priceRange[i][0] + " AND pd_price < " + priceRange[i][1];
				sql += i != priceRange.length -1 ? " OR ": ")";
			}
		}
			sql += 	" 			GROUP BY ps.pd_code ";
		if(soldOutYn != null) {//품절상품 제외
			sql +=	" 			HAVING SUM(stock_count) > 0 ";
		}
			sql += 	" ) ";
		if(sortProducts != "null") {//정렬들(가격순, 신상품순....)
			if(sortProducts.equals("Q01")) {
				sql += " ORDER BY pd_release DESC NULLS LAST ";
			}else if(sortProducts.equals("Q02")) {
				sql += " ORDER BY out_count DESC NULLS LAST ";
			}else if(sortProducts.equals("Q03")) {
				sql += " ORDER BY pd_price DESC ";
			}else if(sortProducts.equals("Q04")) {
				sql += " ORDER BY pd_price ASC ";
			}
		}
		
System.out.println(sql);

		try {
			pstmt= conn.prepareStatement(sql);
			if(searchWord == "") {
				pstmt.setString(1, cateGrpCode); // "M"
			}else {
				pstmt.setString(1, searchWord);
				pstmt.setString(2, searchWord);
			}
			rs=pstmt.executeQuery();
System.out.println("1");			
			if(rs.next()) {
/*				do {
					String pdCode = rs.getString("pdCode");
					System.out.println(">pdCode : " + pdCode);
				}while( rs.next());
*/
				map = new LinkedHashMap<String, ArrayList<ProductImgDTO>>();
				
				do {
					String pdCode = rs.getString("pdCode");
					
System.out.println("이미지1");			
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
					pstmt2.setString(1, pdCode);
					rs2 = pstmt2.executeQuery();
System.out.println("이미지2");		
					if(rs2.next()) {
						list = new ArrayList<ProductImgDTO>();
						do {
							int imgpdRowNum = rs2.getInt("imgRowNumber");
							String imgpdCode = rs2.getString("pdcode");
							String imgURL = rs2.getString("imgURL");

							ProductImgDTO imgdto = new ProductImgDTO(imgpdRowNum, imgpdCode, imgURL);
							list.add(imgdto);

							//System.out.println(pdCode.toString() + " :::::: " + imgdto.toString());
							
						}while(rs2.next());
						
						map.put(pdCode, list);					
					}//if list
					
				}while(rs.next());
				
				
				return map;

			}//if map

		} catch (Exception e) {
			System.out.println("ProductFilterAjaxDao.productImgAjax()" + e.toString() );
			e.printStackTrace();
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs2);
			JdbcUtil.close(pstmt2);
		}
		return null;
	}

	//2. 사이즈별 재고
	@Override
	public LinkedHashMap<String, ArrayList<ProductSizeStockDTO>> productSizeStockAjax(Connection conn, String soldOutYn,
			String sizeCode, String feetWidth, String colorCode, String subCateIdx, String[][] priceRange,
			String sortProducts, String cateGrpCode, String cIdx, String searchWord) throws SQLException {

		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		LinkedHashMap<String, ArrayList<ProductSizeStockDTO>> map = null;
		ProductSizeStockDTO pdto = null;
		ArrayList<ProductSizeStockDTO> list = null;
		
		String sql = 
				" SELECT DISTINCT(p.pd_code) pdCode,  substr(p.pd_code,9,2) color , p.category_code category_code"
				+ "					 , pd_name , pd_price "
			+ "                        , pd_memberonly , pd_mincount ,pd_feet ,  out_count "
			+ "						,pd_release	"	
			+ " FROM product p JOIN product_detail pd ON p.pd_code = pd.pd_code "
			+ "            FULL OUTER JOIN product_out o on p.pd_code = o.pd_code "
			+ " WHERE p.pd_code IN ( "
			+ "        SELECT ps.pd_code "
			+ "        FROM product_stock ps JOIN product_detail pd ON ps.pd_code = pd.pd_code ";
	
		if(searchWord == "") {
			if(cateGrpCode.equals("K")) {//아동
				sql += " WHERE ( substr(ps.pd_code,1,1) = ? ";
			}else {//성인
				sql += " WHERE ( substr(ps.pd_code,1,1) = 'U' OR substr(ps.pd_code,1,1) = ? )";
			}
		}else {
				sql += "  WHERE REGEXP_LIKE( p.pd_code , ? , 'i' ) or  REGEXP_LIKE( p.pd_name , ? , 'i' )";
		}
	
		if(sizeCode != "null") {//사이즈
			sql += 	" 			AND ps.size_code in ( " + sizeCode + " )  ";
		}else {
			sql += "";
		}

		if(feetWidth != "null") {//발볼
			sql += 	" 			AND pd_feet in ( " + feetWidth + " ) ";
		}
	
		if(colorCode!="null") {//컬러
			sql +=	" 			AND substr(ps.pd_code,9,2) in ( " + colorCode + " ) "; // 02, 20, 57
		}

		if(subCateIdx!= "null") {//카테고리들
			sql += 	" 			AND substr(ps.pd_code,2,3) in ( " + subCateIdx + " ) "; // "F01" , "F02"
		}

		if(priceRange!=null) {//가격범위
			sql += 	" 			AND ( ";
			for (int i = 0; i < priceRange.length; i++) {
				sql += 	"				pd_price >= " + priceRange[i][0] + " AND pd_price < " + priceRange[i][1];
				sql += i != priceRange.length -1 ? " OR ": ")";
			}
		}
			sql += 	" 			GROUP BY ps.pd_code ";
		if(soldOutYn != null) {//품절상품 제외
			sql +=	" 			HAVING SUM(stock_count) > 0 ";
		}
			sql += 	" ) ";
		if(sortProducts != "null") {//정렬들(가격순, 신상품순....)
			if(sortProducts.equals("Q01")) {
				sql += " ORDER BY pd_release DESC NULLS LAST ";
			}else if(sortProducts.equals("Q02")) {
				sql += " ORDER BY out_count DESC NULLS LAST ";
			}else if(sortProducts.equals("Q03")) {
				sql += " ORDER BY pd_price DESC ";
			}else if(sortProducts.equals("Q04")) {
				sql += " ORDER BY pd_price ASC ";
			}
		}
		try {
			pstmt= conn.prepareStatement(sql);
			if(searchWord == "") {
				pstmt.setString(1, cateGrpCode); // "M"
			}else {
				pstmt.setString(1, searchWord);
				pstmt.setString(2, searchWord);
			}
			rs=pstmt.executeQuery();
System.out.println("재고1");				
			if(rs.next()) {
				map = new LinkedHashMap<String, ArrayList<ProductSizeStockDTO>>();
				
				do {
					String pdCode = rs.getString("pdCode");
					
					String sizestockSQL = 
							" SELECT product_stock.pd_code pdCode, size_list.size_code sizecode, stock_count , sz"
									+ " FROM product join product_stock on product.pd_code = product_stock.pd_code "
									+ "                    join size_list on product_stock.size_code = size_list.size_code "
									+ " WHERE product_stock.pd_code = ? ";
					
					pstmt2 = conn.prepareStatement(sizestockSQL);
					pstmt2.setString(1, pdCode);
					rs2 = pstmt2.executeQuery();
System.out.println("재고2");		
System.out.println("sql재고 : " +sql);
					if(rs2.next()) {
						list = new ArrayList<ProductSizeStockDTO>();
						do {
							String pd_Code = rs2.getString("pdCode");
							int size_code = rs2.getInt("sizecode");
							int stock_count = rs2.getInt("stock_count");
							String sz = rs2.getString("sz");

							pdto = new ProductSizeStockDTO(pd_Code, size_code, stock_count, sz);			
							list.add(pdto);
							
							//System.out.println( pdCode + "///////"+ pdto.toString());
							
						}while(rs2.next());
//System.out.println("6");								
						map.put(pdCode, list);					
					}//if list

				}while(rs.next());
				
				return map;
			}//if map

		} catch (Exception e) {
			System.out.println("ProductFilterAjaxDao.productSizeStockAjax()" + e.toString() );
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs2);
			JdbcUtil.close(pstmt2);
		}
		return null;
	}
	
	
	//3.상품별 리뷰
	@Override
	public LinkedHashMap<String, ArrayList<ProductReviewDTO>> productReviewAjax(Connection conn, String soldOutYn,
			String sizeCode, String feetWidth, String colorCode, String subCateIdx, String[][] priceRange,
			String sortProducts, String cateGrpCode, String cIdx, String searchWord) throws SQLException {
		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		LinkedHashMap<String, ArrayList<ProductReviewDTO>> map = null;
		ProductReviewDTO pdto = null;
		ArrayList<ProductReviewDTO> list = null;
		
		String sql = 
				" SELECT DISTINCT(p.pd_code) pdCode,  substr(p.pd_code,9,2) color , p.category_code category_code"
				+ "					 , pd_name , pd_price "
			+ "                        , pd_memberonly , pd_mincount ,pd_feet ,  out_count "
			+ "						,pd_release	"	
			+ " FROM product p JOIN product_detail pd ON p.pd_code = pd.pd_code "
			+ "            FULL OUTER JOIN product_out o on p.pd_code = o.pd_code "
			+ " WHERE p.pd_code IN ( "
			+ "        SELECT ps.pd_code "
			+ "        FROM product_stock ps JOIN product_detail pd ON ps.pd_code = pd.pd_code ";
	
		if(searchWord == "") {
			if(cateGrpCode.equals("K")) {//아동
				sql += " WHERE ( substr(ps.pd_code,1,1) = ? ";
			}else {//성인
				sql += " WHERE ( substr(ps.pd_code,1,1) = 'U' OR substr(ps.pd_code,1,1) = ? )";
			}
		}else {
				sql += "  WHERE REGEXP_LIKE( p.pd_code , ? , 'i' ) or  REGEXP_LIKE( p.pd_name , ? , 'i' )";
		}
	
		if(sizeCode != "null") {//사이즈
			sql += 	" 			AND ps.size_code in ( " + sizeCode + " )  ";
		}else {
			sql += "";
		}

		if(feetWidth != "null") {//발볼
			sql += 	" 			AND pd_feet in ( " + feetWidth + " ) ";
		}
	
		if(colorCode!="null") {//컬러
			sql +=	" 			AND substr(ps.pd_code,9,2) in ( " + colorCode + " ) "; // 02, 20, 57
		}

		if(subCateIdx!= "null") {//카테고리들
			sql += 	" 			AND substr(ps.pd_code,2,3) in ( " + subCateIdx + " ) "; // "F01" , "F02"
		}

		if(priceRange!=null) {//가격범위
			sql += 	" 			AND ( ";
			for (int i = 0; i < priceRange.length; i++) {
				sql += 	"				pd_price >= " + priceRange[i][0] + " AND pd_price < " + priceRange[i][1];
				sql += i != priceRange.length -1 ? " OR ": ")";
			}
		}
			sql += 	" 			GROUP BY ps.pd_code ";
		if(soldOutYn != null) {//품절상품 제외
			sql +=	" 			HAVING SUM(stock_count) > 0 ";
		}
			sql += 	" ) ";
		if(sortProducts != "null") {//정렬들(가격순, 신상품순....)
			if(sortProducts.equals("Q01")) {
				sql += " ORDER BY pd_release DESC NULLS LAST ";
			}else if(sortProducts.equals("Q02")) {
				sql += " ORDER BY out_count DESC NULLS LAST ";
			}else if(sortProducts.equals("Q03")) {
				sql += " ORDER BY pd_price DESC ";
			}else if(sortProducts.equals("Q04")) {
				sql += " ORDER BY pd_price ASC ";
			}
		}
		try {
			pstmt= conn.prepareStatement(sql);
			if(searchWord == "") {
				pstmt.setString(1, cateGrpCode); // "M"
			}else {
				pstmt.setString(1, searchWord);
				pstmt.setString(2, searchWord);
			}
			rs=pstmt.executeQuery();
System.out.println("리뷰1");			
			if(rs.next()) {
				map = new LinkedHashMap<String, ArrayList<ProductReviewDTO>>();
				
				do {
					String pdCode = rs.getString("pdCode");
					
					String previewSQL = 
							" SELECT product.pd_code pd_code, count(DISTINCT(product.pd_code)) countPOfReview , avg(rev_starscore) avgReview "
						+ " FROM product join order_info on product.pd_code = order_info.pd_code "
						+ "            join order_list on order_info.ord_code = order_list.ord_code "
						+ "            join user_info on user_info.user_code = order_list.user_code "
						+ "            join review on review.user_code = user_info.user_code "
						+ " WHERE product.pd_code = ? "
						+ " GROUP BY product.pd_code ";

					pstmt2 = conn.prepareStatement(previewSQL);
					pstmt2.setString(1, pdCode);
					rs2 = pstmt2.executeQuery();
System.out.println("리뷰2");				
					if(rs2.next()) {
						list = new ArrayList<ProductReviewDTO>();
						do {
							String pd_Code = rs2.getString("pd_code");
							int countPOfReview = rs2.getInt("countPOfReview");
							int avgReview = rs2.getInt("avgReview");
							
							pdto = new ProductReviewDTO(pd_Code, countPOfReview, avgReview);				
							list.add(pdto);
							
							//System.out.println( pdCode + "///////"+ pdto.toString());
							
						}while(rs2.next());
							
						map.put(pdCode, list);					
					}//if list

				}while(rs.next());
				
				return map;
			}//if map

		} catch (Exception e) {
			System.out.println("ProductFilterAjaxDao.productReviewAjax()" + e.toString() );
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs2);
			JdbcUtil.close(pstmt2);
		}
		return null;		

	}


	
	
	
	
	


}
