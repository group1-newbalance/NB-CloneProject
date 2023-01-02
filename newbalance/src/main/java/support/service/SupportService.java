package support.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import support.dao.SupportDAO;
import support.domain.FaqDTO;
import support.domain.NoticeDTO;
import support.domain.PageBlock;
import support.domain.StoreDTO;

public class SupportService {

	private SupportService() {}
	
	private static SupportService instance = new SupportService();
	
	public static SupportService getInstance() {   
		if(   instance == null  ) {
			instance = new SupportService();
		}
		return instance;
	}
	
	
	private List<NoticeDTO> noticeList; // 공지사항 목록을 저장할 ArrayList<> list

	public List<NoticeDTO> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(List<NoticeDTO> noticeList) {
		this.noticeList = noticeList;
	}
	
	
	// 공지사항 상세보기
	public NoticeDTO selectOne(int noti_seq){ 
    
    Connection con = null;
    try {
       con = ConnectionProvider.getConnection();
       SupportDAO dao = SupportDAO.getInstance();
       // 1 + 2  트랜잭션 처리 또는 로그 서비스
       con.setAutoCommit(false);         
                // 1. 조회수 증가
                dao.updateReadCount(con, noti_seq);
                // 2. 해당 게시글 정보
                NoticeDTO notice = null;
                notice = dao.selectOneNoti(con, noti_seq);
       con.commit();         
       return notice;
    } catch (NamingException | SQLException e) { 
       JdbcUtil.rollback(con);         
       throw new RuntimeException(e);
    } finally {
       JdbcUtil.close(con);
    }
 }
	// 공지사항 쓰기
	public int write(NoticeDTO notice) { 
	    Connection con = null;
	    int rowCount = 0;
	
	    try {
	       con = ConnectionProvider.getConnection();
	       SupportDAO dao = SupportDAO.getInstance();
	
	       rowCount = dao.insertNotice(con, notice);
	
	    } catch (Exception e) { 
	       throw new ServiceException("> 메시지 등록 실패 : " + e.getMessage(), e);
	    } finally {
	       try {
	          con.close();
	       } catch (SQLException e) { 
	          e.printStackTrace();
	       }
	    }
	    return rowCount;
	 }

	
	// 공지사항 목록 
	public List<NoticeDTO> select(int currentPage, int limitCount) { 
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			SupportDAO dao = SupportDAO.getInstance();
			List<NoticeDTO> list = null;
			list = dao.selectNoticeList(con, currentPage, limitCount);
			
			return list;
			
		} catch (NamingException | SQLException e) { 
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

	// (1) 전체 매장 목록 list (검색X)
	public List<StoreDTO> selectlist(int currentPage, int limitCount) {
		
		Connection con =null;
		
		try {
			con  = ConnectionProvider.getConnection();
			SupportDAO dao = SupportDAO.getInstance();
			
			List<StoreDTO> list = null;
			list = dao.selectAllStore(con, currentPage, limitCount);
			
			return list;
			
		} catch (NamingException | SQLException e) { 
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	// 다 갖고 분기할거
	public List<StoreDTO> searchlist(String searchWord, int currentPage, int limitCount, String storeArea) {
		Connection con =null;
		
		try {
			con  = ConnectionProvider.getConnection();
			SupportDAO dao = SupportDAO.getInstance();
			
			List<StoreDTO> list = null;
			list = dao.selectAllAll(con, searchWord, currentPage, limitCount, storeArea);
			
			return list;
			
		} catch (NamingException | SQLException e) { 
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}

}

	// 전체 FAQ 목록
	public List<FaqDTO> selectfaq(int currentPage, int limitCount) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			SupportDAO dao = SupportDAO.getInstance();
			List<FaqDTO> list = null;
			list = dao.selectFaq(con, currentPage, limitCount);
			
			return list;
			
		} catch (NamingException | SQLException e) { 
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	
	// 전체 FAQ 목록 검색어 O
	public List<FaqDTO> searchfaq(String searchWord, int currentPage, int limitCount) {
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			SupportDAO dao = SupportDAO.getInstance();
			List<FaqDTO> list = null;
			list = dao.searchFaq(con, searchWord, currentPage, limitCount);
			
			return list;
			
		} catch (NamingException | SQLException e) { 
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	// 카운트
	public int getTotals(String searchWord, String storeArea) {
		
		Connection con =null;
		
		try {
			con  = ConnectionProvider.getConnection();
			SupportDAO dao = SupportDAO.getInstance();
			
			int totalCount = dao.getTotalCounts(con, searchWord, storeArea);
			
			return totalCount;
			
		} catch (NamingException | SQLException e) { 
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

	public int getTotal() {
		Connection con =null;
		
		try {
			con  = ConnectionProvider.getConnection();
			SupportDAO dao = SupportDAO.getInstance();
			
			int totalCount = dao.getTotalCount(con);
			
			return totalCount;
			
		} catch (NamingException | SQLException e) { 
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

	public int getTotalNotice() {
		Connection con =null;
		
		try {
			con  = ConnectionProvider.getConnection();
			SupportDAO dao = SupportDAO.getInstance();
			
			int totalCount = dao.getTotalNotice(con);
			
			return totalCount;
			
		} catch (NamingException | SQLException e) { 
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

	public int getTotaFAQ() {
		Connection con =null;
		
		try {
			con  = ConnectionProvider.getConnection();
			SupportDAO dao = SupportDAO.getInstance();
			
			int totalCount = dao.getTotaFAQ(con);
			
			return totalCount;
			
		} catch (NamingException | SQLException e) { 
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

	public int getTotalsFAQ(String searchWord) {
		Connection con =null;
		
		try {
			con  = ConnectionProvider.getConnection();
			SupportDAO dao = SupportDAO.getInstance();
			
			int totalCount = dao.getTotalFAQ(con, searchWord);
			
			return totalCount;
			
		} catch (NamingException | SQLException e) { 
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
	



	
}
