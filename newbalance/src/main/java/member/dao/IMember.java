package member.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import manager.service.MemberView;
import member.domain.CartOptionDTO;
import member.domain.CartProductDTO;
import member.domain.MemberDTO;
import my.domain.MyDeleteDTO;

public interface IMember {
	
	MemberDTO selectMemberById(Connection conn, String id)  throws SQLException;

	public int updateLastLoginDate(Connection conn, String userCode) throws SQLException;
	
	String selectIdtByHp(Connection conn, String custName, String cellNo) throws SQLException;
	
	public int updatePwdById(Connection conn, String custId, String pwd) throws SQLException;
	
	public int getCartCount(Connection conn, String userCode) throws SQLException;

	public int insert(Connection conn , MemberDTO mem) throws SQLException;

	public int update(Connection con, MemberDTO mem) throws SQLException;
	
	public int updateCartQty(Connection conn, int cartNum, int cartCount, String userCode) throws SQLException;

	public List<CartOptionDTO> getCartOption(Connection conn, String pdCode) throws SQLException;
	
	public int deleteCartProduct(Connection conn, String userCode, String[] delCartList)  throws SQLException;
	
	public boolean isDuplicateOption(Connection conn, String userCode, String pdCode, int sizeCode) throws SQLException;

	public List<CartProductDTO> getCartList(Connection conn, String userCode) throws SQLException;
	
	public int updateCartOption(Connection conn, int cartNum, String pdCode, int sizeCode, String color) throws SQLException;
	public  MemberView getMemberList( int pageNumber ) ;


	

	
	
	

	int deleteUpd(Connection conn, String userCode) throws SQLException;

	int deleteIns(Connection conn, String userCode) throws SQLException;
}
