package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import member.service.FindIdFailException;
import member.service.LoginService;
import mvc.command.CommandHandler;

public class GetMemberIdHpHandler  implements CommandHandler {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject resultJSON = new JSONObject();
		
		
		try {
			LoginService loginService = LoginService.getInstance();
			String custName = request.getParameter("custName");
			String cellNo = request.getParameter("cellNo");
			
			String id = loginService.findId(custName, cellNo);
			System.out.println("회원 아이디 : "+id);
			
			resultJSON.put("result", "00");
			resultJSON.put("custId", id);
		} catch( FindIdFailException e) {
			resultJSON.put("result", "99");
		}
		return resultJSON.toString();
	}
	
	
}
