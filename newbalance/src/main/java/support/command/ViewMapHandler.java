package support.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;


public class ViewMapHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(">GetMapHandler.process() 호출됨..");
		
		System.out.println(request.getParameter("lat"));
		System.out.println(request.getParameter("lng"));
		System.out.println(request.getParameter("name"));

		return "/support/storeMap.jsp";

		
	}
	
}
	
	
