package manager.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import member.domain.MemberDTO;

public interface IManager {
	
	public MemberDTO selectMember(Connection conn, String id) throws SQLException;

	List<MemberDTO> selectList(Connection con, int firstRow, int endRow) throws SQLException;

	int selectCount(Connection con) throws SQLException;
}
