package auth.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import auth.service.SmsAuthService;
import mvc.command.CommandHandler;

public class SendSmsAuthHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SmsAuthService smsAuthService = SmsAuthService.getInstance();
		String receiveNumber = request.getParameter("receiveNumber");
		
		return smsAuthService.sendSMS(receiveNumber, "");
	}

	
}
