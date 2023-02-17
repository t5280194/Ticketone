package com.ezen.biz.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.AdminDAO;
import com.ezen.biz.dto.TicketVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO aDao;
	
	// 예매순 추천공연 3개
	@Override
	public List<TicketVO> getTicketList(TicketVO vo) {
		
		return aDao.listTicket(vo);
	}
	


}
