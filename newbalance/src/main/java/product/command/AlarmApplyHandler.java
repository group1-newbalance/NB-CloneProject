package product.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import product.domain.ProductColorDTO;
import product.domain.ProductDTO;
import product.domain.ProductSizeDTO;
import product.service.SelectProductService;

public class AlarmApplyHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
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

	
}
