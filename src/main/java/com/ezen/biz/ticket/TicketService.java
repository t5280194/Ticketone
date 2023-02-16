package com.ezen.biz.ticket;

import java.util.List;

import com.ezen.biz.dto.TicketVO;

public interface TicketService {
	
	// 예매현황 보기
	List<TicketVO> getTicketList();

}