package product.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import product.domain.RestockAlarmDTO;
import product.service.SelectProductService;

public class AlarmCompleteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		if (request.getMethod().equalsIgnoreCase("POST")) {

			HttpSession session = request.getSession();
			UserDTO member = (UserDTO) session.getAttribute("member");
			String userCode = member.getUserCode();

			String pdCode = request.getParameter("pdCode");
			String color = request.getParameter("color");
			String sizeValue = request.getParameter("sizeValue");
			String colorCode = request.getParameter("colorCode");
			String pdName = request.getParameter("pdName");
			String imgUrl = request.getParameter("imgUrl");

			RestockAlarmDTO alarmDto = new RestockAlarmDTO(userCode, pdCode, color, sizeValue, colorCode, pdName, imgUrl);
			request.setAttribute("alarmDto", alarmDto);
			
			SelectProductService productService = SelectProductService.getInstance();
			productService.applyAlarm(alarmDto);

			return "/product/warehousingAlarmComplete.jsp";
		}

		return null;
	}
}
