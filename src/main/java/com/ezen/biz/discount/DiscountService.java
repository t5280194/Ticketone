package com.ezen.biz.discount;

import java.util.List;

import com.ezen.biz.dto.DiscountVO;

public interface DiscountService {

	List<DiscountVO> getDiscountList();
	
	DiscountVO getDiscount(DiscountVO vo);
	
}
