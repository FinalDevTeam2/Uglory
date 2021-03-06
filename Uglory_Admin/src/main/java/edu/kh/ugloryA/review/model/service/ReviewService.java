package edu.kh.ugloryA.review.model.service;

import java.util.Map;

import edu.kh.ugloryA.review.model.vo.ReviewDetail;

public interface ReviewService {

	/**
	 * 전체 리뷰 내역 조회
	 * @return reviewList
	 */
	Map<String, Object> selectAllReview(int cp);

	
	/**
	 * 리뷰 검색 내역 조회
	 * @param key
	 * @param query
	 * @return reviewList
	 */
	Map<String, Object> searchReview(int cp, String key, String query);


	/**
	 * 리뷰 상세 내역 조회
	 * @param reviewNo
	 * @return
	 */
	ReviewDetail selectReviewDetail(int reviewNo);


	/**
	 * 리뷰 삭제
	 * @param reviewNo
	 * @return
	 */
	int deleteReview(int reviewNo);


	/**
	 * 리뷰 수 조회
	 * @return
	 */
	int countReview();

}
