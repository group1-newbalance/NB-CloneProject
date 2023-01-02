package product.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import product.domain.ProductColorDTO;
import product.domain.ProductDTO;
import product.service.SelectProductService;

public class AlarmCompleteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String pdCode = request.getParameter("pdCode");
		String size = request.getParameter("size");
		
		SelectProductService productService = SelectProductService.getInstance();

		ProductDTO pdDto = null;
		ProductColorDTO colorDto = null;

		pdDto = productService.selectProduct(pdCode);
		colorDto = productService.getPdColor(pdCode);

		request.setAttribute("pdDto", pdDto);
		request.setAttribute("colorDto", colorDto);
		request.setAttribute("size", size);
		
		return "/product/warehousingAlarmComplete.jsp";
	}

}
