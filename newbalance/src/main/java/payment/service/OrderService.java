package payment.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import jdbc.connection.ConnectionProvider;
import jdbc.connection.JdbcUtil;
import payment.dao.OrderDAO;
import payment.dao.OrderSuccessDAO;
import payment.domain.CouponDTO;
import payment.domain.OrderDTO;
import payment.domain.PaymentInfoDTO;
import payment.domain.ShipInfoDTO;

public class OrderService {
	   private static OrderService instance = null;
	   
	   private OrderService() {}
	   public static OrderService getInstance() {
		   if (instance==null) {
			instance = new OrderService();
		}
		   return instance;
	   }
	   
	   public List<CouponDTO>showCoupon(String userCode){
		   OrderDAO coupon = OrderDAO.getInstance();
		   List<CouponDTO>list = null;
			try(Connection conn = ConnectionProvider.getConnection()) {
				list = coupon.showCoupon(conn, userCode);
			}catch (Exception e) {
				throw new RuntimeException(e);
			}
			return list;
	   }
	   
	   public int insertOrder(OrderDTO ord)throws NamingException {
			int rowCount =0;
			try(Connection conn = ConnectionProvider.getConnection()){
				OrderDAO dao = OrderDAO.getInstance();
				rowCount = dao.insertOrder(conn, ord);
				System.out.println(rowCount);
			}catch (SQLException e) {
				throw new RuntimeException(e);
			}
			return rowCount;
		}// insertOrder
	   
	   
	   public int insertShipInfo(ShipInfoDTO shipInfo)throws NamingException {
			int rowCount =0;
			try(Connection conn = ConnectionProvider.getConnection()){
				OrderDAO dao = OrderDAO.getInstance();
				rowCount = dao.insertShipInfo(conn, shipInfo);
				System.out.println(rowCount);
			}catch (SQLException e) {
				throw new RuntimeException(e);
			}
			return rowCount;
		}// insertShipInfo
	   
	   public int insertPaymentInfo(PaymentInfoDTO payInfo)throws NamingException {
			int rowCount =0;
			try(Connection conn = ConnectionProvider.getConnection()){
				OrderDAO dao = OrderDAO.getInstance();
				rowCount = dao.insertPaymentInfo(conn, payInfo);
				System.out.println(rowCount);
			}catch (SQLException e) {
				throw new RuntimeException(e);
			}
			return rowCount;
		}// insertShipInfo
	  
	   
}
// 총 결제 금액
// 회원 비회원
// 