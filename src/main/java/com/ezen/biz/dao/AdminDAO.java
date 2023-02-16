package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.TicketVO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 예매현황 보기
	public List<TicketVO> listTicket() {
		
		return mybatis.selectList("adminMapper.listTicket");
	}
	
}
