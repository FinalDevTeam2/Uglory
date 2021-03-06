package edu.kh.ugloryC.subscription.model.vo;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class OrderInfo {
	
	private int box;
	private String cycle;
	private String payNo;
	private String subsOrderNo;
	private String inputName;
	private String inputPhone;
	private String address;
	private String inputDelText;
	private int memberNo;
	private Date firstDelDate;
	
	

}
