package payment.command;

import java.io.IOException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.MemberDTO;
import member.domain.UserDTO;
import mvc.command.CommandHandler;
import payment.domain.OrderDTO;
import payment.domain.PaymentInfoDTO;
import payment.domain.ShipInfoDTO;
import payment.service.OrderService;
import payment.service.OrderSuccessService;
import payment.service.SelectMemberByUserCodeService;


public class OrderSuccessHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("결제완료 프로세스 호출됨.");
		String rqGetPost = request.getMethod();
		
		if(rqGetPost.equalsIgnoreCase("GET")) {
			return processOrderGET(request, response);
		} else if (rqGetPost.equalsIgnoreCase("POST")) {
			return processOrderPOST(request, response);
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	
	
	}

	private String processOrderGET(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 값을 받아올 OrderPage
		SelectMemberByUserCodeService selectMemberByUserCodeService = SelectMemberByUserCodeService.getInstance();
		OrderService orderService = OrderService.getInstance();
		MemberDTO memDto = null;
		OrderDTO ordDto = null;
		  HttpSession session = request.getSession(false);
	      if(session != null) {
	         UserDTO member = (UserDTO) session.getAttribute("member");
	         if(member != null) {
	        	request.setAttribute("memDto", memDto);
	        	request.setAttribute("ordDto", ordDto);
	        	 
	         }
	      }
		return "/payment/order_success.jsp";
	}

	private String processOrderPOST(HttpServletRequest request, HttpServletResponse response) throws NamingException, IOException {
		
		
		
		
		return null;
		
	}

}
