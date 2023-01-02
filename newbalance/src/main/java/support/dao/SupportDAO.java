package support.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.connection.JdbcUtil;
import support.domain.FaqDTO;
import support.domain.NoticeDTO;
import support.domain.StoreDTO;

public class SupportDAO implements ISupport {

	private SupportDAO() {}
	
	private static SupportDAO supportDAO = null; // null일 때만 생성
	public static SupportDAO getInstance() {
		if(supportDAO == null) {
			supportDAO = new SupportDAO();
		}
		return supportDAO;
		
	}

	  PreparedStatement pstmt = null;
	  ResultSet rs = null;

	// 1. 공지사항 쓰기
	@Override
	public int insertNotice(Connection con, NoticeDTO notice) throws SQLException {

	      String sql = " insert into notice " + 
	            " (noti_seq, noti_title, noti_insertdate, noti_content, noti_img) "
	            + " values ( seq_noti_seq.nextval, ?, ?, ?, ? )";
	      try {
	         pstmt = con.prepareStatement(sql);
	         // ? ? ? 
	         pstmt.setString(1, notice.getNotiTitle() );
	         pstmt.setString(2,notice.getNotiInsertdate() );
	         pstmt.setString(3, notice.getNotiContent() );
	         pstmt.setString(4, notice.getNotiImg());

	         return pstmt.executeUpdate();  // 에러가 없으면 1
	      } catch (Exception e) { // 에러 발생시
	         System.out.println("> NoticeImpl.insert -" + e.toString());
	      } finally {
	         try {
	            pstmt.close();
	         }catch(Exception e) {            
	         }
	      }
	      return 0; // 
	}
	
	// 2. 총 공지사항 수
	public int getTotalNotice(Connection con) throws SQLException {
		
			int totalCount = 0;

		      String sql = "select count(*) from notice";
		      try {
		         pstmt = con.prepareStatement(sql);         
		         rs = pstmt.executeQuery();
		         rs.next();
		         totalCount =  rs.getInt(1);
		         
		      } catch (Exception e) {
		      } finally {
		         try {
		            pstmt.close();
		            rs.close();
		         }catch(Exception e) {            
		         }
		      }      
		      return totalCount;
	}
	
	// 3. 공지사항 조회수 증가
	public int updateReadCount(Connection con, int noti_seq) throws SQLException {
		  String sql = "update notice "
		            +" set noti_views = noti_views +1 "
		            +" where noti_seq = ?";
    
		      int rowCount = 0;
		      try {
		         pstmt = con.prepareStatement(sql);
		         pstmt.setInt(1, noti_seq);
		         rowCount = pstmt.executeUpdate();
		      } finally {
		         JdbcUtil.close(pstmt);
		      }
		      return rowCount;      
		
	}
	
	// 4. 공지사항 목록
				@Override
				public List<NoticeDTO> selectNoticeList(Connection con, int currentPage, int limitCount) throws SQLException {
					
					ArrayList<NoticeDTO> list = null;
					
					int begin = ( currentPage-1)*limitCount + 1;
					int end = begin + limitCount -1;
					
					String sql  = " SELECT b.* ";
					sql += " FROM (  ";
					sql += "        SELECT ROWNUM no, t.* ";
					sql += "        FROM (  ";
					sql += "                SELECT * ";
					sql += "                FROM notice ";
					sql += "                ORDER BY noti_seq ASC ";
					sql += "              ) t ";
					sql += "     ) b ";
					sql += " WHERE b.no BETWEEN ? AND ?";
					
					try {
						pstmt = con.prepareStatement(sql);
						this.pstmt.setInt(1, begin);
						this.pstmt.setInt(2, end);
						rs = pstmt.executeQuery();
						if ( rs.next() ) {
							
							list = new ArrayList<NoticeDTO>();
							NoticeDTO notice = null;
							do {
								notice = new NoticeDTO(
										rs.getInt("noti_seq")
										,rs.getString("noti_title")
										,rs.getString("noti_insertdate")
										,rs.getInt("noti_views")
										,rs.getString("noti_content")
										,rs.getString("noti_img")
										);
								
								list.add(notice);
							} while ( rs.next() );
						} // 
					} finally {
						JdbcUtil.close(pstmt);
						JdbcUtil.close(rs);         
					} // finally
					
					return list;
				}
	
