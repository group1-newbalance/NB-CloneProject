package payment.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import member.dao.MemberDAO;
import member.domain.MemberDTO;
import member.service.JoinServiceException;
import payment.dao.OrderSuccessDAO;
import payment.domain.ShipInfoDTO;

public class ShipInfoService {
	
private static ShipInfoService instance = null;
	
	private ShipInfoService() {}
	
	public static ShipInfoService getInstance() {
		if(instance == null) {
			instance = new ShipInfoService();
		}
		return instance;
	}
	
	/*
	 * public int ship_info(ShipInfoDTO shipInfo) {
	 * 
	 * Connection conn = null; int rowCount = 0;
	 * 
	 * try { conn=ConnectionProvider.getConnection(); OrderSuccessDAO dao =
	 * OrderSuccessDAO.getInstance(); rowCount = dao.insertShipInfo(conn, shipInfo);
	 * } catch (NamingException | SQLException e) { e.printStackTrace(); }finally {
	 * JdbcUtil.close(conn); } return rowCount; }
	 */
}
