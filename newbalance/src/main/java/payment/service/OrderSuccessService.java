package payment.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import payment.dao.OrderDAO;
import payment.domain.OrderDTO;

public class OrderSuccessService {
private static OrderSuccessService instance = null;
	
	private OrderSuccessService() {}
	
	public static OrderSuccessService getInstance() {
		if(instance == null) {
			instance = new OrderSuccessService();
		}
		return instance;
	}
	
	
	
	
}
