package productlist.command;

import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import productlist.domain.ProductImgDTO;
import productlist.domain.ProductListDTO;
import productlist.domain.ProductReviewDTO;
import productlist.domain.ProductSizeStockDTO;
import productlist.service.NEWBESTpListImgService;
import productlist.service.NEWBESTpReviewService;
import productlist.service.NEWBESTstockService;


public class ProductListNewBestHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String cateGrpCode = request.getParameter("cateGrpCode");
		String cIdx = request.getParameter("cIdx");//new best
		
		//1. 상품이미지
		NEWBESTpListImgService pNewBestService = NEWBESTpListImgService.getIinstance();
		LinkedHashMap<ProductListDTO, ArrayList<ProductImgDTO>> pImgNewBestMap = pNewBestService.seletNewBestProductImg(cateGrpCode, cIdx);
		
		//2. 상품재고
		NEWBESTstockService pNewBestStockService = NEWBESTstockService.getIinstance();
		LinkedHashMap<String, ArrayList<ProductSizeStockDTO>> pStockNewBestMap = pNewBestStockService.seletProductSizeStock(cateGrpCode, cIdx);
		
		
		//3. 리뷰
		NEWBESTpReviewService previewservice = NEWBESTpReviewService.getIinstance();
		LinkedHashMap<String, ProductReviewDTO> pReviewNewBest = previewservice.selectProductReview(cateGrpCode, cIdx);
		
		request.setAttribute("pImgNewBestMap", pImgNewBestMap);
		request.setAttribute("pStockNewBestMap", pStockNewBestMap);
		request.setAttribute("pReviewNewBest", pReviewNewBest);
		
		
		
		return "/productList/itemListNewBest.jsp";
	}

}
