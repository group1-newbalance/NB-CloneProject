package product.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.domain.UserDTO;
import member.service.CartService;
import mvc.command.CommandHandler;
import product.domain.CartCountDTO;
import product.domain.ProductColorDTO;
import product.domain.ProductDTO;
import product.domain.ProductImageDTO;
import product.domain.ProductSizeDTO;
import product.domain.ReviewDTO;
import product.domain.ReviewImgDTO;
import product.service.SelectProductService;

public class SelectProductHandler implements CommandHandler {

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

		// 서비스 객체 생성
		SelectProductService productService = SelectProductService.getInstance();
		CartService cartService = CartService.getInstance();
		
		ProductDTO pdDto = null;
		ArrayList<ProductImageDTO> imgList = null;
		ArrayList<ProductSizeDTO> sizeList = null;
		ArrayList<ProductDTO> relatedPdList = null;
		ArrayList<ProductColorDTO> diffColorList = null;
		ProductColorDTO colorDto = null;
		ArrayList<CartCountDTO> cartCntList = null;
		LinkedHashMap<ReviewDTO, ArrayList<ReviewImgDTO>> revMap = null;
		ReviewDTO rDto = null;

		HttpSession session = request.getSession(false);
		if(session != null) {
			UserDTO member = (UserDTO) session.getAttribute("member");
			if(member != null) {
				request.setAttribute("userCode", member.getUserCode());   // ${ userCode }
				
				//cartCntList = cartService.sumOfCartCount(member.getUserCode(), pdCode);
				//request.setAttribute("cartCntList", cartCntList);
			}
		}
	
		pdDto = productService.selectProduct(pdCode); 
		imgList = productService.selectImage(pdCode); 
		sizeList = productService.selectSize(pdCode); 
		relatedPdList = productService.selectRelatedProduct(pdCode);
		diffColorList = productService.diffColorProduct(pdCode); 
		colorDto = productService.getPdColor(pdCode);
		revMap = productService.selectReview(pdCode);
		rDto = productService.totalReview(pdCode);
		
		// request 객체에 저장;
		request.setAttribute("pdDto", pdDto);
		request.setAttribute("imgList", imgList);
		request.setAttribute("sizeList", sizeList);
		request.setAttribute("relatedPdList", relatedPdList);
		request.setAttribute("diffColorList", diffColorList);
		request.setAttribute("colorDto", colorDto);
		request.setAttribute("revMap", revMap);
		request.setAttribute("rDto", rDto);

		return "/product/productDetail.jsp";

	}
	
	
	public String processPOST(HttpServletRequest request, HttpServletResponse response) {
	
		HttpSession session = request.getSession();
		UserDTO member = (UserDTO) session.getAttribute("member");
		String userCode = member.getUserCode();
				
		String pdCode = request.getParameter("pd_code");
		int pdPrice = Integer.parseInt(request.getParameter("pd_price").replaceAll(",", ""));
		String pdSize = request.getParameter("pd_size");
		int pdAmount = Integer.parseInt(request.getParameter("pd_amount"));
		
		System.out.println(userCode + "/" + pdCode + "/" + pdPrice + "/" + pdSize + "/" + pdAmount);

		String location = "/newbalance/payment/order.action?pdCode=" 
					+ pdCode + "&pdPrice=" + pdPrice + "&pdSize=" + pdSize + "&pdAmount=" + pdAmount;
		try {
			response.sendRedirect(location);
		} catch (IOException e) {
			e.printStackTrace();
		} 

		return null;

	}
}
