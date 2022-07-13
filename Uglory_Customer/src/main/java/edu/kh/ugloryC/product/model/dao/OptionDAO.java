package edu.kh.ugloryC.product.model.dao;

import java.util.List;

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
}