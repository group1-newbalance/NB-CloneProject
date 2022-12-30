package product.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import member.service.CartService;
import mvc.command.CommandHandler;
import product.domain.ProductColorDTO;
import product.domain.ProductDTO;
import product.domain.ProductImageDTO;
import product.domain.ProductSizeDTO;
import product.service.SelectProductService;

public class SelectProductHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String pdCode = request.getParameter("pdCode");

		// 서비스 객체 생성
		SelectProductService productService = SelectProductService.getInstance();
		CartService cartService = CartService.getInstance();
		
		ProductDTO pdDto = null;
		ArrayList<ProductImageDTO> imgList = null;
		ArrayList<ProductSizeDTO> sizeList = null;
		ArrayList<ProductDTO> relatedPdList = null;
		ArrayList<ProductColorDTO> diffColorList = null;
		ProductColorDTO colorDto = null;
		int cartCount = 0;

		HttpSession session = request.getSession(false);

		
		if(session != null) {
			UserDTO member = (UserDTO) session.getAttribute("member");
			if(member != null) {
				pdDto = productService.selectProduct(pdCode, member.getUserCode()); 
				imgList = productService.selectImage(pdCode, member.getUserCode()); 
				sizeList = productService.selectSize(pdCode, member.getUserCode()); 
				relatedPdList = productService.selectRelatedProduct(pdCode, member.getUserCode());
				diffColorList = productService.diffColorProduct(pdCode,member.getUserCode()); 
				colorDto = productService.getPdColor(pdCode,member.getUserCode());
				cartCount = cartService.sumOfCartCount(member.getUserCode(), pdCode);

			}
		}

		// request 객체에 저장
		request.setAttribute("pdDto", pdDto);
		request.setAttribute("imgList", imgList);
		request.setAttribute("sizeList", sizeList);
		request.setAttribute("relatedPdList", relatedPdList);
		request.setAttribute("diffColorList", diffColorList);
		request.setAttribute("colorDto", colorDto);
		request.setAttribute("cartCount", cartCount);

		return "/product/productDetail.jsp";

	}

}
