package support.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import support.domain.NoticeDTO;
import support.service.SupportService;

public class ViewNoticeHandler implements CommandHandler{

   @Override
   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	  System.out.println("> ViewNoticeHandler.process() 호출됨!!");
	  
      // view.action?noti_seq=
      int noti_seq = Integer.parseInt( request.getParameter("noti_seq") );
      
      
      
      SupportService contentService = SupportService.getInstance();
      NoticeDTO notice = contentService.selectOne(noti_seq);
      
      request.setAttribute("notice", notice);
      
      return "/support/noticeDetail.jsp";
   }

}