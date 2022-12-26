package member.service;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import member.dao.MemberDAO;
import member.domain.MemberDTO;
import member.domain.UserDTO;

public class LoginService {
	private static LoginService instance = null;
	
	private LoginService() {}
	
	public static LoginService getInstance() {
		if(instance == null) {
			instance = new LoginService();
		}
		return instance;
	}
	
	public UserDTO login(String id, String password) throws NamingException  {
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MemberDAO memberDao = MemberDAO.getInstance();
			
			MemberDTO member = memberDao.selectMemberById(conn, id);
			if ( member == null) {
				throw new LoginFailException();
			}
			if ( !member.matchPassword(password)) {
				throw new LoginFailException();
			}
			int rowCount = memberDao.updateLastLoginDate(conn, member.getUserCode());
			if(rowCount < 1) {
				throw new UpdateLastLoginDateException();
			}
			
			return new UserDTO(member.getUserId(),member.getUserCode());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public String findId(String custName, String cellNo) throws NamingException {
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MemberDAO memberDao = MemberDAO.getInstance();
			String id = memberDao.selectIdtByHp(conn, custName, cellNo);
			if ( id == null) {
				throw new FindIdFailException();
			}
			return id;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public String setImsiPwd(String custId) throws NamingException {
		int rowCount = 0;
		String imsiPwd = getRandomPassword(10);
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MemberDAO memberDao = MemberDAO.getInstance();
			rowCount = memberDao.updatePwdById(conn, custId, imsiPwd);
		
			if(rowCount == 0) {
				throw new UpdatePwdFailException();
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return imsiPwd;
	}

	//임시 비밀번호 생성
	public String getRandomPassword(int size) {
        char[] charSet = new char[] {
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                '!', '@', '#', '$', '%', '^', '&' };

        StringBuffer sb = new StringBuffer();
        SecureRandom sr = new SecureRandom();
        sr.setSeed(new Date().getTime());

        int idx = 0;
        int len = charSet.length;
        for (int i=0; i<size; i++) {
            idx = sr.nextInt(len);  
            sb.append(charSet[idx]);
        }
		return sb.toString();
	}
}
