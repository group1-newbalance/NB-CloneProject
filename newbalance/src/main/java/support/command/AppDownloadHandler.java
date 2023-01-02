package support.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class AppDownloadHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("> AppDownloadHandler 호출 ! ");
		
		
		return "/support/appDown.jsp";
	}

}
