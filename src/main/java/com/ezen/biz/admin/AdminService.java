package com.ezen.biz.admin;

import java.util.List;

import com.ezen.biz.dto.AdminVO;
import com.ezen.biz.dto.PlayVO;
import com.ezen.biz.dto.ScheduleVO;
import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.dto.TicketVO;

public interface AdminService {
	
	// 관리자 로그인 정보
	AdminVO getAdmin(String aid);
	
	// 예매현황 보기
	List<TicketVO> getTicketList(TicketVO vo);
	
	// 공연정보 임시 테이블에 저장
	public int insertPlayTemp(PlayVO vo);
	
	// add_play2 공연스케쥴 저장
	public void insertPlay2Temp(ScheduleVO svo);
	
	// add_play3 공연이미지&내용 저장
	public int insertPlay3Temp(PlayVO vo);
	
	// add_play4 좌석별 가격 & 할인정보
	void insertPlay4Temp(PlayVO vo);
	
	// theater_id로 공연장정보 가져오기
	TheaterVO gettheater(TheaterVO tvo);
	
	// add_play 최종등록
	void insertPlay(PlayVO vo);

}