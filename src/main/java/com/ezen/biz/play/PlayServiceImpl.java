package com.ezen.biz.play;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.PlayDAO;
import com.ezen.biz.dto.ScheduleVO;
import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.dto.PlayVO;

@Service
public class PlayServiceImpl implements PlayService {

	@Autowired
	private PlayDAO pDao;
	
	// 예매순 추천공연 3개
	@Override
	public List<PlayVO> getBestSoldPlayList() {
		
		return pDao.getBestSoldPlayList();
	}
	
	// 좋아요순 추천공연 5개
	@Override
	public List<PlayVO> getBestLikePlayList() {
		
		return pDao.getBestLikePlayList();
	}
	
	// 카테고리별 보기
	@Override
	public List<PlayVO> getPlayListByKind(String play_kind) {
		System.out.println("playServiceImpl 카테고리별 보기");
		return pDao.getPlayListByKind(play_kind);
	}
	
	// 공연 상세 정보
	@Override
	public PlayVO getPlay(PlayVO vo) {
		
		return pDao.getPlay(vo);
	}
	
	// 공연 검색
	@Override
	public List<PlayVO> getPlayListBySearch(String play_name) {
		
		
		return pDao.getPlayListBySearch(play_name);
	}

	
	
	// 공연 전체 스케쥴 정보 조회
	@Override
	public List<ScheduleVO> getPlayScheduleList(int pseq) {
		
		return pDao.getPlayScheduleList(pseq);
	}
	
	// 스케쥴 번호 조회
	@Override
	public int getScheduleSeq(Date date) {
		
		return pDao.getScheduleSeq(date);
	}
	
	// 예매된 좌석수 조회
	@Override
	public List<ScheduleVO> getBookSeat(int seq) {
		
		return pDao.getBookSeat(seq);
	}
	
	// 공연 일정 조회
	@Override
	public ScheduleVO getSchedule(ScheduleVO vo) {
		
		return pDao.getSchedule(vo);
	}

	// 공연 전제 좌석수 조회
	@Override
	public TheaterVO getTotalSeat(int pseq) {
		
		return pDao.getTotalSeat(pseq);
	}




}
