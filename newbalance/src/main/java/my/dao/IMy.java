package my.dao;

import java.sql.Connection;
import java.sql.SQLException;

import my.domain.MyMainDTO;

public interface IMy {

	public MyMainDTO getMyMainMenuInfo(Connection conn, String id) throws SQLException;
	
}
