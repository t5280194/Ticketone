package com.ezen.biz.ticket;

import java.util.List;

import com.ezen.biz.dto.ScheduleVO;
import com.ezen.biz.dto.TicketVO;

public interface TicketService {
	

	
	
	// 예매 등록
	void insertTicket(TicketVO vo);
	
	// 예매시 좌석수 증가
	void updateBookSeat(ScheduleVO vo);
	
	// 예매된 좌석번호 조회
	List<String> getBookSeatID(TicketVO vo);

}