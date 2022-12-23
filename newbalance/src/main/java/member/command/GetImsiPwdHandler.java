package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import auth.service.SmsAuthService;
import member.service.LoginService;
import member.service.UpdatePwdFailException;
import mvc.command.CommandHandler;

public class GetImsiPwdHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject resultJSON = new JSONObject();
		
		
		try {
			LoginService loginService = LoginService.getInstance();
			String custId = request.getParameter("custId");
			String cellNo = request.getParameter("cellNo").replaceAll("-", "");

			
			//임시비밀번호 발급 및 업데이트
			String imsiPwd = loginService.setImsiPwd(custId);
			
			
			//문자로 임시비밀번호 전송
			SmsAuthService smsAuthService = SmsAuthService.getInstance();
			
			return smsAuthService.sendSMS(cellNo, imsiPwd);
			
		} catch( UpdatePwdFailException e) {
			resultJSON.put("result", "99");
		}
		return resultJSON.toString();
		
	}

	
}
