package my.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import my.domain.MyDeliveryInfoDTO;
import my.domain.MyMainDTO;

public interface IMy {

	public MyMainDTO getMyMainMenuInfo(Connection conn, String id) throws SQLException;
	public List<MyDeliveryInfoDTO> getMemberDeliveryInfo(Connection conn, String id) throws SQLException;
	
}
