package manager.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.service.GetMemberListService;
import manager.service.MemberView;
import mvc.command.CommandHandler;


public class MemberListHandler implements CommandHandler{

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
      System.out.println("MemberListHandler.process() 호출됨...");

      String  pCurrentPage = request.getParameter("page");  // 현재페이지 번호  page 파라미터명
      int currentPage = 1;
      if( pCurrentPage != null ) {
         currentPage = Integer.parseInt( pCurrentPage );
      }

      GetMemberListService memberListService = GetMemberListService.getInstance();
      //  
      MemberView viewData  = memberListService.getMemberList(currentPage);
System.out.println("출력....");
      request.setAttribute("viewData", viewData);  

      return "/manager/member_manager.jsp";  // 포워딩
   }

}