package com.ezen.biz.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DiscountVO {
	private int discount_id;
	private String discount_name;
	private int discount_rate;
}
