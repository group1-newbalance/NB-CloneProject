package member.dao;

import java.sql.Connection;
import java.sql.SQLException;

import member.service.User;

public interface IMember {
	
	User selectById(Connection conn, String id)  throws SQLException;
}
