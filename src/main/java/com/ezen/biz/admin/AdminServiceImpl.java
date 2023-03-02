package com.ezen.biz.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.AdminDAO;
import com.ezen.biz.dto.AdminVO;
import com.ezen.biz.dto.PlayVO;
import com.ezen.biz.dto.ScheduleVO;
import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.dto.TicketVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO aDao;
	
	
	// 관리자 로그인 정보
	@Override
	public AdminVO getAdmin(String aid) {
		
		return aDao.getAdmin(aid);
	}
	
	
	// 예매순 추천공연 3개
	@Override
	public List<TicketVO> getTicketList(TicketVO vo) {
		
		return aDao.listTicket(vo);
	}
	
	// add_play2
	@Override
	public int insertPlayTemp(PlayVO vo) {
		
		return aDao.insertPlayTemp(vo);
	}
	
	// add_play2 공연스케쥴 저장
	@Override
	public void insertPlay2Temp(ScheduleVO svo) {
		
		aDao.insertPlay2Temp(svo);
	}

	// add_play3 공연이미지&내용 저장
	@Override
	public int insertPlay3Temp(PlayVO vo) {
		
		return aDao.insertPlay3Temp(vo);
	}

	// add_play4 좌석별 가격 & 할인정보
	@Override
	public void insertPlay4Temp(PlayVO vo) {
		
		aDao.insertPlay4Temp(vo);
		
	}

	// theater_id로 공연장정보 가져오기
	@Override
	public TheaterVO gettheater(TheaterVO tvo) {
		
		return aDao.gettheater(tvo);
	}
	
	// add_play 최종등록
	@Override
	public void insertPlay(PlayVO vo) {
		
		aDao.insertPlay(vo);
		
	}





}
