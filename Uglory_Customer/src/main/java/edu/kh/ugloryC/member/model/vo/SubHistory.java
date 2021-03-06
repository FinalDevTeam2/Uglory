package edu.kh.ugloryC.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
public class SubHistory {

	private String subOrderNo; // 주문번호
	private String subPayDate;// 주문 날짜
	
	private String subName;	//구독상품 이름
	private int subPayAmount;// 총가격
	private String deliveryFlag; // 배송 상태

	
	
}
