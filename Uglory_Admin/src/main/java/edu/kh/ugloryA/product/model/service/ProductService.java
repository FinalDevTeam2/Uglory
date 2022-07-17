package edu.kh.ugloryA.product.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.ugloryA.farm.model.vo.Farm;
import edu.kh.ugloryA.product.model.vo.Product;
import edu.kh.ugloryA.product.model.vo.ProductCategory;

public interface ProductService {

	/**
	 * 상품 전체 조회
	 * @return productList
	 */
	List<Product> selectAll();

	/**
	 * 상품 상세 조회
	 * @param productCode
	 * @return detailMap
	 */
	Map<String, Object> productDetail(int productCode);

	/**
	 * 상품 품절 처리 서비스
	 * @param productCode
	 * @return result
	 */
	int soldout(int productCode);

	/**
	 * 상품 입고 처리 서비스
	 * @param productCode
	 * @return result
	 */
	int stocked(int productCode);

	/**
	 * 상품 카테고리 조회
	 * @return catedoryList
	 */
	List<ProductCategory> selectCategory();

	/**
	 * 상품 농장 조회
	 * @return farmList
	 */
	List<Farm> selectFarmList();
	
	
	
	
	
	
	

}
