package payment.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import payment.domain.PayCancelDTO;
import payment.service.PayCancelService;

public class PayCancelHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		PayCancelService cancelService = PayCancelService.getInstance();
		//PayCancelDTO cancelData = null;
		List<PayCancelDTO>list = null;
		HttpSession session = request.getSession();
		
		if (session != null) {
			System.out.println(" session [not null check 이재민]");
			UserDTO member = (UserDTO) session.getAttribute("member");
			
			if(member !=null) {
				System.out.println(" member [not null]");
				//cancelData = cancelService.showPayCancel(member.getUserCode());
				list = cancelService.showPayCancel(member.getUserCode());
			}
			
		}
		if(list == null) {
			response.setStatus(HttpServletResponse. SC_NOT_FOUND);
			return null;
			
		}
		
		//request.setAttribute("cancelData", cancelData);
		request.setAttribute("list", list);
		return "/my/orderCRCList.jsp";
	}
	
	
	
	
}
