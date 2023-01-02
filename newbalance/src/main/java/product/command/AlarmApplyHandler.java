package product.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import mvc.command.CommandHandler;
import product.domain.ProductColorDTO;
import product.domain.ProductDTO;
import product.domain.ProductSizeDTO;
import product.domain.RestockAlarmDTO;
import product.service.SelectProductService;

public class AlarmApplyHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return processGet(request, response);
		} else if (request.getMethod().equalsIgnoreCase("POST")) {
			return processPOST(request, response);
		}
		return null;
	}

	public String processGet(HttpServletRequest request, HttpServletResponse response) {
		
		String pdCode = request.getParameter("pdCode");
		
		SelectProductService productService = SelectProductService.getInstance();

		ProductDTO pdDto = null;
		ArrayList<ProductSizeDTO> sizeList = null;
		ArrayList<ProductColorDTO> diffColorList = null;
		ProductColorDTO colorDto = null;
	     
		
		pdDto = productService.selectProduct(pdCode);
		sizeList = productService.selectSize(pdCode);
		diffColorList = productService.diffColorProduct(pdCode);
		colorDto = productService.getPdColor(pdCode);
		
	    request.setAttribute("pdDto", pdDto);
	    request.setAttribute("sizeList", sizeList);
	    request.setAttribute("diffColorList", diffColorList);
	    request.setAttribute("colorDto", colorDto);
	      
	    return "/product/warehousingAlarmApply.jsp";

	}

	public String processPOST(HttpServletRequest request, HttpServletResponse response) {
	
		HttpSession session = request.getSession();
		UserDTO member = (UserDTO) session.getAttribute("member");
		String userCode = member.getUserCode();
				
		String pdCode = request.getParameter("pdCode");
		String color = request.getParameter("color");
		String sizeValue = request.getParameter("sizeValue");
		
		System.out.println(userCode + "/" + pdCode + "/" + color + "/" + sizeValue);
		
		RestockAlarmDTO dto = new RestockAlarmDTO(userCode, pdCode, color, sizeValue);
		
		SelectProductService productService = SelectProductService.getInstance();
		boolean ok = productService.applyAlarm(dto);

		
		String location = "/newbalance/product/warehousingAlarmComplete.action?pdCode=" + pdCode + "&size=" + sizeValue;
		try {
			response.sendRedirect(location);
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
		return null;
	}

	
}
