package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.TicketVO;

@Repository
public class TicketDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 예매현황 보기
	public List<TicketVO> getBestSoldPlayList() {
		
		return mybatis.selectList("adminMapper.getTicketList");
	}
	
}
