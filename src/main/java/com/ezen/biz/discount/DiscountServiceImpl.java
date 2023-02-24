package com.ezen.biz.discount;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.DiscountDAO;
import com.ezen.biz.dto.DiscountVO;

@Service
public class DiscountServiceImpl implements DiscountService {

	@Autowired
	private DiscountDAO dDao;
	
	@Override
	public List<DiscountVO> getDiscountList() {
		
		return dDao.getDiscountList();
	}

	@Override
	public DiscountVO getDiscount(DiscountVO vo) {
		
		return dDao.getDiscount(vo);
	}

}
