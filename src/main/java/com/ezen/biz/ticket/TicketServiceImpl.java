package com.ezen.biz.ticket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.AdminDAO;
import com.ezen.biz.dao.TicketDAO;
import com.ezen.biz.dto.ScheduleVO;
import com.ezen.biz.dto.TicketVO;

@Service
public class TicketServiceImpl implements TicketService {
	
	@Autowired
	private TicketDAO tDao;

	
	// 예매 등록
	@Override
	public int insertTicket(TicketVO vo) {
		
		return tDao.insertTicket(vo);
	}
	
	// 예매 등록 후 tseq값으로 예매정보 가져오기
	@Override
	public TicketVO completeTicket(TicketVO vo) {
		
		return tDao.completeTicket(vo);
	}

	// 예매시 좌석수 증가
	@Override
	public void updateBookSeat(ScheduleVO vo) {
		
		tDao.updateBookSeat(vo);
	}

	// 예매된 좌석번호 조회
	@Override
	public List<String> getBookSeatID(TicketVO vo) {
		
		return tDao.getBookSeatID(vo);
	}

}
