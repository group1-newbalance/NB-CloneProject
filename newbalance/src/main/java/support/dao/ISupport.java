package support.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import support.domain.FaqDTO;
import support.domain.NoticeDTO;
import support.domain.StoreDTO;

public interface ISupport {
	
	// 1. 공지사항 쓰기 O
	int insertNotice( Connection con, NoticeDTO notice) throws SQLException;

	// 2. 총 공지사항 게시글 수를 반환하는 메서드
	int getTotalNotice(Connection con)  throws SQLException;
	
	// 3. 공지사항 조회수 증가
	int updateReadCount(Connection con, int noti_seq) throws SQLException;
	
	// 4. 공지사항 목록
	List<NoticeDTO> selectNoticeList(Connection con, int currentPage, int limitCount) throws SQLException;
	
	// 5. 공지사항 상세보기 O
	NoticeDTO selectOneNoti( Connection con, int noti_seq) throws SQLException;
	
	// 8. 전체 FAQ 목록 O
	List<FaqDTO> selectFaq(Connection con, int currentPage, int limitCount) throws SQLException;
	
	// 8. 전체 FAQ 목록 O 검색어 O
	List<FaqDTO> searchFaq(Connection con, String searchWord, int currentPage, int limitCount) throws SQLException;
	

	
	
	
	// (1) 전체 매장 목록 list (검색X)
	List<StoreDTO> selectAllStore(Connection con, int currentPage, int numberPerPage) throws SQLException;

	// (4) 전체 매장 목록 list (검색어O 검색지역O)
	List<StoreDTO> selectAllAll(Connection con, String searchWord, int currentPage, int limitCount, String storeArea) throws SQLException;






}
