package edu.kh.ugloryC.product.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import edu.kh.ugloryC.product.model.service.OptionService;
import edu.kh.ugloryC.product.model.service.ProductService;
import edu.kh.ugloryC.product.model.vo.OptionType;
import edu.kh.ugloryC.product.model.vo.ProductDetail;


@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@Autowired
	private OptionService optionService;
	
	Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	// 상품 상세 조회
	@GetMapping("/detail/{categoryNo}/{productCode}")
	public String productDetail(@PathVariable("categoryNo") int categoryNo,
							    @PathVariable("productCode") int productCode,
							    Model model,
							    HttpServletRequest req, HttpServletResponse resp) {
							
		ProductDetail detail = service.productDetail(productCode);
	
		// 상품에 따른 옵션 조회
		if(detail != null) { // 상세 조회 성공 시
			
			List<OptionType> optionList = optionService.selectOptionList(productCode);
			model.addAttribute("optionList", optionList);
			
		}
		
		// 별점 카운트, 리뷰 카운트 필요
		
		model.addAttribute("detail", detail);
		
		return "product/productDetail";
	}			
	
	// 선택한 옵션 조회
	@ResponseBody
	@PostMapping("/detail/optionSelect")
	public String optionSelect(int optionCode) {
		
		List<OptionType> optionList = optionService.selectOption(optionCode);
		
		return new Gson().toJson(optionList);
	}
	
	// 옵션 선택에 따른 총 가격 조회
	@ResponseBody
	@PostMapping("/detail/optionTotal")
	public int optionTotal(int productCode,
							   int optionCode,
							   @RequestParam Map<String, Object> paramMap) {
		
		paramMap.put("productCode", productCode);
		paramMap.put("optionCode", optionCode);
		
		int result = service.totalAmount(paramMap);
		
		return result;
	}
	
	// 결제 페이지 전환
	@GetMapping("/order")
	public String productOrder(
							   // loginMember 가져오기
							   Model model) {
		
		// 로그인되어있을 시 결제 페이지로 전환 가능 코드 추가
		// if(loginMember != null){
		
		// else {
			
		
		return "product/productOrder";
	}
}
