package com.ezen.biz.play;

import java.util.List;

import com.ezen.biz.dto.ScheduleVO;
import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.dto.PlayVO;

public interface PlayService {
	
	// 예매순 추천공연 3개
	List<PlayVO> getBestSoldPlayList();
	
	// 좋아요순 추천공연 5개
	List<PlayVO> getBestLikePlayList();
	
	// 카테코리별 공연 보기
	List<PlayVO> getPlayListByKind(String play_kind);
	
	// 공연 추가
	/*
	void addPlay(PlayVO vo);
	*/
	
	List<PlayVO> getPlayList();
	
	// 공연 상세 정보
	PlayVO getPlay(PlayVO vo);
	
	// 공연 검색
	List<PlayVO> getPlayListBySearch(String play_name);

	List<ScheduleVO> getPlayScheduleList(String name);
	
	public TheaterVO getRemainedSeat(int seq);
}