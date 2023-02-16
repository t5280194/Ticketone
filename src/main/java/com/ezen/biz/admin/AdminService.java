package com.ezen.biz.admin;

import java.util.List;

import com.ezen.biz.dto.TicketVO;

public interface AdminService {
	
	// 예매현황 보기
	List<TicketVO> getTicketList();

}