	// 5. 공지사항 상세보기
	@Override
	public NoticeDTO selectOneNoti(Connection con, int noti_seq) throws SQLException {
		String  sql = " select  *  ";
		sql+= "  from notice  ";
		sql+= " where noti_seq = ? ";      
		NoticeDTO notice = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, noti_seq);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				notice = new NoticeDTO(
						rs.getInt("noti_seq")
						,rs.getString("noti_title")
						,rs.getString("noti_insertdate")
						,rs.getInt("noti_views")
						,rs.getString("noti_content")
						,rs.getString("noti_img")
						);
			}
		}  finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		
		return notice;
	}

	
	// 매장1
		@Override
		public List<StoreDTO> selectAllStore(Connection con, int currentPage, int limitCount) throws SQLException {
			ArrayList<StoreDTO> list = null;
			
			int begin = ( currentPage-1)*limitCount + 1;
			int end = begin + limitCount -1;
			
			String sql  = " SELECT b.* ";
			sql += " FROM (  ";
			sql += "        SELECT ROWNUM no, t.* ";
			sql += "        FROM (  ";
			sql += "                SELECT * ";
			sql += "                FROM store_info i JOIN store_category c ON i.storecate_seq = c.storecate_seq ";
			sql += "				JOIN store_area a ON i.storearea_seq = a.storearea_seq ";
			sql += "                ORDER BY store_seq ASC ";
			sql += "              ) t ";
			sql += "     ) b ";
			sql += " WHERE b.no BETWEEN ? AND ?";

			try {
				pstmt = con.prepareStatement(sql);
				// BETWEEN ? AND ?"
				this.pstmt.setInt(1, begin);
				this.pstmt.setInt(2, end);

				rs = pstmt.executeQuery();
			if(rs.next()) {
				
			list = new ArrayList<StoreDTO>();
			StoreDTO storedto = null;
			
			do {
				
				storedto = new StoreDTO(
						rs.getInt("store_seq")
						,rs.getInt("storecate_seq")
						,rs.getString("storecate_name")
						,rs.getInt("storearea_seq")
						,rs.getString("storearea_name")
						,rs.getString("store_name")
						,rs.getString("store_addr")
						,rs.getString("store_tel")
						,rs.getDouble("store_lat")
						,rs.getDouble("store_lng")
						
						);
				
				list.add(storedto);
				
			}while(rs.next());
				
			}
			
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);     
			
		} // finally
		
		return list;
		
		}
		
		// 매장2
		public List<StoreDTO> selectAllAll(Connection con, String searchWord, int currentPage, int limitCount, String storeArea) throws SQLException {
			

			ArrayList<StoreDTO> list = null;
			
			int begin = ( currentPage-1)*limitCount + 1;
			int end = begin + limitCount -1;
			
			String sql  = " SELECT b.* ";
			sql += " FROM (  ";
			sql += "        SELECT ROWNUM no, t.* ";
			sql += "        FROM (  ";
			sql += "                SELECT * ";
			sql += "                FROM store_info i JOIN store_category c ON i.storecate_seq = c.storecate_seq ";
			sql += "				JOIN store_area a ON i.storearea_seq = a.storearea_seq ";
		
			if( searchWord != "" && storeArea != "" ) { // 검색어o 검색지역o
			sql += " 			     WHERE i.storearea_seq = ? AND REGEXP_LIKE(store_name, ?) OR REGEXP_LIKE(store_addr, ?) ";
			}		
			
			else if ( searchWord == "" && storeArea != "" ) { // 검색어x 검색지역o
				sql += " 			 WHERE i.storearea_seq = ? ";	
			}
			
			else if ( searchWord != "" && storeArea == "" ) { // 검색어o 검색지역x
				sql += " 			 WHERE REGEXP_LIKE(store_name, ?) OR REGEXP_LIKE(store_addr, ?) ";	
			}
				
			sql += "                ORDER BY store_seq ASC ";
			sql += "              ) t ";
			sql += "     ) b ";
			sql += " WHERE b.no BETWEEN ? AND ? ";
			
			try {
				pstmt = con.prepareStatement(sql);
				
				if( searchWord != "" && storeArea != "" ) { // 검색어o 검색지역o
					pstmt.setString(1, storeArea);	
					pstmt.setString(2, searchWord);
					pstmt.setString(3, searchWord);
					pstmt.setInt(4, begin);
					pstmt.setInt(5, end);
					
				}
				if ( searchWord == "" && storeArea != "" ) { // 검색어x 검색지역o
					pstmt.setString(1, storeArea);	
					pstmt.setInt(2, begin);
					pstmt.setInt(3, end);
				}
				if ( searchWord != "" && storeArea == "" ) { // 검색어o 검색지역x
					pstmt.setString(1, searchWord);
					pstmt.setString(2, searchWord);
					pstmt.setInt(3, begin);
					pstmt.setInt(4, end);
				}
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					list = new ArrayList<StoreDTO>();
					StoreDTO storedto = null;
					
					do {
						
						storedto = new StoreDTO(
								rs.getInt("store_seq")
								,rs.getInt("storecate_seq")
								,rs.getString("storecate_name")
								,rs.getInt("storearea_seq")
								,rs.getString("storearea_name")
								,rs.getString("store_name")
								,rs.getString("store_addr")
								,rs.getString("store_tel")
								,rs.getDouble("store_lat")
								,rs.getDouble("store_lng")
								);		
						
						list.add(storedto);
						
					}while(rs.next());
					
				}
				
			} finally {
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);     
				
			} // finally
			
			return list;
			
		}
		
		// totalCounts 돌리는 함수
		public int getTotalCounts(Connection con, String searchWord, String storeArea) throws SQLException {
					
					
					int totalCount = 0;
					
					
					String sql  = " SELECT COUNT(*) ";
					sql += " FROM (  ";
					sql += "        SELECT ROWNUM no, t.* ";
					sql += "        FROM (  ";
					sql += "                SELECT * ";
					sql += "                FROM store_info i JOIN store_category c ON i.storecate_seq = c.storecate_seq ";
					sql += "				JOIN store_area a ON i.storearea_seq = a.storearea_seq ";
				
					if( searchWord != "" && storeArea != "" ) { // 검색어o 검색지역o
					sql += " 			     WHERE i.storearea_seq = ? AND REGEXP_LIKE(store_name, ?) OR REGEXP_LIKE(store_addr, ?) ";
					}		
					
					else if ( searchWord == "" && storeArea != "" ) { // 검색어x 검색지역o
						sql += " 			 WHERE i.storearea_seq = ? ";	
					}
					
					else if ( searchWord != "" && storeArea == "" ) { // 검색어o 검색지역x
						sql += " 			 WHERE REGEXP_LIKE(store_name, ?) OR REGEXP_LIKE(store_addr, ?) ";	
					}
						
					sql += "                ORDER BY store_seq ASC ";
					sql += "              ) t ";
					sql += "     ) b ";
					
					try {
						pstmt = con.prepareStatement(sql);
						
						if( searchWord != "" && storeArea != "" ) { // 검색어o 검색지역o
							pstmt.setString(1, storeArea);	
							pstmt.setString(2, searchWord);
							pstmt.setString(3, searchWord);

							
						}
						if ( searchWord == "" && storeArea != "" ) { // 검색어x 검색지역o
							pstmt.setString(1, storeArea);	

						}
						if ( searchWord != "" && storeArea == "" ) { // 검색어o 검색지역x
							pstmt.setString(1, searchWord);
							pstmt.setString(2, searchWord);

						}
						
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							
							totalCount = rs.getInt(1);	
						}
					} finally {
						JdbcUtil.close(pstmt);
						JdbcUtil.close(rs);         
					} // finally
					
					return totalCount;
					
				}

	// 전체 FAQ 목록
	public List<FaqDTO> selectFaq(Connection con, int currentPage, int limitCount) throws SQLException {
		ArrayList<FaqDTO> list = null;
		
		int begin = ( currentPage-1)*limitCount + 1;
		int end = begin + limitCount -1;
		
		String sql  = " SELECT b.* ";
		sql += " FROM (  ";
		sql += "        SELECT ROWNUM no, t.* ";
		sql += "        FROM (  ";
		sql += "                SELECT * FROM faq ";
        sql += "                order by faq_seq asc ";
		sql += "              ) t ";
		sql += "     ) b ";
		sql += " WHERE b.no BETWEEN ? AND ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, begin);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				
				list = new ArrayList<FaqDTO>();
				FaqDTO faq = null;
				do {
					faq = new FaqDTO(
							rs.getInt("faq_seq")
							, rs.getString("faq_category")
							,rs.getString("faq_question")
							,rs.getString("faq_answer")
							);

					list.add(faq);
					
				} while ( rs.next() );
			} // if
			
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} // finally
		return list;

	}


		// 전체 FAQ 검색 목록
		@Override
		public List<FaqDTO> searchFaq(Connection con, String searchWord, int currentPage, int limitCount) throws SQLException {
					ArrayList<FaqDTO> list = null;
					
					int begin = ( currentPage-1)*limitCount + 1;
					int end = begin + limitCount -1;
					
					String sql  = " SELECT b.* ";
					sql += " FROM (  ";
					sql += "        SELECT ROWNUM no, t.* ";
					sql += "        FROM (  ";
					sql += "                SELECT * FROM faq ";
			        sql += "                order by faq_seq asc ";
					sql += "              ) t ";
					sql += "     ) b ";
					sql += " WHERE REGEXP_LIKE(faq_question, ?) OR REGEXP_LIKE(faq_answer, ?)  ";
					sql += " AND b.no BETWEEN ? AND ?";
					
					try {
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, searchWord);
						pstmt.setString(2, searchWord);
						pstmt.setInt(3, begin);
						pstmt.setInt(4, end);
						
						rs = pstmt.executeQuery();
						if ( rs.next() ) {
							
							list = new ArrayList<FaqDTO>();
							FaqDTO faq = null;
							do {
								faq = new FaqDTO(
										rs.getInt("faq_seq")
										, rs.getString("faq_category")
										,rs.getString("faq_question")
										,rs.getString("faq_answer")
										);

								list.add(faq);
								
							} while ( rs.next() );
						} // if
						
					} finally {
						JdbcUtil.close(pstmt);
						JdbcUtil.close(rs);         
					} // finally
					return list;

				}

		public int getTotalCount(Connection con) throws SQLException {
			
			int totalCount = 0;
			
			String sql  = " SELECT COUNT(*) ";
			sql += " FROM (  ";
			sql += "        SELECT ROWNUM no, t.* ";
			sql += "        FROM (  ";
			sql += "                SELECT * ";
			sql += "                FROM store_info i JOIN store_category c ON i.storecate_seq = c.storecate_seq ";
			sql += "				JOIN store_area a ON i.storearea_seq = a.storearea_seq ";
			sql += "                ORDER BY store_seq ASC ";
			sql += "              ) t ";
			sql += "     ) b ";

			try {
				pstmt = con.prepareStatement(sql);
				
				// BETWEEN ? AND ?"

				rs = pstmt.executeQuery();

				if(rs.next()) {	
					totalCount = rs.getInt(1);	
				}
			} finally {
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);         
			} // finally
			
			return totalCount;
		}

		public int getTotaFAQ(Connection con) throws SQLException {
			
			int totalCount = 0;
			
			String sql  = " SELECT COUNT(*) ";
			sql += " FROM (  ";
			sql += "        SELECT ROWNUM no, t.* ";
			sql += "        FROM (  ";
			sql += "                SELECT * FROM faq ";
	        sql += "                order by faq_seq asc ";
			sql += "              ) t ";
			sql += "     ) b ";
			
			try {
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					
					totalCount = rs.getInt(1);	
				}
			} finally {
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);         
			} // finally
			
			return totalCount;
		}

		public int getTotalFAQ(Connection con, String searchWord) throws SQLException {
			
				int totalCount = 0;
			
				String sql  = " SELECT b.* ";
				sql += " FROM (  ";
				sql += "        SELECT ROWNUM no, t.* ";
				sql += "        FROM (  ";
				sql += "                SELECT * FROM faq ";
				sql += "                order by faq_seq asc ";
				sql += "              ) t ";
				sql += "     ) b ";
				sql += " WHERE REGEXP_LIKE(faq_question, ?) OR REGEXP_LIKE(faq_answer, ?)  ";
				try {
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, searchWord);
					pstmt.setString(2, searchWord);
					
					rs = pstmt.executeQuery();
					if(rs.next()) {
						
						totalCount = rs.getInt(1);	
						
					}
					} finally {
						JdbcUtil.close(pstmt);
						JdbcUtil.close(rs);         
					} // finally
					
					return totalCount;

		}


}

