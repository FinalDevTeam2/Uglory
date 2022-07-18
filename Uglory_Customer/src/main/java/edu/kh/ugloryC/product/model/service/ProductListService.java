package edu.kh.ugloryC.product.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.ugloryC.product.model.vo.ProductList;

public interface ProductListService {

	// 상품 목록 조회
	List<ProductList> productList();

	// 카테고리별 상품 조회
	List<ProductList> category(int selectCategoryNo);


	
	
}
