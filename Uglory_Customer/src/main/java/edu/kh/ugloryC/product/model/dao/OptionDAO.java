package edu.kh.ugloryC.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryC.product.model.vo.OptionType;

@Repository
public class OptionDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 옵션 조회 DAO
	 * @param productCode
	 * @return optionList
	 */
	public List<OptionType> selectOptionList(int productCode) {

		return sqlSession.selectList("optionMapper.selectOptionList", productCode);
	}

	/** 주문 페이지 내 옵션 조회 DAO
	 * @param map
	 * @return selectOptionList
	 */
	public List<OptionType> orderOptionSelect(Map<String, Object> map) {

		return sqlSession.selectList("optionMapper.orderOptionSelect", map);
	}

	
//	/** 선택된 옵션 리스트 DAO - js로 구현
//	 * @param optionCode
//	 * @return optionlist
//	 */
//	public List<OptionType> selectOption(int optionCode) {
//
//		return sqlSession.selectList("optionMapper.selectOption", optionCode);
//	}
}
