package member.dao;

import java.sql.Connection;
import java.sql.SQLException;

import member.domain.MemberDTO;

public interface IMember {
	
	MemberDTO selectMemberById(Connection conn, String id)  throws SQLException;

	public int updateLastLoginDate(Connection conn, String userCode) throws SQLException;
	
	String selectIdtByHp(Connection conn, String custName, String cellNo) throws SQLException;
	
	public int updatePwdById(Connection conn, String custId, String pwd) throws SQLException;
	
	public int getCartCount(Connection conn, String userCode) throws SQLException;
}
