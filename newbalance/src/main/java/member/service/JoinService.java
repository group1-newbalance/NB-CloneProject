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
	
	private JoinService() {}
	
	public static JoinService getInstance() {
		if(instance == null) {
			instance = new JoinService();
		}
		return instance;
	}
	
	// 2. 
	   public int insert(MemberDTO mem) throws JoinServiceException {
		   System.out.println("service : "+mem.toString());
	      Connection con = null;
	      int memCount = 0;

	      try {
	         con = ConnectionProvider.getConnection();
	         MemberDAO dao = MemberDAO.getInstance();

	         memCount = dao.insert(con, mem);

	      } catch (Exception e) { 
	         throw new JoinServiceException("> 가입 실패 : " + e.getMessage(), e);
	         
	       
	      }finally {
				JdbcUtil.close(con);
			}
			return memCount;
		}
	
	   
	   

	}