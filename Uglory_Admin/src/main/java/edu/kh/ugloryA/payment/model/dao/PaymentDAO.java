package edu.kh.ugloryA.payment.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.ugloryA.payment.model.vo.Chart;
import edu.kh.ugloryA.payment.model.vo.MonthlyChart;
import edu.kh.ugloryA.payment.model.vo.Pagination;
import edu.kh.ugloryA.payment.model.vo.Payment;
import edu.kh.ugloryA.payment.model.vo.ProductPaymentDetail;
import edu.kh.ugloryA.payment.model.vo.Refund;
import edu.kh.ugloryA.payment.model.vo.SubsPaymentDetail;

@Repository
public class PaymentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private Logger logger = LoggerFactory.getLogger(PaymentDAO.class);

	
	/**
	 * 결제내역 전체 개수 조회 DAO
	 */
	public int listCount() {
		return sqlSession.selectOne("paymentMapper.listCount");
	}
	
	
	/**
	 * 전체 결제 내역 조회 DAO
	 * @param pagination 
	 * @return
	 */
	public List<Payment> selectAllPayment(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage()-1) * pagination.getLimit();
		
		RowBounds rowbounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("paymentMapper.selectAllPayment", null, rowbounds);
	}

	/**
	 * 결제내역 검색 개수 조회 DAO
	 * @return
	 */
	public int searchListCount(String key, String query) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("key", key);
		paramMap.put("query", query);
		
		return sqlSession.selectOne("paymentMapper.searchListCount", paramMap);
	}
	
	
	/**
	 * 결제 내역 검색 조회 DAO
	 * @param key
	 * @param query
	 * @param pagination 
	 * @return
	 */
	public List<Payment> searchPayment(String key, String query, Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() -1) * pagination.getLimit();
		
		RowBounds rowbounds = new RowBounds(offset, pagination.getLimit());
		
		Map<String,	Object> map = new HashMap<String, Object>();
		map.put("key", key);
		map.put("query", query);
		
		return sqlSession.selectList("paymentMapper.searchPayment", map, rowbounds);
	}


	/**
	 * 개별 상품 상세 조회
	 * @param payNo
	 * @return pPaymentDetail
	 */
	public ProductPaymentDetail selectProductPaymentDetail(String payNo) {
		return sqlSession.selectOne("paymentMapper.selectProductPaymentDetail", payNo);
	}


	/**
	 * 구독 상품 상세 조회
	 * @param payNo
	 * @return sPaymentDetail
	 */
	public SubsPaymentDetail selectSubsPaymentDetail(String payNo) {
		return sqlSession.selectOne("paymentMapper.selectSubsPaymentDetail", payNo);
	}


	/**
	 * 당일 매출 조회
	 * @return
	 */
	public int dailySales() {
		return sqlSession.selectOne("paymentMapper.dailySales");
	}


	/**
	 * 총 매출 조회
	 * @return
	 */
	public int totalSales() {
		return sqlSession.selectOne("paymentMapper.totalSales");
	}


	/**
	 * 환불 내역 조회
	 * @return
	 */
	public List<Refund> selectRefundList() {
		return sqlSession.selectList("paymentMapper.selectRefundList");
	}


	/**
	 * 개별 상품 결제 건수 
	 * @return
	 */
	public int prodPaymentCount() {
		return sqlSession.selectOne("paymentMapper.prodPaymentCount");
	}


	/**
	 * 환불 요청 건수
	 * @return
	 */
	public int refundCount() {
		return sqlSession.selectOne("paymentMapper.refundCount");
	}


	/**
	 * 환불 완료 건수
	 * @return
	 */
	public int refundDone() {
		return sqlSession.selectOne("paymentMapper.refundDone");
	}


	/**
	 * 구독 건수
	 * @return
	 */
	public int subsCount() {
		return sqlSession.selectOne("paymentMapper.subsCount");
	}


	/**
	 * 환불 처리
	 * @param orderCode
	 * @return
	 */
	public int refundHandling(String orderCode) {
		return sqlSession.update("paymentMapper.refundHandling", orderCode);
	}


	/**
	 * 일별 차트 데이터 조회
	 * @return
	 */
	public Chart selectChartData() {
		return sqlSession.selectOne("paymentMapper.selectChartData");
	}


	/**
	 * 월별 차트 데이터 조회
	 * @return
	 */
	public List<MonthlyChart> selectMonthlyChartData() {
		return sqlSession.selectList("paymentMapper.selectMonthlyChartData");
	}



	
	

	
}
