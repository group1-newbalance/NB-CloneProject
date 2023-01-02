package support.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import support.domain.StoreDTO;
import support.service.SupportService;

public class GetStoreListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(">GetStoreListHandler.process() 호출됨..");
		
		SupportService service= SupportService.getInstance();
		
		String searchWord = ( request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord") );
		String storetype =( request.getParameter("storetype") == null ? "" : request.getParameter("storetype") );
		String storeArea =( request.getParameter("storeArea") == null ? "": request.getParameter("storeArea") );
		
		System.out.println("searchWord = " + searchWord + ", storetype = " + storetype + ", storeArea = " + storeArea);
		
		
		int currentPage =  ( request.getParameter("currentPage") == null ? 1 : Integer.parseInt(request.getParameter("currentPage")) );  // 현재 페이지. 
		int limitCount =  ( request.getParameter("limitCount") == null ? 20: Integer.parseInt(request.getParameter("limitCount")) );  // 현재 페이지. 
		int totalCount = 0;
		
		
		request.setAttribute("currentPage", currentPage);		
		
		
		List<StoreDTO> list = null;
		
		if( searchWord == "" && storeArea == "") { 
			list = service.selectlist(currentPage, limitCount);		
			totalCount = service.getTotal();
		} else {
			list = service.searchlist(searchWord, currentPage, limitCount, storeArea);				
			totalCount = service.getTotals(searchWord, storeArea);
		}
		
		request.setAttribute("list", list);
		request.setAttribute("storeArea", storeArea);		
		request.setAttribute("totalCount", totalCount);
		System.out.println("totalCount =" + totalCount);
		
		return "/support/storeSearch.jsp";
		
		
		}
		
}
	
	
