package com.ezen.biz.ticket;

import java.util.List;

import com.ezen.biz.dto.ScheduleVO;
import com.ezen.biz.dto.TicketVO;

public interface TicketService {
	

	
	
	// 예매 등록(tseq값 바로 반환)
	public int insertTicket(TicketVO vo);
	
	// 예매 등록 후 tseq값으로 예매정보 가져오기
	TicketVO completeTicket(TicketVO vo);
	
	// 예매시 좌석수 증가
	void updateBookSeat(ScheduleVO vo);
	
	// 예매된 좌석번호 조회
	List<String> getBookSeatID(TicketVO vo);

}