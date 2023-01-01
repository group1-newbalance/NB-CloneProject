package payment.command;

import java.io.IOException;
import java.util.List;

import javax.naming.NamingException;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.MemberDTO;
import member.domain.UserDTO;
import mvc.command.CommandHandler;
import payment.domain.CouponDTO;
import payment.domain.OrderDTO;
import payment.domain.PaymentInfoDTO;
import payment.domain.ShipInfoDTO;
import payment.service.OrderService;
import payment.service.SelectMemberByUserCodeService;
import payment.service.ShipInfoService;

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
		// success 전달정보
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
		
		int cardSeq = Integer.parseInt(request.getParameter("cardSeq"));
		int bankSeq =Integer.parseInt( request.getParameter("bankSeq"));
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
		payment.setCardSeq(cardSeq);
		payment.setBankSeq(bankSeq);
		payment.setImgUrl(imgUrl);
		payment.setPdName(pdName);
		
		
		orderService.insertPaymentInfo(payment);
		
		
		 /* 
		  	private int payCode; // seq
		  	
			private String userCode;
			private String payType;
			private int ordDisCount;
			private int ordAmount;
			private String payName;
			
			private String payDate;//SYSDATE
			
			private String payStatus;
	
			private String ordCode;
			private int cardSeq;
			private int bankSeq;
			private String imgUrl;
			private String pdName;
		  
		 
		 */
		
		
		
		
		
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
		
		
		 
		String location = "/newbalance/payment/order_success.action";
		
		//System.out.println("오더핸들러2"+ord.toString());
		
		
		
		request.setAttribute("payment", payment);
		request.setAttribute("ship", ship);
		request.setAttribute("ord", ord);
		// 포워딩으로 수정해야함
		response.sendRedirect(location);
		return null;
	}
	
	// 데이터
	private String processGet(HttpServletRequest request, HttpServletResponse response) {
		  SelectMemberByUserCodeService selectMemberService = SelectMemberByUserCodeService.getInstance();
	      OrderService showCouponService = OrderService.getInstance();
	      List<CouponDTO>list = null;
		  MemberDTO memDto = null;
	      
	      HttpSession session = request.getSession(false);
	      if(session != null) {
	         UserDTO member = (UserDTO) session.getAttribute("member");
	         if(member != null) {
	        	
	            memDto = selectMemberService.selectMemberByUserCode(member.getUserCode());
	            list = showCouponService.showCoupon(member.getUserCode());
	            System.out.println(memDto.toString());
	            request.setAttribute("memDto", memDto);
	            
	            request.setAttribute("list", list);
	       }
	    }  
	return "/payment/order.jsp";
	}
	
}
