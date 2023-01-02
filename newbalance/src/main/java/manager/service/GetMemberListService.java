package manager.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import manager.dao.ManagerDAO;
import manager.service.MemberView;
import member.dao.MemberDAO;
import member.domain.MemberDTO;



// 싱글톤
public class GetMemberListService {
   
    private static GetMemberListService  instance = null;
   
   private GetMemberListService() {}
   
   public static GetMemberListService getInstance() {
      if(   instance == null ) {
         instance = new GetMemberListService();
      }
      return instance;
   }

   // 한 페이지에 출력할 방명록 수 
   private static final int MESSAGE_COUNT_PER_PAGE = 3;
   
   // MemberView [방명록 목록 + 페이징 처리] 반환하는 메서드
   public  MemberView getMemberList( int pageNumber ) {
      
      Connection conn = null;      
      int currentPageNumber = pageNumber;

      try {          
         // DBCP   conn
         conn = ConnectionProvider.getConnection();          
         // DAO
 ManagerDAO memberDao = ManagerDAO.getInstance();

         // 총 방명록 수
         int memberTotalCount = memberDao.selectCount(conn);

         List<MemberDTO> memberList = null;

         int firstRow = 0;
         int endRow = 0;

         if ( memberTotalCount > 0 ) {
            firstRow =   (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
            endRow   = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
            //      dao.selectList()     해당 페이지의 방명록을 select
            memberList  =         memberDao.selectList(conn, firstRow, endRow);
         } else {
            currentPageNumber = 0;
            memberList  = Collections.emptyList();  // 
         }


         return new MemberView(
               memberList,
               memberTotalCount
               , currentPageNumber,
               MESSAGE_COUNT_PER_PAGE
               , firstRow, endRow);

      } catch (SQLException | NamingException e) {
    	  System.out.println("서비스getMember에러"  + e.toString());
      } finally {
         try {
            conn.close();  // 커넥션 풀 반환
         } catch (SQLException e) {
            e.printStackTrace();
         }  
      }
	return null;
      
   } // getMessageList

   public MemberDTO getMember(String user_code) {
      Connection  conn = null; 
      try {
         conn = ConnectionProvider.getConnection();
         ManagerDAO managerDao = ManagerDAO.getInstance();      
         
         return  managerDao.select(conn, user_code); // DI
         
      } catch (Exception e) {
        System.out.println("서비스스getMember에러"  + e.toString());
      }finally {
         JdbcUtil.close(conn);
      }
	return null;
   }
   
} // class