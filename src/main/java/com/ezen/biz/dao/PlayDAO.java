package com.ezen.biz.dao;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.ScheduleVO;
import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.dto.PlayVO;

@Repository
public class PlayDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 예매순 추천공연 3개
	public List<PlayVO> getBestSoldPlayList() {
		
		return mybatis.selectList("playMapper.getBestSoldPlayList");
	}
	
	// 좋아요순 추천공연 5개
	public List<PlayVO> getBestLikePlayList() {
		
		return mybatis.selectList("playMapper.getBestLikePlayList");
	}
	
	// 카테고리별 공연 조회
	public List<PlayVO> getPlayListByKind(String play_kind) {
		System.out.println("playDAO카테고리별 보기");
		return mybatis.selectList("playMapper.getPlayListByKind", play_kind);
	}
	
	// 공연 상세 정보
	public PlayVO getPlay(PlayVO vo) {
		
		return mybatis.selectOne("playMapper.getPlay", vo);
	}
	
	// 공연 검색
	public List<PlayVO> getPlayListBySearch(String play_name){
		
		return mybatis.selectList("playMapper.getPlayListBySearch", play_name);
	}
	
	
	
	
	// 공연 전체 회차 정보 조회
	public List<ScheduleVO> getPlayScheduleList(int pseq) {
		
		return mybatis.selectList("ticketMapper.getPlayScheduleList", pseq);
	}
	
	// 공연 일정 번호 조회
	public int getScheduleSeq(Date date) {
		
		return mybatis.selectOne("ticketMapper.getScheduleSeq", date);
	}
	
	
	// 예매된 공연 좌석수 조회
	public List<ScheduleVO> getBookSeat(int seq) {
		
		return mybatis.selectList("ticketMapper.getBookSeat", seq);
	}
	
	// 공연 일정 조회 
	public ScheduleVO getSchedule(ScheduleVO vo) {
		
		return mybatis.selectOne("ticketMapper.getSchedule", vo);
	}
	
	// 공연 전체 좌석수 조회
	public TheaterVO getTotalSeat(int pseq) {
		
		return mybatis.selectOne("ticketMapper.getTotalSeat", pseq);
	}
}
