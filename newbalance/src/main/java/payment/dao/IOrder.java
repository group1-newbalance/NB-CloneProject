package payment.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import payment.domain.CouponDTO;
import payment.domain.OrderDTO;
import payment.domain.OrderInfoDTO;
import payment.domain.PaymentInfoDTO;
import payment.domain.ShipInfoDTO;

public interface IOrder {
	
	// 회원의 결제정보
	//ArrayList<OrderDTO>orderInfoUpadte()throws SQLException;
	
	
	
	List<CouponDTO>showCoupon(Connection conn, String userCode) throws SQLException;
	
	// 결제성공?
	
	// 1.order_list insert
	public int insertOrder(Connection conn , OrderDTO ord) throws SQLException;
	// 2.order_info insert
	public int insertOrderInfo(Connection conn , OrderInfoDTO ordInfo) throws SQLException;
	// 3.ship_info insert
	public int insertShipInfo(Connection conn , ShipInfoDTO shipInfo) throws SQLException;
	// 4.payment_info insert
	public int insertPaymentInfo(Connection conn , PaymentInfoDTO payInfo) throws SQLException;
	
	
	
	// 5.마일리지 seq 가 존재한다면? 마일리지 사용내역 insert
	
	// 6.쿠폰 seq 가 존재한다면? 사용쿠폰 delete
	
	// 7.둘 다 사용하지 않았다면? 마일리지내역에 적립금 insert
	
	// 8.회원등급정보 update
	// 구매한 회원정보에서 구매금액 update , 
	
	// 9.재고테이블 - 1 update
	// 받은 상품정보 for 문돌아서 update table ...
}
