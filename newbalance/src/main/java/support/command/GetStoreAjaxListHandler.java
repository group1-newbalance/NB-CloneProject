package support.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import mvc.command.CommandHandler;
import net.sf.json.JSONArray;
import support.domain.StoreDTO;
import support.service.SupportService;

public class GetStoreAjaxListHandler implements CommandHandler{
	
	
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		System.out.println(">GetStoreAjaxListHandler.process() 호출됨..");
		
		SupportService service= SupportService.getInstance();
		
		String searchWord = ( request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord") );
		String storetype =( request.getParameter("storetype") == null ? "" : request.getParameter("storetype") );
		String storeArea =( request.getParameter("storeArea") == null ? "": request.getParameter("storeArea") );
		
		
		int currentPage =  ( request.getParameter("currentPage") == null ? 1 : Integer.parseInt(request.getParameter("currentPage")) );  // 현재 페이지. 
		int limitCount =  ( request.getParameter("limitCount") == null ? 20: Integer.parseInt(request.getParameter("limitCount")) );  // 현재 페이지. 
		int totalCount = 0;
		
		System.out.println("searchWord = " + searchWord + ", storetype = " + storetype + ", storeArea = " + storeArea);
		
		List<StoreDTO> list = null;
		

		if( searchWord == "" && storeArea == "") { 
			list = service.selectlist(currentPage, limitCount);		
			totalCount = service.getTotal();
		} else {
			list = service.searchlist(searchWord, currentPage, limitCount, storeArea);				
			totalCount = service.getTotals(searchWord, storeArea);
		}
		
		System.out.println(list.toString());
			 
		request.setAttribute("list", list);
		
		
	
		JSONArray jsonObject = JSONArray.fromObject(list); 
		System.out.println(jsonObject.toString());
		return jsonObject.toString();
		
		

		
		}
}
