package my.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import my.domain.MyDeliveryInfoDTO;
import my.domain.MyMainDTO;

public interface IMy {

	public MyMainDTO getMyMainMenuInfo(Connection conn, String id) throws SQLException;
	public List<MyDeliveryInfoDTO> getMemberDeliveryInfo(Connection conn, String id) throws SQLException;
	public void updateMaDefault(Connection conn, String userCode) throws SQLException;
	public int insertMemberDeliveryInfo(Connection conn, MyDeliveryInfoDTO dto) throws SQLException;
	public boolean checkDuplicateDeliveryInfo(Connection conn, MyDeliveryInfoDTO dto ) throws SQLException;
	public int updateMemberDeliveryInfo(Connection conn, MyDeliveryInfoDTO dto) throws SQLException;
	public int deleteMemberDeliveryInfo(Connection conn, int maSeq) throws SQLException;
	
}
