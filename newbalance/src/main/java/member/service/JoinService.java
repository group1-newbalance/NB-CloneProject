package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import member.dao.MemberDAO;
import member.domain.MemberDTO;

public class JoinService {
	private static JoinService instance = null;

	private JoinService() {
	}

	public static JoinService getInstance() {
		if (instance == null) {
			instance = new JoinService();
		}
		return instance;
	}

	// 2.
	public int insert(MemberDTO mem) throws JoinServiceException {
		System.out.println("service : " + mem.toString());
		Connection con = null;
		int memCount = 0;

		try {
			con = ConnectionProvider.getConnection();
			MemberDAO dao = MemberDAO.getInstance();

			memCount = dao.insert(con, mem);

		} catch (Exception e) {
			throw new JoinServiceException("> 가입 실패 : " + e.getMessage(), e);

		} finally {
			JdbcUtil.close(con);
		}

		return memCount;


	}
	   


		/*
		 * // 3. public int update(MemberDTO mem) throws JoinServiceException {
		 * System.out.println("service : "+mem.toString()); Connection con = null; int
		 * memCount = 0;
		 * 
		 * try { con = ConnectionProvider.getConnection(); MemberDAO dao =
		 * MemberDAO.getInstance();
		 * 
		 * memCount = dao.update(con, mem);
		 * 
		 * } catch (Exception e) { throw new JoinServiceException("> 수정 실패 : " +
		 * e.getMessage(), e);
		 * 
		 * 
		 * }finally { JdbcUtil.close(con); } return memCount; }
		 */
		/*
		 * // 2. public int delete(MyDeleteDTO del) throws JoinServiceException {
		 * System.out.println("service : "+del.toString()); Connection con = null; int
		 * delCount = 0;
		 * 
		 * try { con = ConnectionProvider.getConnection(); MemberDAO dao =
		 * MemberDAO.getInstance();
		 * 
		 * delCount = dao.delete(con, del);
		 * 
		 * } catch (Exception e) { throw new JoinServiceException("> 탈퇴 실패 : " +
		 * e.getMessage(), e);
		 * 
		 * 
		 * }finally { JdbcUtil.close(con); } return delCount; }
		 */
     
		
	
	// 2. 
	 public int delete(String userCode) throws JoinServiceException {
	 Connection con = null; 
	 
	 int delCount1 = 0;
	 int delCount2 = 0;
	  
	  try {
      con = ConnectionProvider.getConnection(); 
	  MemberDAO dao =MemberDAO.getInstance();
	  
	  con.setAutoCommit(false); 
	  
	  delCount1 = dao.deleteUpd(con, userCode);
	  delCount2 = dao.deleteIns(con, userCode);
	  System.out.println("service :찍힘? ");
		
		con.commit();
	  } catch (NamingException | SQLException e) { 
		  JdbcUtil.rollback(con);
		  throw new JoinServiceException
		  ("> 탈퇴 실패 : " + e.getMessage(), e);
		  
		 
	  
	  
	  }finally { 
		  JdbcUtil.close(con); 
		  } 
	  if(delCount1 ==1 &&  delCount2 ==1) {
		  return 1;
		  
	  }else {
		  return 0;
	  }
	 
	  
}
	
	
	public int update(MemberDTO mem) throws NamingException {
		Connection con = null;
		int rowCount = 0;
		try {
			con = ConnectionProvider.getConnection();
			MemberDAO dao = MemberDAO.getInstance();
			// update클릭해서 만들기
			rowCount = dao.update(con, mem);
			System.out.println("service : " + mem.toString());
			System.out.println(rowCount);
		} catch (Exception e) {
			throw new JoinServiceException("메시지 수정 실패 : " + e.getLocalizedMessage(), e);
		} finally {
			JdbcUtil.close(con);
		}
		return rowCount;
	}

	public int delete(MemberDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
