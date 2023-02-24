package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.PlayVO;
import com.ezen.biz.dto.ScheduleVO;
import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.dto.TicketVO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 예매현황 보기
	public List<TicketVO> listTicket(TicketVO vo) {
		
		return mybatis.selectList("adminMapper.listTicket", vo);
	}
	
	// add_play1 공연정보 임시 테이블에 저장
	public int insertPlayTemp(PlayVO vo) {
		
		mybatis.insert("adminMapper.insertPlayTemp", vo);
		System.out.println(">>>>>>>add_play1 DAO play_pseq 값 = " + vo.getPlay_pseq());
		
		return vo.getPlay_pseq();
	}
	
	// add_play2 공연스케쥴 저장
	public void insertPlay2Temp(ScheduleVO svo) {
		
		System.out.println(">>>>>>>add_play2 DAO play_pseq 값 = " + svo.getPlay_pseq());
		String[] schedule = svo.getAdd_play_schedule().split(",");
		
		for(int i=0; i<schedule.length; i++) {
			ScheduleVO vo = new ScheduleVO();
			
			vo.setAdd_play_schedule(schedule[i]);
			vo.setPlay_pseq(svo.getPlay_pseq());
			System.out.println("AdminDAO 스케쥴 배열화 : " + schedule[i]);
			
			mybatis.insert("adminMapper.insertPlay2Temp", vo);
		}
		System.out.println("insertPlay2TempDAO = " + svo.getPlay_pseq());
		
		
	}
	
	// add_play3 공연이미지&내용 저장
	public int insertPlay3Temp(PlayVO vo) {
		
		System.out.println(">>>>>>>add_play3 DAO 접근");
		mybatis.update("adminMapper.insertPlay3Temp", vo);
		
		return vo.getPlay_pseq();
	}
	
	// add_play4 좌석별 가격 & 할인정보
	public void insertPlay4Temp(PlayVO vo) {
		
		System.out.println(">>>>>>>add_play4 DAO 접근");
		mybatis.update("adminMapper.insertPlay4Temp", vo);
	}
	
	// theater_id로 공연장정보 가져오기
	public TheaterVO gettheater(TheaterVO tvo){
		System.out.println(">>>>>>>theaterid DAO 접근");
		
		return mybatis.selectOne("adminMapper.gettheater", tvo);
	}
	
	// add_play 최종등록
	public void insertPlay(PlayVO vo) {
		
		mybatis.insert("adminMapper.insertPlay", vo);
		
	}
	
}






