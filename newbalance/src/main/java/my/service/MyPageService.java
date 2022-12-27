package my.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import my.dao.MyDAO;
import my.domain.MyDeliveryInfoDTO;
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
	
	public Map<String, Object> getMemberDeliveryInfo(String userCode) throws NamingException{
		Map<String, Object> myData = new HashMap<>();
		try ( Connection conn = ConnectionProvider.getConnection()) {
			MyDAO myDao = MyDAO.getInstance();
			List<MyDeliveryInfoDTO> deliveryInfoList = myDao.getMemberDeliveryInfo(conn, userCode);
			
			myData.put("delCount", deliveryInfoList.size());
			myData.put("myData", deliveryInfoList);

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return myData;
	}
}
