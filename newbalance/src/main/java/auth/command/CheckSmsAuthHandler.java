package auth.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import auth.service.SmsAuthService;
import mvc.command.CommandHandler;

public class CheckSmsAuthHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SmsAuthService smsAuthService = SmsAuthService.getInstance();
		String sendAuthCode = request.getParameter("sendAuthCode");
		String inputAuthCode = request.getParameter("inputAuthCode");
		
		return smsAuthService.checkSMS(sendAuthCode, inputAuthCode);
	}

	
}
