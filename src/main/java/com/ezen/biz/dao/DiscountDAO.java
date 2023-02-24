package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.DiscountVO;

@Repository
public class DiscountDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<DiscountVO> getDiscountList(){
		
		return mybatis.selectList("ticketMapper.getDiscountList");
	}
	
	public DiscountVO getDiscount(DiscountVO vo) {
		
		return mybatis.selectOne("ticketMapper.getDiscount", vo);
	}
}
