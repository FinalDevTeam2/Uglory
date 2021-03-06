package edu.kh.ugloryA.review.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryA.review.model.vo.Pagination;
import edu.kh.ugloryA.review.model.vo.Review;
import edu.kh.ugloryA.review.model.vo.ReviewDetail;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(ReviewDAO.class);

	
	/**
	 * 전체 리뷰 내역 조회
	 * @param pagination 
	 * @return reviewList
	 */
	public List<Review> selectAllReview(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit();
		
		RowBounds rowbounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("reviewMapper.selectAllReview", null, rowbounds);
	}

	
	/**
	 * 리뷰 검색 내역 조회
	 * @param pagination 
	 * @return reviewList
	 */
	public List<Review> searchReview(String key, String query, Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() -1) * pagination.getLimit();
		
		RowBounds rowbounds = new RowBounds(offset, pagination.getLimit());
		
		Map<String,	Object> map = new HashMap<String, Object>();
		map.put("key", key);
		map.put("query", query);
		
		return sqlSession.selectList("reviewMapper.searchReview", map, rowbounds);
	}


	/**
	 * 리뷰 상세 내역 조회
	 * @param reviewNo
	 * @return
	 */
	public ReviewDetail selectReviewDetail(int reviewNo) {
		return sqlSession.selectOne("reviewMapper.selectReviewDetail", reviewNo);
	}


	/**
	 * 리뷰 삭제
	 * @param reviewNo
	 * @return
	 */
	public int deleteReview(int reviewNo) {
		return sqlSession.update("reviewMapper.deleteReview", reviewNo);
	}


	/**
	 * 리뷰 수 조회
	 * @return
	 */
	public int countReview() {
		return sqlSession.selectOne("reviewMapper.countReview");
	}


	/**
	 * 검색한 리뷰 수 조회
	 * @param key
	 * @param query
	 * @return
	 */
	public int searchListCount(String key, String query) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("key", key);
		paramMap.put("query", query);
		
		return sqlSession.selectOne("reviewMapper.searchListCount", paramMap);
	}

	
}
