package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.ScheduleVO;
import com.ezen.biz.dto.TicketVO;

@Repository
public class TicketDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 예매현황 보기
	public List<TicketVO> getBestSoldPlayList() {
		
		return mybatis.selectList("adminMapper.getTicketList");
	}
	
	
	
	// 예매 등록 (tseq 즉시 반환)
	public int insertTicket(TicketVO vo) {
		
		mybatis.insert("ticketMapper.insertTicket", vo);
		
		return vo.getTseq();
	}
	
	// 예매 등록 후 tseq값으로 예매정보 가져오기
	public TicketVO completeTicket(TicketVO vo) {
		
		return mybatis.selectOne("ticketMapper.completeTicket", vo);
	}
	
	// 예매시 좌석수 증가
	public void updateBookSeat(ScheduleVO vo) {
		
		mybatis.update("ticketMapper.updateBookSeat", vo);
	}
	
	// 예매된 좌석번호 조회
	public List<String> getBookSeatID(TicketVO vo) {
		
		return mybatis.selectList("ticketMapper.getBookSeatID", vo);
	}
	
}
