package edu.kh.ugloryA.product.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.ugloryA.common.Util;
import edu.kh.ugloryA.farm.model.vo.Farm;
import edu.kh.ugloryA.payment.model.vo.SubsPaymentDetail;
import edu.kh.ugloryA.product.model.dao.ProductDAO;
import edu.kh.ugloryA.product.model.exception.InsertFailException;
import edu.kh.ugloryA.product.model.vo.OptionType;
import edu.kh.ugloryA.product.model.vo.Product;
import edu.kh.ugloryA.product.model.vo.ProductCategory;
import edu.kh.ugloryA.product.model.vo.ProductImage;
import edu.kh.ugloryA.product.model.vo.WeeklyList;
import edu.kh.ugloryA.product.model.vo.WeeklyProduct;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO dao;

	// 상품 전체 조회 구현
	@Override
	public List<Product> selectAll() {
		return dao.selectAll();
	}

	//상품 상세 조회 구현
	@Override
	public Map<String, Object> productDetail(int productCode) {
		
		//상품 정보
		Product product = dao.selectProduct(productCode);
		
		//농장 정보
		Farm farm = dao.selectFarm(productCode);
		
		//상품이미지
		List<ProductImage> imageList = dao.selectPImage(productCode);
		
		Map<String, Object> detailMap = new HashMap<String, Object>();
		
		detailMap.put("product", product);
		detailMap.put("farm", farm);
		detailMap.put("productImage", imageList);
		
		return detailMap;
	}

	//상품 품절 처리
	@Override
	public int soldout(int productCode) {
		return dao.soldout(productCode);
	}

	//상품 입고 처리
	@Override
	public int stocked(int productCode) {
		return dao.stocked(productCode);
	}

	//상품 카테고리 조회
	@Override
	public List<ProductCategory> selectCategory() {
		return dao.selectCategory();
	}

	//상품 농장 조회
	@Override
	public List<Farm> selectFarmList() {
		return dao.selectFarmList();
	}

	//상품 등록 서비스 구현
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertProduct(Product product, List<MultipartFile> imageList, String webPath, String folderPath) throws IOException {
		
		//게시글 삽입
		int productCode = dao.insertProduct(product);
		
		if(productCode > 0) {
			
			List<ProductImage> productImageList = new ArrayList<ProductImage>();
			List<String> reNameList = new ArrayList<String>();
			
			//이미지 삽입
			for(int i=0; i<imageList.size(); i++) {
				
				if(imageList.get(i).getSize() > 0) {
					
					String reName = Util.fileRename( imageList.get(i).getOriginalFilename() );
					reNameList.add(reName);
					
					ProductImage img = new ProductImage();
					img.setProductCode(productCode);
					img.setImageLevel(i);
					img.setImageRename(reName);
					img.setImageRoot(webPath + reName);
					
					productImageList.add(img);
				}
			}
			
			//서버에 이미지 저장
			if(!productImageList.isEmpty()) {
				int result = dao.insertProductImage(productImageList);
				
				if(result == productImageList.size()) {
					
					for(int i=0; i<productImageList.size(); i++) {
						
						int index = productImageList.get(i).getImageLevel();
						imageList.get(index).transferTo(new File(folderPath + reNameList.get(i)));
						
					}
					
				} else {
					throw new InsertFailException();
				}
			}
		}
		return productCode;
	}

	//상품 수정 서비스 구현
	@Override
	public int updateProduct(Product product, List<MultipartFile> imageList, String webPath, String folderPath) throws IOException {
		
		int result = dao.updateProduct(product);
		
		if(result > 0){
			
			int productCode = product.getProductCode();
			
			List<ProductImage> productImageList = new ArrayList<ProductImage>();
			List<String> reNameList = new ArrayList<String>();
			
			//이미지 삽입
			for(int i=0; i<imageList.size(); i++) {
				
				if(imageList.get(i).getSize() > 0) {
					
					String reName = Util.fileRename( imageList.get(i).getOriginalFilename() );
					reNameList.add(reName);
					
					ProductImage img = new ProductImage();
					img.setProductCode(productCode);
					img.setImageLevel(i);
					img.setImageRename(reName);
					img.setImageRoot(webPath + reName);
					
					productImageList.add(img);
				}
			}
			
			//서버에 이미지 저장
			if(!productImageList.isEmpty()) {
				
				for(ProductImage img : productImageList) {
					
					result = dao.updateProductImage(img);
					
					if(result == 0) {
						
						result = dao.insertImageOne(img);
					}
				}
				
				if(result != 0) {
					
					for(int i=0; i<productImageList.size(); i++) {
						
						int index = productImageList.get(i).getImageLevel();
						imageList.get(index).transferTo(new File(folderPath + reNameList.get(i)));
					}
				} 
			}
		}
		
		return result;
	}

	//옵션 등록 서비스 구현
	@Override
	public int insertOption(OptionType optionType) {
		return dao.insertOption(optionType);
	}

	//옵션 삭제 서비스 구현
	@Override
	public int deleteOption(int optionCode) {
		return dao.deleteOption(optionCode);
	}

	//주별 상품 리스트 조회
	@Override
	public WeeklyList selectWeeklyList(String key) {	
		return dao.selectWeeklyList(key);
	}

	//주별 상품 리스트 만들기
	@Override
	public int insertWeeklyList(String key) {
		return dao.insertWeeklyList(key);
	}

	//주별 상품 목록 조회
	@Override
	public List<WeeklyProduct> selectWeeklyProduct(int productListNo) {
		return dao.selectWeeklyProduct(productListNo);
	}

	//상품 옵션 조회
	@Override
	public List<OptionType> selectOption(int productCode) {
		return dao.selectOptionType(productCode);
	}

	//상품 목록 중복 검사
	@Override
	public int listDupCheck(Map<String, Object> map) {
		return dao.listDupCheck(map);
	}

	//상품 목록 추가
	@Override
	public int insertWeeklyProduct(Map<String, Object> map) {
		return dao.insertWeeklyProduct(map);
	}

	//상품 목록 삭제
	@Override
	public int deleteWeeklyProduct(int productNo) {
		return dao.deleteWeeklyProduct(productNo);
	}

	//주별 상품 업데이트(스케쥴러 용)
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int weeklyUpdate() {
		
		int result = 0;
		int count = 0;
		String key = "T";
		
		result = dao.weeklyUpdate(key);
		
		if(result > 0) {
			
			count++;
			
			key = "N";
			result = dao.weeklyUpdate(key);
			
			if(result > 0) {
				
				count++;
				
				key = "A";
				result = dao.weeklyUpdate(key);
				
				if(result > 0) {
					count++;					
				}
			}
		}
		return count;
	}

	// 구독 멤버 번호 조회
	@Override
	public List<String> selectPhoneList() {
		return dao.selectPhoneList();
	}

	//이번주 상품 목록 조회하기
	@Override
	public List<WeeklyProduct> selectThisWeek() {
		return dao.selectThisWeek();
	}

	//상품 이미지 디비리스트 조회(삭제용)
	@Override
	public List<String> selectProductDBList() {
		return dao.selectProductDBList();
	}

	//사용중인 옵션 카운트하기
	@Override
	public int countOption(int optionCode) {
		return dao.countOption(optionCode);
	}
	
	
}
