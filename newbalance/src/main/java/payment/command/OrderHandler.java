package payment.command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.MemberDTO;
import member.domain.UserDTO;
import mvc.command.CommandHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import payment.domain.CouponDTO;
import payment.domain.OrderDTO;
import payment.domain.PaymentInfoDTO;
import payment.domain.ShipInfoDTO;
import payment.service.OrderService;
import payment.service.SelectMemberByUserCodeService;

public class OrderHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("order 프로세스 호출됨.");
		String rqGetPost = request.getMethod();
		  
		 	
			if(rqGetPost.equalsIgnoreCase("GET")) {
				return processGet(request, response);
			} else if (rqGetPost.equalsIgnoreCase("POST")) {
				return processPost(request, response);
			} else {
				response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
				return null;
			}
		
		  
		//return ORDER_SUCCESS;
	}// process
	private String processPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		OrderService orderService = OrderService.getInstance();
		
		 String ordCode = request.getParameter("ordCode");
		 int ordAmount = Integer.parseInt(request.getParameter("ordAmount"));
		 int ordDiscount =Integer.parseInt(request.getParameter("ordDiscount"));
		 String userPhone = request.getParameter("userPhone");
		 String ordName = request.getParameter("ordName");
		 String userEmail = request.getParameter("userEmail");
		 String ordDate = request.getParameter("ordDate");
		 int ordZipcode = Integer.parseInt(request.getParameter("ordZipcode")); 
		 String ordAddress = request.getParameter("ordAddress");
		 
		 String userCode = request.getParameter("userCode");
		 
		 String usercpSeq = request.getParameter("usercpSeq");
		 int intUsercpSeq ;
		 if( !(usercpSeq==null)) {
			 intUsercpSeq = -1;
		 }else {
			intUsercpSeq = Integer.parseInt(request.getParameter("usercpSeq")); 
		 }
		
		 String Mi_seq = request.getParameter("mi_seq");
		 int intMi_seq;
		 if (!(Mi_seq==null)) {
			intMi_seq = -1;
		}else {
			intMi_seq= Integer.parseInt(request.getParameter("mi_seq"));
		}
		 
		 
		 // 배송지 정보 추가
		 // ordCode
		 String shipName = request.getParameter("shipName");
		 String shipPhone = request.getParameter("shipPhone1");
		 int shipZipCode = Integer.parseInt(request.getParameter("shipZipCode"));
		 String shipPhone2 = request.getParameter("shipPhone2");
		 String shipRequest = request.getParameter("shipRequest");
		 String shipAddress = request.getParameter("shipAddress");
		 //userCode
		 
		// 주문내역 DTO 저장
		OrderDTO ord = new OrderDTO();
		ord.setOrdCode(ordCode);
		ord.setOrdAmount(ordAmount);
		ord.setOrdDiscount(ordDiscount);
		ord.setUserPhone(userPhone);
		ord.setOrdName(ordName);
		ord.setUserEmail(userEmail);
		ord.setOrdDate(ordDate);
		ord.setOrdZipcode(ordZipcode);
		ord.setOrdAddress(ordAddress);
				 
		ord.setUserCode(userCode);
		ord.setUsercpSeq(intUsercpSeq);
		ord.setMi_seq(intMi_seq);
				 
				
		System.out.println("오더핸들러"+ord.toString());
		orderService.insertOrder(ord);
		
		
		
		
		
		// 주문상세(List)
		
		
		
		
		
		
		String payType = request.getParameter("payType");
		int ordDisCount = Integer.parseInt(request.getParameter("ordDisCount"));
		
		String payName = request.getParameter("payName");
		String payStatus = request.getParameter("payStatus");
		
		
		
		
		
		
		 String cardSeq = request.getParameter("cardSeq");
		 int intCardSeq ;
		 if( !(cardSeq==null)) {
			 intCardSeq = -1;
		 }else {
			 intCardSeq = Integer.parseInt(request.getParameter("intCardSeq")); 
		 }
		
		 String bankSeq = request.getParameter("bankSeq");
		 int intBankSeq;
		 if (!(bankSeq==null)) {
			 intBankSeq = -1;
		}else {
			intBankSeq= Integer.parseInt(request.getParameter("bankSeq"));
		}
		
		String imgUrl = request.getParameter("imgUrl");
		String pdName = request.getParameter("pdName");
		
		PaymentInfoDTO payment = new PaymentInfoDTO();
		//결제정보
		
		
		payment.setUserCode(userCode);
		payment.setPayType(payType);
		payment.setOrdDisCount(ordDisCount);
		payment.setOrdAmount(ordAmount);
		payment.setPayName(payName);
		
		payment.setPayStatus(payStatus);
		payment.setOrdCode(ordCode);
		payment.setCardSeq(intCardSeq);
		payment.setBankSeq(intBankSeq);
		payment.setImgUrl(imgUrl);
		payment.setPdName(pdName);
		
		System.out.println("오더핸들러"+payment.toString());
		orderService.insertPaymentInfo(payment);
		
		
		
		
		
		
		 // 배송지정보 저장
		ShipInfoDTO ship = new ShipInfoDTO();
		ship.setOrdCode(ordCode);
		ship.setShipName(shipName);
		ship.setShipPhone(shipPhone);
		ship.setShipZipCode(shipZipCode);
		ship.setShipPhone2(shipPhone2);
		ship.setShipRequest(shipRequest);
		ship.setShipAddress(shipAddress);
		ship.setUserCode(userCode);
		orderService.insertShipInfo(ship);
		
		System.out.println("배송지저장"+ship.toString());
		
		
		 
		//String location = "/newbalance/payment/order_success.action";
		
		//System.out.println("오더핸들러2"+ord.toString());
		
		
		
		request.setAttribute("payment", payment);
		request.setAttribute("ship", ship);
		request.setAttribute("ord", ord);
		
		return "/newbalance/payment/order_success.action";
	
	}
	
	
	private String processGet(HttpServletRequest request, HttpServletResponse response) throws NamingException {
		SelectMemberByUserCodeService selectMemberByUserCodeService = SelectMemberByUserCodeService.getInstance();
		//OrderService orderService = OrderService.getInstance();
		MemberDTO memDto = null;
		//List<CouponDTO> ordDto = null;
		  HttpSession session = request.getSession(false);
	      if(session != null) {
	         UserDTO member = (UserDTO) session.getAttribute("member");
	         if(member != null) {
	        	memDto = selectMemberByUserCodeService.selectMemberByUserCode(member.getUserCode());
	        	request.setAttribute("memDto", memDto);
	        	//ordDto = orderService.showCoupon(member.getUserCode());
	        	//request.setAttribute("ordDto", ordDto);
	        	 
	         }
	      }
			/*
			 * SelectMemberByIdService selectMemberService =
			 * SelectMemberByIdService.getInstance();
			 * 
			 * MemberDTO memDto = null;
			 * 
			 * HttpSession session = request.getSession(false); if(session != null) {
			 * UserDTO member = (UserDTO) session.getAttribute("member"); if(member != null)
			 * { memDto = selectMemberService.selectMemberById(member.getId());
			 * request.setAttribute("memDto", memDto); } }
			 */
		//return "/payment/order_success.jsp";
		
		
	return "/payment/order.jsp";
	}
}
