package com.ezen.biz.play;

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
	
	// 공연 추가
	/*
	public void addPlay(PlayVO vo) {
		
		pDao.addPlay(vo);
	}
	*/
	
	@Override
	public List<PlayVO> getPlayList() {
		
		return pDao.getPlayList();
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

	@Override
	public List<ScheduleVO> getPlayScheduleList(String name) {
		
		return pDao.getPlayScheduleList(name);
	}

	@Override
	public TheaterVO getRemainedSeat(int seq) {
		
		return pDao.getRemainedSeat(seq);
	}

}
