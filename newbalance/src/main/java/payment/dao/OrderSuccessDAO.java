package payment.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jdbc.connection.JdbcUtil;
import payment.domain.OrderDTO;
import payment.domain.OrderInfoDTO;
import payment.domain.PaymentInfoDTO;
import payment.domain.ShipInfoDTO;

public class OrderSuccessDAO implements IOrderSuccess {
	private static OrderSuccessDAO orderSuccessDAO = null;

	public static OrderSuccessDAO getInstance() {
		if (orderSuccessDAO == null) {
			orderSuccessDAO = new OrderSuccessDAO();
		}
		return orderSuccessDAO;
	}
	
	

}
