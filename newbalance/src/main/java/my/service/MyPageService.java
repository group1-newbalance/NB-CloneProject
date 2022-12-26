package my.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import my.dao.MyDAO;
import my.domain.MyMainDTO;



public class MyPageService {
private static MyPageService instance = null;
	
	private MyPageService() {}
	
	public static MyPageService getInstance() {
		if(instance == null) {
			instance = new MyPageService();
		}
		return instance;
	}
	
	public MyMainDTO getMyMainMenuInfo(String userCode) throws NamingException {
		MyMainDTO myData;
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MyDAO myDao = MyDAO.getInstance();
			myData = myDao.getMyMainMenuInfo(conn, userCode);
		
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return myData;
		
	}
}
